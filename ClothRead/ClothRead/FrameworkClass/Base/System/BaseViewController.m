//
//  BaseViewController.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/4.
//  Copyright © 2019 lee. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    _stateView = [[MUStateView alloc] init];
    _stateView.delegate = self;
    _stateView.frame = CGRectMake(0, 0, SCREENW, SCREENH - 64);
    
    [self.view addSubview:_stateView];
}

#pragma mark -- 数据初始化
- (void)initializeData{
    _currentService = [[CRHttpServie alloc]init];
    _currentService.serviceDelegate = self;
}

#pragma mark - 视图创建
- (void)createMainView{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

#pragma mark - 视图控制器生命周期
- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    [self initializeData];
//    [self createMainView];
    
    if (_stateView == nil){
        _stateView = [[MUStateView alloc] init];
           _stateView.delegate = self;
           _stateView.frame = CGRectMake(0, 0, SCREENW, SCREENH - 64);
           [self.view addSubview:_stateView];
       }
}

//隐藏NavigationBar
- (void)viewWillAppear:(BOOL)animated{
    //设置隐藏
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}
-(void) viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [super viewWillDisappear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark - 自定义辅助方法
- (void)back{
    _currentService.serviceDelegate = nil;
}

#pragma mark - 回调事件
- (void)requestSuccess:(BaseHttpResponse *)response{
    
}

- (void)requestFail:(BaseHttpResponse *)response{
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
