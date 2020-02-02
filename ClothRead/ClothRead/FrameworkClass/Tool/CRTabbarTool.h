//
//  MUTabbarTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/5.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

// 自定义tabbar工具类
@interface CRTabbarTool : NSObject

/**
 *  Appdelegate获取tabbar实例
 *
 */
+(void)getTabbarInstance:(id)tabbar;

// 获取TabBar实例
+ (CRTabBarController *)shareTabbarTool;

@end

NS_ASSUME_NONNULL_END
