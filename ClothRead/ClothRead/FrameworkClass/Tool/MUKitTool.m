//
//  MUKitTool.m
//  Multiverse
//
//  Created by Kathleen on 2019/12/15.
//  Copyright © 2019 lee. All rights reserved.
//

#import "MUKitTool.h"

@implementation MUKitTool

+ (UIWindow *)getMainWindow{
    UIWindow *topView = [UIApplication sharedApplication].keyWindow;
    for (UIWindow *win in [[UIApplication sharedApplication].windows  reverseObjectEnumerator]) {
        if ([win isEqual: topView]) {
            continue;
        }
        if (win.windowLevel > topView.windowLevel && win.hidden != YES ) {
            topView =win;
        }
    }
    return topView;
}

+(void)changeTopStateBarColor:(UIColor *)color
{
    UIApplication * app = [UIApplication sharedApplication];
    id obj = [app valueForKeyPath:@"statusBar"];
    NSArray * arr = [obj getPrivateApiMethod];
    
    for (int i = 0; i < arr.count; i++)
    {
        if ([((NSString *)[arr sui_objectWithIndex:i]) isEqualToString:@"foregroundColor"])
        {
            [obj setValue:color forKey:((NSString *)[arr sui_objectWithIndex:i])];
        }
    }
}

+(NSString *)getNetWorkStatesForfun
{
    UIApplication * app = [UIApplication sharedApplication];
    NSArray * children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = [[NSString alloc]init];
    int netType = 0;
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    state = @"无网络";
                    break;
                case 1:
                    state = @"2G";
                    break;
                case 2:
                    state = @"3G";
                    break;
                case 3:
                    state = @"4G";
                    break;
                case 5:
                    state = @"WIFI";
                    break;
                default:
                    break;
            }
        }
    }
    if ([state isEqualToString:@""])
    {
        state = @"无网络";
    }
    //根据状态选择
    return state;
}

+ (void)drawUpRadiusWithView:(UIView *)view withRadiusSize:(CGSize)radiusSize{
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:view.layer.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:radiusSize];
    CAShapeLayer * maskLayer = [CAShapeLayer new];
    maskLayer.frame = view.layer.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}

@end
