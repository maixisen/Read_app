//
//  BaseViewController.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/4.
//  Copyright © 2019 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRHttpServie.h"

@interface BaseViewController : UIViewController<BaseHttpServiceDelegate,MUStateViewDelegate>

@property(nonatomic ,strong) CRHttpServie *currentService;

/**
 *  当前请求是否返回过数据，默认yes  代表有数据返回 可再次请求数据
 */
@property (nonatomic, assign) BOOL currentServiceSuccess;

/**
 *  不同状态显示视图,如无网络，无数据等等情况
 */
@property (nonatomic, strong) MUStateView *stateView;

@property (nonatomic, assign) BOOL isNeedSkid;

@property (nonatomic, assign) BOOL isShouldLoadData;

/**
 *  初始化数据
 */
- (void)initializeData;

/**
 *  创建主视图
 */
- (void)createMainView;

/**
 *  离开当前视图
 */
- (void)back;


@end
