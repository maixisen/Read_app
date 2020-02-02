//
//  MUObjectTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUPaddingLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MUObjectTool : NSObject

/**
 *  获取制定字体颜色
 *
 *  @param text          传入字符串
 *  @param changeText    需要变色的字符串
 *  @param changeColor   字体颜色
 *
 *  @return 获取制定字体颜色
 */
+ (NSMutableAttributedString *)getNstring:(NSString *)text changeTextColor:(NSString *)changeText andColor:(UIColor *)changeColor;
/**
 *  获取制定字体大小
 *
 *  @param text         传入字符串
 *  @param stringText   需要到stringText之前的字是改变的
 *  @param changeFont   字体font
 *
 *  @return 获取制定字体大小
 */
+ (NSMutableAttributedString *)getNstring:(NSString *)text Tostring:(NSString *)stringText andFont:(CGFloat)changeFont;
/**
 *  设置指定字符中子串的字体大小、颜色、附带删除线，针对原价
 *
 *  @param text        母字符串
 *  @param stringText  子串
 *  @param changeFont  要改变的字体大小
 *  @param changeColor 要改变得字体颜色
 *
 */
+ (NSMutableAttributedString *)getNstring:(NSString *)text changeString:(NSString *)stringText andFont:(CGFloat)changeFont andColor:(UIColor *)changeColor;
/**
 *  设置指定字符中子串的字体大小、颜色、不带下划线
 *
 *  @param text         母字符串
 *  @param stringText   子串
 *  @param changesFont  要改变的字体大小
 *  @param changeColor  要改变得字体颜色
 *
 */

+ (NSMutableAttributedString *)getNstring:(NSString *)text changeyString:(NSString *)stringText andFonty:(CGFloat)changesFont andColory:(UIColor *)changeColor;
/**
 *  抛物线动画
 *
 *  @param startPoint 开始位置
 *  @param endPoint   结束位置
 *
 *  @return 动画过程
 */
+ (CAKeyframeAnimation *)testAnimationWithStart:(CGPoint)startPoint andEnd:(CGPoint)endPoint;
/**
 *   获取制定字体颜色和制定字体大小
 *
 *  @param text        传入字符串
 *  @param stringText  需要到stringText之前的字是改变的
 *  @param changeFont  字体font
 *  @param changeText  需要变色的字符串
 *  @param changeColor 字体颜色
 *
 *  @return 字体属性
 */
+ (NSMutableAttributedString *)getNstring:(NSString *)text Tostring:(NSString *)stringText andFont:(CGFloat)changeFont changeText:(NSString *)changeText andColor:(UIColor *)changeColor;
/**
 *  改变导航栏title字体颜色
 *
 *  @param color 要改变的颜色
 */
+ (NSMutableDictionary *)changeNaviTitleColor:(UIColor *)color;
/**
 *  拼接字符串
 *
 *  @param strArrays 传入的数组
 *
 *  @return 拼接字符串
 */
+ (NSString *)getStrWith:(NSMutableArray *)strArrays;

/**
 *  添加灰色滤镜
 *
 *  @param image 图片
 *
 *  @return 灰色图片
 */
+ (UIImage *)grayscaleImageForImage:(UIImage *)image;
/**
 *  cell中价格的属性变换
 *
 *  @param str       要变得字符串
 *  @param markStr   对“markStr”字符串前后字符面进行获取
 *  @param changeStr 需要改变的自负串
 *
 *  @return 返回价格字符串的更改后的属性
 */
+ (NSAttributedString *)getModelStr:(NSString *)str WithMarkStr:(NSString *)markStr WithChangeStr:(NSString *)changeStr isOrder:(BOOL)isOrder isCar:(BOOL)isCar;
/**
 *  字符串加中划线
 *
 *  @param str 加中划线的字符串
 *
 *  @return 带有中划线的字符串
 */
+ (NSAttributedString *)getLineStr:(NSString *)str;
/**
 *  改变信号栏字体颜色
 *
 *  @param color 颜色参数
 */
+ (void)changeSignalFormatWithColor:(UIColor *)color;

/**
 *  取消撤销功能
 *
 *  @param VC 当前控制器
 */
+ (void)cancelRevokeWithController:(UIViewController *)VC;
/**
 *  指定文本颜色
 *
 *  @param text        整个文本
 *  @param changeFont  指定文本字号
 *  @param changeText  指定文本
 *  @param changeColor 指定文本颜色
 *  @param location    指定文本的起始位置
 *
 */
+ (NSMutableAttributedString *)getNstring:(NSString *)text  andFont:(CGFloat)changeFont  changeTextColor:(NSString *)changeText andColor:(UIColor *)changeColor loc:(NSInteger)location;
/**
 *  获取自定义文字属性状态
 *
 *  @param allStr    全部文字（带有人民币符号）
 *  @param changeStr 要改变的字段
 *
 *  @return 改变后的字符串状态
 */
+ (NSAttributedString *)getAttributedTest:(NSString *)allStr andChangeStr:(NSString *)changeStr;

