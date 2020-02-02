//
//  MULoadingTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

/*
 这个类是用来展现和隐藏loading视图的，
 主要用来计算loading视图对象的展现方法调用次数和消失方法调用次数，
 每次展现会使loading视图对象计数器+1
 每次消失会使loading视图对象计数器-1
 当loading视图对象计数器>0时会被显示(add或者Hidden=NO)
 当loading视图对象计数器=0时会隐藏(remove或者Hidden=YES)
 */

#import <Foundation/Foundation.h>

@interface MULoadingTool : NSObject
/*
 描述:显示只有一个转圈的MBProgressHUD在parentView中
 parentView:HUD会展现在parentView的中间
 如果该parentView中有HUD则HUD的计数器+1，不会新增HUD
 */
+(void)showCommonMBProgressHUDInView:(UIView *)parentView;

/*
 描述:隐藏parentView中的MBProgressHUD
 parentView:HUD所在的parentView
 HUD的计数器-1，当计数器为0时隐藏
 */
+(void)hideCommonMBProgressHUDInView:(UIView *)parentView;

/*
 描述:将已经添加到父视图中(位置确定)的loading视图展现出来
 loadingView:已添加到父视图中的loading视图
 使用该函数需要将loadingview添加到其父视图中并设置好约束或frame
 如果该loadingView的计数器+1>0则展示，之后每次+1
 */
+(void)showCustomLoadingView:(UIView *)loadingView;

/*
 描述:将已经添加到父视图中(位置确定)的loading视图隐藏
 loadingView:已添加到父视图中的loading视图
 使用该函数需要将loadingview添加到其父视图中并设置好约束或frame
 如果该loadingView的计数器-1<=0则隐藏，否则无变化(仍然为展现状态)
 */
+(void)hideCustomLoadingView:(UIView *)loadingView;

@end
