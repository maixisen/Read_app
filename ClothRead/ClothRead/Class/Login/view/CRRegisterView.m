//
//  CRRegisterView.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRRegisterView.h"

@interface CRRegisterView ()<UITextFieldDelegate>

@property(nonatomic, assign)BOOL isClearPhone;

@property(nonatomic, copy)NSString *phoneNumStr;

@property(nonatomic, copy)NSString *passwordNumStr;

@property(nonatomic, copy)NSString *cmtPasswordNumStr;

@end

@implementation CRRegisterView

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
        [self addSubview:self.commitPasswordView];
        [self.commitPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passwordView.mas_bottom).offset(21*SCREEN_Proportion);
            make.left.and.right.offset(0);
            make.height.equalTo(self.passwordView.mas_height);
        }];
        [self addSubview:self.registerBtn];
        [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.commitPasswordView.mas_bottom).offset(39*SCREEN_Proportion);
            make.centerX.equalTo(self.mas_centerX);
            make.width.offset(130*SCREEN_Proportion);
            make.height.offset(35*SCREEN_Proportion);
        }];
        [self.registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)registerClick{
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
                self.passwordNumStr = textFiled.text;
                UITextField * c_textFiled = (UITextField*)self.commitPasswordView.textField;
                if (c_textFiled.text != nil && c_textFiled.text.length > 0) {
                    self.cmtPasswordNumStr = c_textFiled.text;
                    if ([self.cmtPasswordNumStr isEqualToString:self.passwordNumStr]) {
                        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                        [dict sui_setObj:self.phoneNumStr forKey:@"phoneNum"];
                        [dict sui_setObj:self.passwordNumStr forKey:@"passwordNumStr"];
                        [dict sui_setObj:self.cmtPasswordNumStr forKey:@"cmtPasswordNumStr"];
                        if ([_delegate respondsToSelector:@selector(registerClickWithLoginDict:)]) {
                            [_delegate performSelector:@selector(registerClickWithLoginDict:)withObject:dict];
                        }
                    }else{
                        // 提示
                        iToast * itos = [[[[iToast makeText:@"密码不一致，请重新输入!"] setGravity:iToastGravityCenter] setCornerRadius:20.f] setFontSize:14];
                        [itos.theSettings setImage:[UIImage imageNamed:@"error"] withLocation:iToastImageLocationLeft forType:iToastTypeWarning];
                        [itos show:iToastTypeWarning];
                    }
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
    if (textField.tag == 2001) {
        self.phoneNumStr = textField.text;
    }
    else if (textField.tag == 2002){
        self.passwordNumStr = textField.text;
    }
    else if (textField.tag == 2003){
        self.cmtPasswordNumStr = textField.text;
    }
    self.isClearPhone = NO;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *str = [[textField.text stringByReplacingCharactersInRange:range withString:string] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (str != nil && str.length > 0) {
        if (self.isClearPhone == NO) {
            [self.registerBtn setBackgroundImage:[UIImage imageNamed:@"register_nol"] forState:UIControlStateNormal];
            [self.registerBtn setBackgroundImage:[UIImage imageNamed:@"register_hei"] forState:UIControlStateHighlighted];
        }
        self.isClearPhone = NO;
    }
    else if (str == nil || str.length == 0) {
        if (textField.tag == 2001) {
            self.phoneNumStr = @"";
        }else if (textField.tag == 2002){
            self.passwordNumStr = @"";
        }else if (textField.tag == 2003){
            self.cmtPasswordNumStr = @"";
        }
        
        if (([self.passwordNumStr isEqualToString:@""] || self.passwordNumStr.length == 0) && ([self.phoneNumStr isEqualToString:@""] || self.phoneNumStr.length == 0) && ([self.cmtPasswordNumStr isEqualToString:@""] || self.cmtPasswordNumStr.length == 0)) {
            [self.registerBtn setBackgroundImage:[UIImage imageNamed:@"noregiter_nol"] forState:UIControlStateNormal];
            self.isClearPhone = YES;
        }
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{

    if (textField.tag == 2001) {
        self.phoneNumStr = @"";
    }else if (textField.tag == 2002){
        self.passwordNumStr = @"";
    }else if (textField.tag == 2003){
        self.cmtPasswordNumStr = @"";
    }
    
    if (([self.passwordNumStr isEqualToString:@""] || self.passwordNumStr.length == 0) && ([self.phoneNumStr isEqualToString:@""] || self.phoneNumStr.length == 0) && ([self.cmtPasswordNumStr isEqualToString:@""] || self.cmtPasswordNumStr.length == 0)) {
        [self.registerBtn setBackgroundImage:[UIImage imageNamed:@"noregiter_nol"] forState:UIControlStateNormal];
        self.isClearPhone = YES;
    }
    return YES;
}

// set&get
- (CRTextFieldView *)phoneView{
    if (_phoneView == nil) {
        _phoneView = [[CRTextFieldView alloc]init];
        _phoneView.textField.delegate = self;
        _phoneView.textField.tag = 2001;
        _phoneView.placeholderStr = @"电话号码";
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
        _passwordView.textField.delegate = self;
        _passwordView.textField.tag = 2002;
        _passwordView.backgroundColor = [UIColor colorWithHexString:@"1C1C1C"];
        _passwordView.placeholderStr = @"新密码";
        _passwordView.leftImageView.image = [UIImage imageNamed:@"passwordImage"];
        _passwordView.isLockView = YES;
    }
    return _passwordView;
}

- (CRTextFieldView *)commitPasswordView{
    if (_commitPasswordView == nil) {
        _commitPasswordView = [[CRTextFieldView alloc]init];
        _commitPasswordView.textField.delegate = self;
        _commitPasswordView.textField.tag = 2003;
        _commitPasswordView.backgroundColor = [UIColor colorWithHexString:@"1C1C1C"];
        _commitPasswordView.placeholderStr = @"确认密码";
        _commitPasswordView.leftImageView.image = [UIImage imageNamed:@"passwordImage"];
        _commitPasswordView.isLockView = YES;
    }
    return _commitPasswordView;
}

- (UIButton *)registerBtn{
    if (_registerBtn == nil) {
        _registerBtn = [[UIButton alloc]init];
        [_registerBtn setBackgroundImage:[UIImage imageNamed:@"noregiter_nol"] forState:UIControlStateNormal];
    }
    return _registerBtn;
}

@end
