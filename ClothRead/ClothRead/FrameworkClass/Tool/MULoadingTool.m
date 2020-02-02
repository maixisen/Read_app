//
//  MULoadingTool.m
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

#import "MULoadingTool.h"
#import "UIView+ShowCounter.h"

@implementation MULoadingTool
+(void)showCommonMBProgressHUDInView:(UIView *)parentView{
    MBProgressHUD * topHUD = [MBProgressHUD HUDForView:parentView];
    if (topHUD==nil) {
        MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:parentView animated:YES];
        hud.showCount = @(1);
    }else{
        topHUD.showCount = @(topHUD.showCount.integerValue+1);
    }
}
+(void)hideCommonMBProgressHUDInView:(UIView *)parentView{
    MBProgressHUD * topHUD = [MBProgressHUD HUDForView:parentView];
    if (topHUD==nil) {
        return;
    }else{
        topHUD.showCount = @(topHUD.showCount.integerValue-1);
        if (topHUD.showCount.integerValue <= 0) {
            topHUD.showCount = @(0);
            [topHUD hide:YES];
        }
    }
}


+(void)showCustomLoadingView:(UIView *)loadingView{
    loadingView.showCount = @(loadingView.showCount.integerValue+1);
    loadingView.hidden = NO;
}
+(void)hideCustomLoadingView:(UIView *)loadingView{
    loadingView.showCount = @(loadingView.showCount.integerValue-1);
    if (loadingView.showCount.integerValue <= 0) {
        loadingView.showCount = @(0);
        loadingView.hidden = YES;
    }
}


+(void)showCustomLoadingViewWithTag:(NSInteger)tag inView:(UIView *)parentView{
    UIView * customView = [parentView viewWithTag:tag];
    if (customView ==nil) {
        return;
    }else{
        customView.showCount = @(customView.showCount.integerValue+1);
        customView.hidden = NO;
    }
}
+(void)hideCustomLoadingViewWithTag:(NSInteger)tag inView:(UIView *)parentView{
    UIView * customView = [parentView viewWithTag:tag];
    if (customView==nil) {
        return;
    }else{
        customView.showCount = @(customView.showCount.integerValue-1);
        if (customView.showCount.integerValue <= 0) {
            customView.showCount = @(0);
            customView.hidden = YES;
        }
    }
}
@end

