//
//  CRLoginTopView.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/29.
//  Copyright © 2020 strong. All rights reserved.
//

#import "CRLoginTopView.h"
#import "CRChooseBtnView.h"

@interface CRLoginTopView ()

// btn数组
@property(nonatomic, strong)NSMutableArray *btnArray;

@end

@implementation CRLoginTopView

- (NSMutableArray *)btnArray{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

- (instancetype)init{
    if (self == [super init]) {
        [self createUI];
    }
    return self;
}

// 初始化
- (void)createUI{
    // login
    [self addSubview:self.loginView];
    [self.btnArray sui_addObj:self.loginView];
    // register
    [self addSubview:self.registerView];
    [self.btnArray sui_addObj:self.registerView];
    // password
    [self addSubview:self.findPasswordView];
    [self.btnArray sui_addObj:self.findPasswordView];
    // 布局
    [self.btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20*SCREEN_Proportion leadSpacing:20*SCREEN_Proportion tailSpacing:20*SCREEN_Proportion];
    [self.btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.offset(34*SCREEN_Proportion);
    }];
    // loginBtn
    [self.loginView.coverBtn addTarget:self action:@selector(loginViewClick:) forControlEvents:UIControlEventTouchUpInside];
    // registerBtn
    [self.registerView.coverBtn addTarget:self action:@selector(registerViewClick:) forControlEvents:UIControlEventTouchUpInside];
    // passwordBtn
    [self.findPasswordView.coverBtn addTarget:self action:@selector(findPasswordViewClick:) forControlEvents:UIControlEventTouchUpInside];
}

// loginViewClick
- (void)loginViewClick:(UIButton *)btn{
    btn.tag = 0;
    self.loginView.bottomView.hidden = NO;
    self.findPasswordView.bottomView.hidden = YES;
    self.registerView.bottomView.hidden = YES;
    // title
    self.loginView.titleLabel.textColor = [UIColor whiteColor];
    self.loginView.titleLabel.font = [UIFont boldSystemFontOfSize:17*SCREEN_Proportion];
    self.registerView.titleLabel.textColor = [UIColor colorWithHexString:@"4B4949"];
    self.registerView.titleLabel.font = [UIFont boldSystemFontOfSize:14*SCREEN_Proportion];
    self.findPasswordView.titleLabel.textColor = [UIColor colorWithHexString:@"4B4949"];
    self.findPasswordView.titleLabel.font = [UIFont boldSystemFontOfSize:14*SCREEN_Proportion];
    if ([_delegate respondsToSelector:@selector(chooseLoginStatusWithBtn:)]) {
        [_delegate performSelector:@selector(chooseLoginStatusWithBtn:)withObject:btn];
    }
}
// registerViewClick
- (void)registerViewClick:(UIButton *)btn{
    btn.tag = 1;
    self.registerView.bottomView.hidden = NO;
    self.loginView.bottomView.hidden = YES;
    self.findPasswordView.bottomView.hidden = YES;
    // title
    self.registerView.titleLabel.textColor = [UIColor whiteColor];
    self.registerView.titleLabel.font = [UIFont boldSystemFontOfSize:17*SCREEN_Proportion];
    self.loginView.titleLabel.textColor = [UIColor colorWithHexString:@"4B4949"];
    self.loginView.titleLabel.font = [UIFont boldSystemFontOfSize:14*SCREEN_Proportion];
    self.findPasswordView.titleLabel.textColor = [UIColor colorWithHexString:@"4B4949"];
    self.findPasswordView.titleLabel.font = [UIFont boldSystemFontOfSize:14*SCREEN_Proportion];
    if ([_delegate respondsToSelector:@selector(chooseLoginStatusWithBtn:)]) {
        [_delegate performSelector:@selector(chooseLoginStatusWithBtn:)withObject:btn];
    }
}
// findPasswordViewClick
- (void)findPasswordViewClick:(UIButton *)btn{
    btn.tag = 2;
    self.findPasswordView.bottomView.hidden = NO;
    self.loginView.bottomView.hidden = YES;
    self.registerView.bottomView.hidden = YES;
    // title
    self.findPasswordView.titleLabel.textColor = [UIColor whiteColor];
    self.findPasswordView.titleLabel.font = [UIFont boldSystemFontOfSize:17*SCREEN_Proportion];
    self.loginView.titleLabel.textColor = [UIColor colorWithHexString:@"4B4949"];
    self.loginView.titleLabel.font = [UIFont boldSystemFontOfSize:14*SCREEN_Proportion];
    self.registerView.titleLabel.textColor = [UIColor colorWithHexString:@"4B4949"];
    self.registerView.titleLabel.font = [UIFont boldSystemFontOfSize:14*SCREEN_Proportion];
    if ([_delegate respondsToSelector:@selector(chooseLoginStatusWithBtn:)]) {
        [_delegate performSelector:@selector(chooseLoginStatusWithBtn:)withObject:btn];
    }
}


// get&set
- (CRChooseBtnView *)loginView{
    if (_loginView == nil) {
        _loginView = [[CRChooseBtnView alloc]init];
        _loginView.titleLabel.text = @"登录";
        _loginView.titleLabel.textColor = [UIColor whiteColor];
        _loginView.titleLabel.font = [UIFont boldSystemFontOfSize:17*SCREEN_Proportion];
    }
    return _loginView;
}
- (CRChooseBtnView *)findPasswordView{
    if (_findPasswordView == nil) {
        _findPasswordView = [[CRChooseBtnView alloc]init];
        _findPasswordView.titleLabel.text = @"找回密码";
        _findPasswordView.bottomView.hidden = YES;
    }
    return _findPasswordView;
}
- (CRChooseBtnView *)registerView{
    if (_registerView == nil) {
        _registerView = [[CRChooseBtnView alloc]init];
        _registerView.titleLabel.text = @"注册";
        _registerView.bottomView.hidden = YES;
    }
    return _registerView;
}
@end
