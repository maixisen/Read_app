//
//  UIImage+Categorys.h
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

/*
 (Transform)对图片进行压缩大小，拉伸等等操作
 (Bundle)获取bundle里面图片信息
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Transform)

/**
 *  压缩当前图片Image成指定大小Image
 *
 *  @param size 指定尺寸
 */
-(UIImage *)compressToSize:(CGSize)size;

/**
 *  根据传入的图片最大宽高参数，计算出图片容器的Size
 *
 *  @param image 传入的图片
 *
 *  @return
 */
-(CGSize)getContainerSizeWithLimitWidth:(CGFloat)limitWidth andLimitHeight:(CGFloat)limitHeight;

/**
 *  拉伸Image矩形范围内视图(仅拉伸区域内，类型QQ聊天框)
 *
 *  @param edgeInset 指定矩形区域
 *
 *  @return 
 */
-(UIImage *)resizeImageWithEdge:(UIEdgeInsets)edgeInset;

/**
 *  传入颜色对象获取纯色Image对象
 *
 *  @param color 颜色值
 *
 *  @return 
 */
+(UIImage *)transformToPureImageWithColor:(UIColor *)color;

-(UIImage*)imageRotatedByDegrees:(CGFloat)degrees;

@end

@interface UIImage (Bundle)
/**
 *  获取当前App的Icon图片Image对象
 *
 *  @return 
 */
+(UIImage *)getAppIcon;

/**
 *  获取当前Vie截屏
 *
 *  @return
 */
+(UIImage *)getCurrentScreenImage:(UIView *)vie;
/**
 *  @author 弑剑醉红尘, 15-11-05 10:11:34
 *
 *  给ImageView画虚线
 *
 *  @param size        需要虚线边框视图的大小
 *  @param color       边框的颜色
 *  @param borderWidth 边框的粗细
 *
 *  @return image
 */
+ (UIImage*)imageWithSize:(CGSize)size borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth;

@end
