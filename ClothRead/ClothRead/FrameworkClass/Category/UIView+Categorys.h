//
//  UIView+Categorys.h
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

/*
 (setFrame)直接设置或者获取View的frame属性
 */

#import <Foundation/Foundation.h>

@interface UIView (setFrame)

/**
 *  设置 获取Origin
 *
 */
-(CGPoint)origin;
-(void)setOrigin:(CGPoint) point;

/**
 *  设置 获取size
 *
 */
-(CGSize)size;
-(void)setSize:(CGSize) size;

/**
 *  设置 获取x
 *
 */
-(CGFloat)x;
-(void)setX:(CGFloat)x;

/**
 *  设置 获取y
 *
 */
-(CGFloat)y;
-(void)setY:(CGFloat)y;

/**
 *  设置 获取height
 *
 */
-(CGFloat)height;
-(void)setHeight:(CGFloat)height;

/**
 *  设置 获取width
 *
 */
-(CGFloat)width;
-(void)setWidth:(CGFloat)width;

/**
 *  设置 获取tail
 *
 */
-(CGFloat)tail;
-(void)setTail:(CGFloat)tail;

/**
 *  设置 获取bottom
 *
 */
-(CGFloat)bottom;
-(void)setBottom:(CGFloat)bottom;

/**
 *  设置 获取right
 *
 */
-(CGFloat)right;
-(void)setRight:(CGFloat)right;

@end
