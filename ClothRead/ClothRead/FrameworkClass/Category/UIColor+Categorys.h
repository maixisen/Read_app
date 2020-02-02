//
//  UIColor+Categorys.h
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

/*
 (Hex)与16进制之间的转换
 */

#import <Foundation/Foundation.h>

@interface UIColor (Hex)

/**
 *  通过16进制转换成UIColor对象
 *
 *  @param hex 16进制
 *
 */
+(UIColor *)colorWithHex:(UInt32)hex;

/**
 *  通过16进制和透明度转换成UIColor对象
 *
 *  @param hex   16进制
 *  @param alpha 透明度
 *
 */
+(UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

/**
 *  通过16进制字符串转换成UIColor对象
 *
 *  @param hexString 16进制字符串
 *
 */
+(UIColor *)colorWithHexString:(NSString *)hexString;
/**
 *  通过RGB转换成16进制字符串
 *
 */
-(NSString *)HexString;

@end