/// 删除换行符
///
/// @param str str
///
/// @return 删除"\n"的字符串
+ (NSString *)removeBreakLineSymbolWithString:(NSString *)str;


/**
 *  获取自定义文字属性状态
 *
 *  @param allStr    全部文字（带有人民币符号）
 *  @param changeStr 要改变的字段
 *  @param isInvalid 是否有效
 *  @return 改变后的字符串状态
 */
+ (NSAttributedString *)getAttributedTest:(NSString *)allStr andChangeStr:(NSString *)changeStr isInvalid:(BOOL)isInvalid;

/**
 *  获取指定文字指定宽度锁占行数
 *
 *  @param string    文字
 *  @param sFont     字号
 *  @param width     宽度
 *  @return 改变后的字符串状态
 */
+ (NSArray *)getLinesArrayOfString:(NSString *)string font:(CGFloat)sFont width:(CGFloat)width;
/**
 *  构建埋点字符串
 *
 *  @param string    埋点序号
 *  @return 构建成埋点字符串状态
 */
+(NSString *)stringCompletToFive:(NSString *)string;

+(UILabel *)createLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

+(UILabel *)createLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)textAlignment hidden:(BOOL)isHidden text:(NSString *)text;

+(MUPaddingLabel *)createPadingLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

+(MUPaddingLabel *)resetPadingLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius sourceLabel:(MUPaddingLabel *)label;

+(NSMutableAttributedString *)changeArString:(NSString *)string withChangeText:(NSString *)changeText withChangeFontSize:(NSInteger)fontSize withChangeColor:(UIColor*)changeColor;

/**
 *   获取制定字体
 *
 *  @param text             全部字符串
 *  @param stringText       到Tostring之前的字是改变的
 *  @param changeFont       需要变色字体的font（默认字号为最小标准字号）
 *  @param changeText       需要变色字体的字符串
 *  @param changeColor      需要变色字体的颜色
 *  @param lineationFont    需要划线字体的font
 *  @param lineationText    需要划线字体的字符串
 *  @param lineationColor   需要划线字体的颜色
 *  @return 字体属性
 */
+ (NSMutableAttributedString *)changeNstring:(NSString *)text Tostring:(NSString *)stringText andFont:(CGFloat)changeFont changeText:(NSString *)changeText andColor:(UIColor *)changeColor andLineationText:(NSString *)lineationText andLineationColor:(UIColor *)lineationColor andLineationFont:(CGFloat)lineationFont;

+(NSAttributedString *)changeStringToAttributeSring:(NSString *)msg;

+ (float) heightForString:(NSString *)value font:(UIFont*)font andWidth:(float)width;

+ (float) heightForString:(NSString *)value font:(UIFont*)font andWidth:(float)width andNumberOfLines:(NSInteger)num;

+ (float) widthForString:(NSString *)value font:(UIFont*)font andHeight:(float)height;

+ (float) heightForHtmlString:(NSString *)value font:(UIFont*)font andWidth:(float)width;

/**
 * 设置label的显示
 */
+(void)setLabelBackgrond:(UIColor *)bgColor andTextColor:(UIColor *)textColor andConerRedio:(CGFloat)redio andBorderWith:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor andLabel:(UILabel *)label;

/**
 * 后面追加图片
 */
+(NSMutableAttributedString *)string:(NSString *)string appendImageName:(NSString *)imageName;

/**
  金额整数字体加粗字号变大

 @param text 改变的文字
 @param changeColor 改变的颜色
 @param fontSize 字体大小
 @param location 改变起始位置
 @return 改变字符串
 */
+ (NSMutableAttributedString *)getChangeString:(NSString *)text andColor:(UIColor *)changeColor andFont:(CGFloat)fontSize loc:(NSInteger)location;

/**
 金额数字整体加粗

 @param text 显示文字
 @param stringText 改变文字
 @param changesFont 加粗字体大小
 @param changeColor 字体颜色
 @return 加粗金额
 */
+ (NSMutableAttributedString *)getNstring:(NSString *)text changeyString:(NSString *)stringText andBoldFont:(CGFloat)changesFont andColory:(UIColor *)changeColor;


+(UIImage*)getImageWithPromoteTag:(NSString*)promoteTag;

+ (void)diableSideSlip:(UIViewController *)vc;

/**
 * 控制状态栏颜色
 */
+ (void)changeTopStateBarColor:(UIColor *)color;

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


/**
 *  删除沙盒中所有文件及文件夹
 *  folderName(文件夹名称)
 */
+ (void)deleteDocumentsWithFolderName:(NSString *)folderName;

/**
 *  读取沙盒中所有文件及文件夹
 *  folderName(文件夹名称)
 *  fileName(文件名称)
 */
+ (NSMutableDictionary *)readFileForPlistFileWithIndex:(NSInteger)index WithFolderName:(NSString *)folderName andFileName:(NSString *)fileName;

/** 获取倒计时时间（开始时间、结束时间，格式） */
+ (NSString *)countTimeIntervalWithCreatTime:(NSString *)createTime andDeadLineTime:(NSString *)deadLineTime withTimeFormat:(NSString *)timeFormat;

@end

NS_ASSUME_NONNULL_END
