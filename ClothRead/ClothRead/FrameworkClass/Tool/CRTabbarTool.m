//
//  MUTabbarTool.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/5.
//  Copyright © 2019 lee. All rights reserved.
//

#import "CRTabbarTool.h"

static CRTabbarTool *tool;

@implementation CRTabbarTool

+ (void)getTabbarInstance:(id)tabbar{
    tool = tabbar;
}

+ (CRTabBarController *)shareTabbarTool{
    if (tool) {
        return (CRTabBarController *)tool;
    }
    return nil;
}

@end
