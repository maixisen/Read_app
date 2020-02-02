//
//  CRLoginVC.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/29.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRLoginVC.h"
#import "CRLoginTopView.h"
#import "CRLoginView.h"
#import "CRRegisterView.h"
#import "CRChooseBtnView.h"
#import "CRFindPasswordView.h"

@interface CRLoginVC ()<CRLoginTopViewDelegate,CRFindPasswordViewDelegate,CRLoginViewDelegate,CRRegisterViewDelegate>

@property(nonatomic, strong) UIImageView *iconImageView;

@property(nonatomic ,strong) UIImageView *backgroundImageView;

@property(nonatomic ,strong) UIView *backGView;

@property(nonatomic ,strong) CRLoginTopView *loginTopView;

@property(nonatomic ,strong) CRLoginView *loginView;

@property(nonatomic ,strong) CRRegisterView *registerView;

@property(nonatomic ,strong) CRFindPasswordView *findPasswordView;

@property(nonatomic, strong)UIButton *reBtn;
@property(nonatomic, strong)UIButton *chooseLoginBtn;
@property(nonatomic, strong)UIButton *chooseRegisterBtn;
@property(nonatomic, strong)UIButton *choosePasswordBtn;

@end

@implementation CRLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // backgroundImage
    [self.view addSubview:self.backgroundImageView];
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.and.bottom.offset(0);
    }];
    
    // icon
    [self.backgroundImageView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(ankedIPhone8 > 20 ? 115*SCREEN_Proportion : 75*SCREEN_Proportion);
        make.left.offset(36*SCREEN_Proportion);
        make.width.offset(105*SCREEN_Proportion);
        make.height.offset(50*SCREEN_Proportion);
    }];
    
    [self.backgroundImageView addSubview:self.backGView];
    [self.backGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView.mas_bottom).offset(59*SCREEN_Proportion);
        make.left.equalTo(self.backgroundImageView.mas_left).offset(40*SCREEN_Proportion);
        make.right.equalTo(self.backgroundImageView.mas_right).offset(-40*SCREEN_Proportion);
        make.height.offset(34*SCREEN_Proportion);
    }];
    
    [self.backGView addSubview:self.loginTopView];
    [self.loginTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.offset(0);
    }];
    self.chooseLoginBtn = self.loginTopView.loginView.coverBtn;
    self.chooseRegisterBtn = self.loginTopView.registerView.coverBtn;
    
    [self.backgroundImageView addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backGView.mas_bottom).offset(32*SCREEN_Proportion);
        make.left.equalTo(self.backgroundImageView.mas_left).offset(75*SCREEN_Proportion);
        make.right.equalTo(self.backgroundImageView.mas_right).offset(-75*SCREEN_Proportion);
        make.height.offset(175*SCREEN_Proportion);
    }];
    
    [self.backgroundImageView addSubview:self.registerView];
    [self.registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backGView.mas_bottom).offset(32*SCREEN_Proportion);
        make.left.equalTo(self.backgroundImageView.mas_left).offset(75*SCREEN_Proportion);
        make.right.equalTo(self.backgroundImageView.mas_right).offset(-75*SCREEN_Proportion);
        make.height.offset(275*SCREEN_Proportion);
    }];
    
    [self.backgroundImageView addSubview:self.findPasswordView];
    [self.findPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backGView.mas_bottom).offset(32*SCREEN_Proportion);
        make.left.equalTo(self.backgroundImageView.mas_left).offset(75*SCREEN_Proportion);
        make.right.equalTo(self.backgroundImageView.mas_right).offset(-75*SCREEN_Proportion);
        make.height.offset(375*SCREEN_Proportion);
    }];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MUObjectTool diableSideSlip:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.loginView.phoneView.textField resignFirstResponder];
    [self.loginView.passwordView.textField resignFirstResponder];
    [self.registerView.phoneView.textField resignFirstResponder];
    [self.registerView.passwordView.textField resignFirstResponder];
    [self.registerView.commitPasswordView.textField resignFirstResponder];
    [self.findPasswordView.phoneView.textField resignFirstResponder];
    [self.findPasswordView.codeView.textField resignFirstResponder];
    [self.findPasswordView.passwordView.textField resignFirstResponder];
    [self.findPasswordView.commitPasswordView.textField resignFirstResponder];
}

- (void)chooseLoginStatusWithBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
        {
            self.loginView.hidden = NO;
            self.registerView.hidden = YES;
            self.findPasswordView.hidden = YES;
            self.chooseLoginBtn = btn;
        }
            break;
        case 1:
        {
            self.loginView.hidden = YES;
            self.registerView.hidden = NO;
            self.findPasswordView.hidden = YES;
            self.chooseRegisterBtn = btn;
        }
            break;
        case 2:
        {
            self.loginView.hidden = YES;
            self.registerView.hidden = YES;
            self.findPasswordView.hidden = NO;
            self.choosePasswordBtn = btn;
        }
            break;
    }
}
- (void)getCode:(UIButton *)btn{
    self.reBtn = btn;
    self.chooseLoginBtn.enabled = NO;
    self.chooseRegisterBtn.enabled = NO;
    self.choosePasswordBtn.enabled = NO;
}
- (void)timerStop:(UIButton *)btn{
    self.chooseLoginBtn.enabled = YES;
    self.chooseRegisterBtn.enabled = YES;
    self.choosePasswordBtn.enabled = YES;
}
// 登录
- (void)loginClickWithLoginDict:(NSMutableDictionary *)dict{
    
}
// 注册
- (void)registerClickWithLoginDict:(NSMutableDictionary *)dict{
    
}
// 修改密码
- (void)passwordClickWithLoginDict:(NSMutableDictionary *)dict{
    
}
#pragma get&set
- (UIImageView *)backgroundImageView{
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[UIImageView alloc]init];
        _backgroundImageView.image = [UIImage imageNamed:@"login_backgroundImage"];
        _backgroundImageView.userInteractionEnabled = YES;
    }
    return _backgroundImageView;
}
- (UIView *)backGView{
    if (_backGView == nil) {
        _backGView = [[UIView alloc]init];
        _backGView.backgroundColor = [UIColor colorWithHexString:@"201F1F"];
        _backGView.layer.masksToBounds = YES;
        _backGView.layer.cornerRadius = 17.f;
    }
    return _backGView;
}
- (CRLoginTopView *)loginTopView{
    if (_loginTopView == nil) {
        _loginTopView = [[CRLoginTopView alloc]init];
        _loginTopView.delegate = self;
    }
    return _loginTopView;
}
- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.image = [UIImage imageNamed:@"icon"];
    }
    return _iconImageView;
}
- (CRLoginView *)loginView{
    if (_loginView == nil) {
        _loginView = [[CRLoginView alloc]init];
        _loginView.delegate = self;
    }
    return _loginView;
}
- (CRRegisterView *)registerView{
    if (_registerView == nil) {
        _registerView = [[CRRegisterView alloc]init];
        _registerView.delegate = self;
        _registerView.hidden = YES;
    }
    return _registerView;
}
- (CRFindPasswordView *)findPasswordView{
    if (_findPasswordView == nil) {
        _findPasswordView = [[CRFindPasswordView alloc]init];
        _findPasswordView.hidden = YES;
        _findPasswordView.delegate = self;
    }
    return _findPasswordView;
}
@end
