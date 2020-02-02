//
//  NSTimer+Extension.h
//  BaseFunction
//
//  Created by Bart on 15/3/16.
//  Copyright (c) 2015年 Bart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Extension)
+(id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats;
+(id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats;

-(void)pauseTimer;
-(void)resumeTimer;
@end
