//
//  MUDecimalOperationTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MUDecimalMode) {
    /** 截取 */
    MUDecimalModeDown,
    /** 四舍五入 */
    MUDecimalModeBankers
};

@interface MUDecimalOperationTool : NSObject
/**
 *  字符串形式的数字乘法计算
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *
 *  @return 结果
 */
+(NSString *)mutiplyString:(NSString *)string1 byString:(NSString *)string2;
/**
 *  字符串形式的数字除法计算
 *
 *  @param string1   被除数
 *  @param string2   除数
 *
 *  @return 结果
 */
+(NSString *)divideString:(NSString *)string1 byString:(NSString *)string2;
/**
 *  字符串形式的数字加法计算
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *
 *  @return 结果
 */
+(NSString *)additionString:(NSString *)string1 byString:(NSString *)string2;
/**
 *  字符串形式的数字减法计算
 *
 *  @param string1 被减数
 *  @param string2 减数
 *
 *  @return 结果
 */
+(NSString *)subtractionString:(NSString *)string1 byString:(NSString *)string2;

/**
 *  字符串形式的数字乘法计算
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *  @param scale 保留几位小数
 *  @param mode 截取还是四舍五入
 *  @return 结果
 */
+(NSString *)mutiplyString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode;
/**
 *  字符串形式的数字除法计算
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *  @param scale 保留几位小数
 *  @param mode 截取还是四舍五入
 *  @return 结果
 */
+(NSString *)divideString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode;
/**
 *  字符串形式的数字加法计算
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *  @param scale 保留几位小数
 *  @param mode 截取还是四舍五入
 *  @return 结果
 */
+(NSString *)additionString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode;
/**
 *  字符串形式的数字加法计算(SKU使用，加法末位不足补0)
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *  @param scale 保留几位小数
 *  @param mode 截取还是四舍五入
 *  @return 结果
 */
+(NSString *)skuAdditionString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode;
/**
 *  字符串形式的数字减法计算
 *
 *  @param string1 字符串1
 *  @param string2 字符串2
 *  @param scale 保留几位小数
 *  @param mode 截取还是四舍五入
 *  @return 结果
 */
+(NSString *)subtractionString:(NSString *)string1 byString:(NSString *)string2 scale:(int)scale mode:(MUDecimalMode)mode;

@end

NS_ASSUME_NONNULL_END
