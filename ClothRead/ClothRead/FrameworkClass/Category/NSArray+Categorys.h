//
//  NSArray+Categorys.h
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

/*
 (Log)用于打印显示utf格式
 */

#import <Foundation/Foundation.h>

@interface NSArray (Log)
/**
 *  由于服务器返回的打印出来不是UTF-8格式，不易查看，于是重写NSArray打印的description方法，打印的时候能很清楚看到中文字符
 */
-(NSString *)descriptionWithLocale:(id)locale;

/**
 *  检查是否越界和NSNUll如果是返回nil
 *
 *  @param index 位置
 *
 *  @return 返回对象
 */
- (id)objectAtIndexCheck:(NSUInteger)index;

@end
