//
//  MUViewTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUViewTool : NSObject
/**
 *  通过文字多少得到Label宽高
 *
 *  @param str        传入计算的字符串
 *  @param fontSize   字体大小
 *  @param lines      限制行数
 *  @param labelWidth 限制宽度
 *
 */
+(CGSize)getLabelActualSize:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth;

/**
 *  色值直接转换成图片对象
 *
 *  @param color 色值
 *
 */
+(UIImage *)changeColorToImage:(UIColor *)color;

+(UIImage *)resizeImage:(NSString *)imgName;

+(CGSize)getImageSizeToChange:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
