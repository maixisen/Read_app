//
//  AppDelegate.m
//  ClothRead
//
//  Created by Kathleen on 2020/1/22.
//  Copyright © 2020 strong. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "CRLunchVC.h"

#import "CRLoginVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [NSThread sleepForTimeInterval:3.0];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    [UIApplication sharedApplication].statusBarStyle =UIStatusBarStyleLightContent;
    
    BaseNavigationController *nav = nil;
    
    NSString *token = [kUserDef objectForKey:@"TOKEN"];
    if (token.length > 0 && token != nil) {
//        MUHomeVC *homeVC = [MUHomeVC new];
//        homeVC.memberId = token;
//        nav = [[BaseNavigationController alloc]initWithRootViewController:CRLoginVC];
    }
    else{
//        nav = [[BaseNavigationController alloc]initWithRootViewController:[[CRLunchVC alloc]init]];
        nav = [[BaseNavigationController alloc]initWithRootViewController:[CRLoginVC new]];
    }
    
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
