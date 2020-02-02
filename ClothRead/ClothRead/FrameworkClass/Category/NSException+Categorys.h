//
//  NSException+Categorys.h
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSException (Trace)

/**
 *  异常Exception调用，用于打印当前异常堆栈信息
 */
-(NSArray *)backtrace;

@end
