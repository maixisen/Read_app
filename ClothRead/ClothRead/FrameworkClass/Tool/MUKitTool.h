//
//  MUKitTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/12/15.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUKitTool : NSObject

/**
 *  获取当前显示的主视图
 *
 *  @return UIWindow
 */
+ (UIWindow *)getMainWindow;

/**
 *  改变顶部状态栏颜色
 *
 *  @param color 颜色值
 */
+ (void)changeTopStateBarColor:(UIColor *)color;

/**
 *  不更新方式获取顶部status显示的网络状态
 *
 *  @return NSString
 */
+(NSString *)getNetWorkStatesForfun;

/**
 *  设置view圆角（用绘图机制，避免离屏渲染）
 *
 *  @param view 圆角对象
 *
 *  @param radiusSize  圆角尺寸（两个值相同即可）
 *
 *
 */
+ (void)drawUpRadiusWithView:(UIView *)view withRadiusSize:(CGSize)radiusSize;

@end

NS_ASSUME_NONNULL_END
