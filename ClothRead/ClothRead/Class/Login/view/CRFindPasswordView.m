//
//  CRFindPasswordView.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/30.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRFindPasswordView.h"

@interface CRFindPasswordView ()<UITextFieldDelegate>{
    NSTimer *_timer; // 定时器
    NSInteger count; // 计时
}

@property(nonatomic, assign)BOOL isClearPhone;

@property(nonatomic, copy)NSString *phoneNumStr;

@property(nonatomic, copy)NSString *codeStr;

@property(nonatomic, copy)NSString *passwordNumStr;

@property(nonatomic, copy)NSString *cmtPasswordNumStr;

@end

@implementation CRFindPasswordView

- (instancetype)init{
    if (self == [super init]) {
        count = 60;
        self.isClearPhone = NO;
        [self addSubview:self.phoneView];
        [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.offset(0);
            make.height.offset(40*SCREEN_Proportion);
        }];
        [self addSubview:self.codeView];
        [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phoneView.mas_bottom).offset(21*SCREEN_Proportion);
            make.left.and.right.offset(0);
            make.height.equalTo(self.phoneView.mas_height);
        }];
        [self.codeView addSubview:self.codeBtn];
        [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.codeView.mas_top);
            make.right.equalTo(self.codeView.mas_right);
            make.height.offset(40*SCREEN_Proportion);
            make.width.offset(47*SCREEN_Proportion);
        }];
        [self.codeBtn addTarget:self action:@selector(codeClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.passwordView];
        [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.codeView.mas_bottom).offset(21*SCREEN_Proportion);
            make.left.and.right.offset(0);
            make.height.equalTo(self.codeView.mas_height);
        }];
        [self addSubview:self.commitPasswordView];
        [self.commitPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.passwordView.mas_bottom).offset(21*SCREEN_Proportion);
            make.left.and.right.offset(0);
            make.height.equalTo(self.passwordView.mas_height);
        }];
        [self addSubview:self.passwordBtn];
        [self.passwordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.commitPasswordView.mas_bottom).offset(39*SCREEN_Proportion);
            make.centerX.equalTo(self.mas_centerX);
            make.width.offset(130*SCREEN_Proportion);
            make.height.offset(35*SCREEN_Proportion);
        }];
        [self.passwordBtn addTarget:self action:@selector(passwordClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)passwordClick{
    if (self.isClearPhone == NO) {
        UITextField * t_Filed = (UITextField*)self.phoneView.textField;
        if (t_Filed.text != nil && t_Filed.text.length > 0) {
            self.phoneNumStr = t_Filed.text;
        }
        // 校验
        BOOL flag = [MUCheckoutTool validateMobile:self.phoneNumStr];
        if (flag) {
            UITextField * code_textFiled = (UITextField*)self.codeView.textField;
            if (code_textFiled.text != nil && code_textFiled.text.length > 0) {
                self.codeStr = code_textFiled.text;
                UITextField * textFiled = (UITextField*)self.passwordView.textField;
                if (textFiled.text != nil && textFiled.text.length > 0) {
                    self.passwordNumStr = textFiled.text;
                    UITextField * c_textFiled = (UITextField*)self.commitPasswordView.textField;
                    if (c_textFiled.text != nil && c_textFiled.text.length > 0) {
                        self.cmtPasswordNumStr = c_textFiled.text;
                        if ([self.cmtPasswordNumStr isEqualToString:self.passwordNumStr]) {
                            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                            [dict sui_setObj:self.phoneNumStr forKey:@"phoneNum"];
                            [dict sui_setObj:self.codeStr forKey:@"codeStr"];
                            [dict sui_setObj:self.passwordNumStr forKey:@"passwordNumStr"];
                            [dict sui_setObj:self.cmtPasswordNumStr forKey:@"cmtPasswordNumStr"];
                            if ([_delegate respondsToSelector:@selector(passwordClickWithLoginDict:)]) {
                                [_delegate performSelector:@selector(passwordClickWithLoginDict:)withObject:dict];
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

- (void)codeClick:(UIButton *)btn{
    if ([_delegate respondsToSelector:@selector(getCode:)]) {
        [_delegate performSelector:@selector(getCode:) withObject:btn];
    }
    // 定时器
    if([_timer isValid]){
        return;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimerEvent:) userInfo:nil repeats:YES];
    [_timer fire];
    [self.codeView.textField becomeFirstResponder];
}
#pragma mark --  重新发送验证码事件
- (void)onTimerEvent:NSTimer{
    if(count==0) {
        [_timer invalidate];
        count = 60;
        self.codeBtn.enabled = YES;
        self.codeBtn.layer.masksToBounds = YES;
        self.codeBtn.layer.cornerRadius = 10.f;
        [self.codeBtn setBackgroundColor:[UIColor colorWithHexString:@"FFD12A"]];
        self.codeBtn.titleLabel.textColor = [UIColor whiteColor];
        [self.codeBtn setTitle:@"验" forState:UIControlStateNormal];
        self.codeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20*SCREEN_Proportion];
        if ([_delegate respondsToSelector:@selector(timerStop:)]) {
            [_delegate performSelector:@selector(timerStop:)];
        }
    }
    else {
        NSString * str = [NSString stringWithFormat:@"%lus",(long)count];
        self.codeBtn.titleLabel.font = [UIFont systemFontOfSize:18*SCREEN_Proportion];
        [self.codeBtn setTitle:str forState:UIControlStateNormal];
        count --;
        self.codeBtn.enabled = NO;
    }
}

#pragma mark -- textFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag == 3001) {
        self.phoneNumStr = textField.text;
    }
    else if (textField.tag == 3004){
        self.passwordNumStr = textField.text;
    }
    else if (textField.tag == 3003){
        self.cmtPasswordNumStr = textField.text;
    }
    else if (textField.tag == 3002){
        self.codeStr = textField.text;
    }
    self.isClearPhone = NO;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *str = [[textField.text stringByReplacingCharactersInRange:range withString:string] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (str != nil && str.length > 0) {
        if (self.isClearPhone == NO) {
            [self.passwordBtn setBackgroundImage:[UIImage imageNamed:@"register_nol"] forState:UIControlStateNormal];
            [self.passwordBtn setBackgroundImage:[UIImage imageNamed:@"register_hei"] forState:UIControlStateHighlighted];
        }
        self.isClearPhone = NO;
    }
    else if (str == nil || str.length == 0) {
        if (textField.tag == 3001) {
            self.phoneNumStr = @"";
        }else if (textField.tag == 3004){
            self.passwordNumStr = @"";
        }else if (textField.tag == 3003){
            self.cmtPasswordNumStr = @"";
        }else if (textField.tag == 3002){
            self.codeStr = @"";
        }
        
        if (([self.passwordNumStr isEqualToString:@""] || self.passwordNumStr.length == 0) && ([self.phoneNumStr isEqualToString:@""] || self.phoneNumStr.length == 0) && ([self.cmtPasswordNumStr isEqualToString:@""] || self.cmtPasswordNumStr.length == 0)&& ([self.codeStr isEqualToString:@""] || self.codeStr.length == 0)) {
            [self.passwordBtn setBackgroundImage:[UIImage imageNamed:@"noregiter_nol"] forState:UIControlStateNormal];
            self.isClearPhone = YES;
        }
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{

    if (textField.tag == 3001) {
        self.phoneNumStr = @"";
    }else if (textField.tag == 3004){
        self.passwordNumStr = @"";
    }else if (textField.tag == 3003){
        self.cmtPasswordNumStr = @"";
    }else if (textField.tag == 3002){
        self.codeStr = @"";
    }
    
    if (([self.passwordNumStr isEqualToString:@""] || self.passwordNumStr.length == 0) && ([self.phoneNumStr isEqualToString:@""] || self.phoneNumStr.length == 0) && ([self.cmtPasswordNumStr isEqualToString:@""] || self.cmtPasswordNumStr.length == 0)&& ([self.codeStr isEqualToString:@""] || self.codeStr.length == 0)) {
        [self.passwordBtn setBackgroundImage:[UIImage imageNamed:@"noregiter_nol"] forState:UIControlStateNormal];
        self.isClearPhone = YES;
    }
    return YES;
}

// set&get
- (CRTextFieldView *)phoneView{
    if (_phoneView == nil) {
        _phoneView = [[CRTextFieldView alloc]init];
        _phoneView.textField.delegate = self;
        _phoneView.textField.tag = 3001;
        _phoneView.placeholderStr = @"电话号码";
        _phoneView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneView.backgroundColor = [UIColor colorWithHexString:@"1C1C1C"];
        _phoneView.leftImageView.image = [UIImage imageNamed:@"phoneImage"];
        _phoneView.isLockView = NO;
    }
    return _phoneView;
}

// set&get
- (CRTextFieldView *)codeView{
    if (_codeView == nil) {
        _codeView = [[CRTextFieldView alloc]init];
        _codeView.textField.delegate = self;
        _codeView.textField.tag = 3002;
        _codeView.placeholderStr = @"验证码";
        _codeView.textField.keyboardType = UIKeyboardTypeNumberPad;
        _codeView.backgroundColor = [UIColor colorWithHexString:@"1C1C1C"];
        _codeView.leftImageView.image = [UIImage imageNamed:@"phoneImage"];
        _codeView.isLockView = YES;
    }
    return _codeView;
}

- (CRTextFieldView *)passwordView{
    if (_passwordView == nil) {
        _passwordView = [[CRTextFieldView alloc]init];
        _passwordView.textField.delegate = self;
        _passwordView.textField.tag = 3003;
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
        _commitPasswordView.textField.tag = 3004;
        _commitPasswordView.backgroundColor = [UIColor colorWithHexString:@"1C1C1C"];
        _commitPasswordView.placeholderStr = @"确认密码";
        _commitPasswordView.leftImageView.image = [UIImage imageNamed:@"passwordImage"];
        _commitPasswordView.isLockView = YES;
    }
    return _commitPasswordView;
}

- (UIButton *)passwordBtn{
    if (_passwordBtn == nil) {
        _passwordBtn = [[UIButton alloc]init];
        [_passwordBtn setBackgroundImage:[UIImage imageNamed:@"noregiter_nol"] forState:UIControlStateNormal];
    }
    return _passwordBtn;
}

- (UIButton *)codeBtn{
    if (_codeBtn == nil) {
        _codeBtn = [[UIButton alloc]init];
        _codeBtn.layer.masksToBounds = YES;
        _codeBtn.layer.cornerRadius = 10.f;
        [_codeBtn setBackgroundColor:[UIColor colorWithHexString:@"FFD12A"]];
        _codeBtn.titleLabel.textColor = [UIColor whiteColor];
        [_codeBtn setTitle:@"验" forState:UIControlStateNormal];
        _codeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20*SCREEN_Proportion];
    }
    return _codeBtn;
}

@end
