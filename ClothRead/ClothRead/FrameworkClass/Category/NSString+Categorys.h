//
//  NSString+Categorys.h
//  MUBasicComponent
//
//  Created by MU on 15/8/3.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

/*
 (Verify):用于一些基本字符串值的验证
 (JSONValue):用于JSON与字符串的转换
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Verify)
/**
 *  判断对象是否为字符串，如果是则返回；如果是NSNumber，则包装后返回字符串，否则返回nil。
 *
 *  @param obj 传入的不确定值
 *
 */
+(NSString *)getStringWithObj:(id)obj;
@end


@interface NSString (JSONValue)

/**
 *  通过传入JSON对象转换返回Data对象,转换失败返回nil
 *
 *  @param jsonObj JSON对象
 *
 */
+(NSData *)jsonDataWithJSONObj:(id)jsonObj;

/**
 *  通过当前JSON字符串转换返回id(Data)类型，转换失败返回nil
 *
 */
-(id)jsonIdWithJSONString;

@end

@interface NSString (AttributString)
/**
 *  对文本特定range进行颜色color和字体font的改变
 *
 *  @param font  改变的字体
 *  @param color 改变的颜色
 *  @param range 改变的range
 *
 */
-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andRange:(NSRange)range;

/**
 *  对特定文字searchText所有地方进行颜色color和字体font的改变
 *
 *  @param font       改变的字体
 *  @param color      改变的颜色
 *  @param searchText 改变的range
 *
 */
-(NSMutableAttributedString *)addCustomAttributeFont:(UIFont *)font andColor:(UIColor *)color andText:(NSString *)searchText;

@end

@interface NSString (url)
- (NSString *)URLEncodedString;//替换特殊符号
- (NSString *)URLDecodedString;//还原特殊符号
- (NSString *)stringReplaceNAndR; //去掉换行符
@end
