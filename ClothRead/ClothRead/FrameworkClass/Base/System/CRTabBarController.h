//
//  CRTabBarController.h
//  ClothRead
//
//  Created by Kathleen on 2020/1/25.
//  Copyright © 2020 strong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CRTabbarControllerDelegate <NSObject>

// 点击事件
- (void)btnClick;

@end

@interface CRTabBarController : UITabBarController

@property(nonatomic, weak)id<CRTabbarControllerDelegate> vcDelegate;

// 显示TabBarView
- (void)showTabbarView;
// 隐藏TabBarView
- (void)hidenTabbarView;

@end

@protocol CRTabbarDelegate <NSObject>

- (void)tabbarSwitchClick:(NSObject *)obj;

@end

// 自定义TabBar
@interface CRTabbar : UIView

// 正常图片
@property(nonatomic, strong)UIImage *normalImage;
// 高亮图片
@property(nonatomic, strong)UIImage *heighImage;
// imageView
@property(nonatomic, strong)UIImageView *imageView;
// 文字
@property(nonatomic, strong)UILabel *titleLabel;
// 按钮
@property(nonatomic, strong)UIButton *coverBtn;
// 代理
@property(nonatomic, weak)id <CRTabbarDelegate>tabbarDelegate;

// 初始化组件
- (void)itemWithNormalImage:(NSString *)normalImage andHeighImage:(NSString *)heighImage andTitle:(NSString *)title;

@end


NS_ASSUME_NONNULL_END
