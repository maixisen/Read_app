//
//  CRLoginView.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRLoginView.h"

@interface CRLoginView ()

@property(nonatomic, copy)NSString *phoneNumStr;

@property(nonatomic, copy)NSString *codeNumStr;

@end

@implementation CRLoginView

- (instancetype)init{
    if (self == [super init]) {
        self.isClearPhone = NO;
        [self addSubview:self.phoneView];
        [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.offset(0);
            make.height.offset(40*SCREEN_Proportion);
        }];
        [self addSubview:self.passwordView];
        [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phoneView.mas_bottom).offset(21*SCREEN_Proportion);
            make.left.and.right.offset(0);
            make.height.equalTo(self.phoneView.mas_height);
        }];
        [self addSubview:self.loginBtn];
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passwordView.mas_bottom).offset(39*SCREEN_Proportion);
            make.centerX.equalTo(self.mas_centerX);
            make.width.offset(130*SCREEN_Proportion);
            make.height.offset(35*SCREEN_Proportion);
        }];
        [self.loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)loginClick{
   if (self.isClearPhone == NO) {
        UITextField * textFiled = (UITextField*)self.phoneView.textField;
        if (textFiled.text != nil && textFiled.text.length > 0) {
            self.phoneNumStr = textFiled.text;
        }
        // 校验
        BOOL flag = [MUCheckoutTool validateMobile:self.phoneNumStr];
        if (flag) {
            UITextField * textFiled = (UITextField*)self.passwordView.textField;
            if (textFiled.text != nil && textFiled.text.length > 0) {
                self.codeNumStr = textFiled.text;
                NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                [dict sui_setObj:self.phoneNumStr forKey:@"phoneNum"];
                [dict sui_setObj:self.codeNumStr forKey:@"codeStr"];
                if ([_delegate respondsToSelector:@selector(loginClickWithLoginDict:)]) {
                    [_delegate performSelector:@selector(loginClickWithLoginDict:)withObject:dict];
                }
            }
        }
        else{
            // 提示
            iToast * itos = [[[[iToast makeText:@"手机号错误，请重新输入!"] setGravity:iToastGravityCenter] setCornerRadius:20.f] setFontSize:14];
            [itos.theSettings setImage:[UIImage imageNamed:@"error"] withLocation:iToastImageLocationLeft forType:iToastTypeWarning];
            [itos show:iToastTypeWarning];
        }
    }else{
        // 提示
        iToast * itos = [[[[iToast makeText:@"手机号错误，请重新输入!"] setGravity:iToastGravityCenter] setCornerRadius:20.f] setFontSize:14];
        [itos.theSettings setImage:[UIImage imageNamed:@"error"] withLocation:iToastImageLocationLeft forType:iToastTypeWarning];
        [itos show:iToastTypeWarning];
    }
}

#pragma mark -- textFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 1001) {
        self.phoneNumStr = textField.text;
    }
    else if (textField.tag == 1002){
        self.codeNumStr = textField.text;
    }
    self.isClearPhone = NO;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *str = [[textField.text stringByReplacingCharactersInRange:range withString:string] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (str != nil && str.length > 0) {
        if (self.isClearPhone == NO) {
            [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"login_nol"] forState:UIControlStateNormal];
            [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"login_hei"] forState:UIControlStateHighlighted];
        }
        self.isClearPhone = NO;
    }
    else if (str == nil || str.length == 0) {
        if (textField.tag == 1001) {
            self.phoneNumStr = @"";
        }else if (textField.tag == 1002){
            self.codeNumStr = @"";
        }
        
        if (([self.codeNumStr isEqualToString:@""] || self.codeNumStr.length == 0) && ([self.phoneNumStr isEqualToString:@""] || self.phoneNumStr.length == 0)) {
            [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"nologinBtn_nol"] forState:UIControlStateNormal];
            self.isClearPhone = YES;
        }
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{

    if (textField.tag == 1001) {
        self.phoneNumStr = @"";
    }else if (textField.tag == 1002){
        self.codeNumStr = @"";
    }
    
    if (([self.codeNumStr isEqualToString:@""] || self.codeNumStr.length == 0) && ([self.phoneNumStr isEqualToString:@""] || self.phoneNumStr.length == 0)) {
        [self.loginBtn setBackgroundImage:[UIImage imageNamed:@"nologinBtn_nol"] forState:UIControlStateNormal];
        self.isClearPhone = YES;
    }
    return YES;
}

// set&get
- (CRTextFieldView *)phoneView{
    if (_phoneView == nil) {
        _phoneView = [[CRTextFieldView alloc]init];
        _phoneView.placeholderStr = @"电话号码";
        _phoneView.textField.tag = 1001;
        _phoneView.textField.delegate = self;
        _phoneView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneView.backgroundColor = [UIColor colorWithHexString:@"1C1C1C"];
        _phoneView.leftImageView.image = [UIImage imageNamed:@"phoneImage"];
        _phoneView.isLockView = NO;
    }
    return _phoneView;
}

- (CRTextFieldView *)passwordView{
    if (_passwordView == nil) {
        _passwordView = [[CRTextFieldView alloc]init];
        _passwordView.textField.tag = 1002;
        _passwordView.textField.delegate = self;
        _passwordView.backgroundColor = [UIColor colorWithHexString:@"1C1C1C"];
        _passwordView.placeholderStr = @"登录密码";
        _passwordView.leftImageView.image = [UIImage imageNamed:@"passwordImage"];
        _passwordView.isLockView = YES;
    }
    return _passwordView;
}

- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc]init];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"nologinBtn_nol"] forState:UIControlStateNormal];
    }
    return _loginBtn;
}

@end
