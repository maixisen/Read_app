//
//  NSTimer+Categorys.m
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

#import "NSTimer+Categorys.h"

@implementation NSTimer (State)

-(void)pauseTimer
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid])
    {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
