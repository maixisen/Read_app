//
//  NSTimer+Categorys.h
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

/*
 (State)改变计时器状态
 */

#import <Foundation/Foundation.h>

@interface NSTimer (State)

/**
 *  调用NSTime实例暂停定时器
 */
-(void)pauseTimer;

/**
 *  调用NSTime实例恢复定时器
 */
-(void)resumeTimer;

/**
 *  调用NSTime实例在特定时间后恢复定时器
 *
 *  @param interval 多少时间后恢复定时器
 */
-(void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
