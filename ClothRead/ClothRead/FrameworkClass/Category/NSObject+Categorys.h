//
//  NSObject+Categorys.h
//  MUBasicComponent
//
//  Created by MU on 15/8/3.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

/*
 (checkObj)检查数据是否正确，不是的话初始化，多用于网络请求回来进行判断
 (RunTime)运行时获取相关信息
 (Model)通过运行时对model进行赋值
 */

#import <Foundation/Foundation.h>

@interface NSObject (checkObj)

/**
 *  用于检测当前对象是否是NSArray，如果不是则初始化一个空NSArray返回
 *
 *  @return 返回数组
 */
-(NSArray *)checkHttpArray;

/**
 *  用于检测当前对象是否是NSMutableArray，如果不是则初始化一个空NSMutableArray返回
 *
 *  @return 返回可变数组
 */
-(NSMutableArray *)checkHttpMutableArray;

/**
 *  用于检测当前对象是否是NSDictionary，如果不是则初始化一个空NSDictionary返回
 *
 *  @return 返回字典
 */
-(NSDictionary *)checkHttpDictionary;

/**
 *  用于检测当前对象是否是NSMutableDictionary，如果不是则初始化一个空NSMutableDictionary返回
 *
 *  @return 返回可变字典
 */
-(NSMutableDictionary *)checkHttpMutableDictionary;

@end

@interface NSObject (RunTime)
/**
 *  通过运行时机制获取当前对象的方法名数组
 *
 */
-(NSArray *)getPrivateApiMethod;

/**
 *  通过运行时机制获取当前对象的属性名数组
 *
 */
-(NSArray *)getPrivateApiProperty;

/**
 *  通过运行时机制获取当前对象的属性名以及数据类型数组,index为0为属性名数组，index1为类型数组
 *
 */
-(NSArray *)getPrivateApiPropertyAndPropertyType;

@end

@interface NSObject (Model)

/**
 *  用于服务器返回数据字典时，通过运行时机制对Model进行赋值，传入字典即可实现对model赋值，内部已实现异常处理
 *
 *  @param dict  字典
 */
-(instancetype)convertModelWithDictionary:(NSDictionary *)dict;

@end
