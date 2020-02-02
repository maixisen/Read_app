//
//  MUObjectTool.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import "MUObjectTool.h"
#import <CoreText/CTFont.h>
#import <CoreText/CTFramesetter.h>
#import <CoreText/CTStringAttributes.h>

@implementation MUObjectTool

+ (NSMutableAttributedString *)getNstring:(NSString *)text changeTextColor:(NSString *)changeText andColor:(UIColor *)changeColor
{
    NSMutableAttributedString * strings = [[NSMutableAttributedString alloc] initWithString:text];
    [strings addAttribute:NSForegroundColorAttributeName value:changeColor range:[text rangeOfString:[NSString stringWithFormat:@"%@",changeText]]];
    return strings;
}

+ (NSMutableAttributedString *)getNstring:(NSString *)text Tostring:(NSString *)stringText andFont:(CGFloat)changeFont changeText:(NSString *)changeText andColor:(UIColor *)changeColor
{
    CGFloat locations = [text rangeOfString:[NSString stringWithFormat:@"%@",stringText]].location;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changeFont] range:NSMakeRange(0, locations)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:changeColor range:[text rangeOfString:[NSString stringWithFormat:@"%@",changeText]]];
    
    return  attributedString;
}

+ (NSMutableAttributedString *)getNstring:(NSString *)text Tostring:(NSString *)stringText andFont:(CGFloat)changeFont
{
    CGFloat locations = [text rangeOfString:[NSString stringWithFormat:@"%@",stringText]].location;
    CGFloat length = [text rangeOfString:[NSString stringWithFormat:@"%@",stringText]].length;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changeFont] range:NSMakeRange(locations, length)];
    
    return  attributedString;
}
+ (NSMutableAttributedString *)getNstring:(NSString *)text changeString:(NSString *)stringText andFont:(CGFloat)changeFont andColor:(UIColor *)changeColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    if ([text containsString:stringText]) {
        NSInteger length = stringText.length;
        NSInteger totalLenght = text.length;
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changeFont] range:NSMakeRange(totalLenght-length, length)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:changeColor range:NSMakeRange(totalLenght-length, length)];
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(totalLenght-length, length)];
    }
    return  attributedString;
}

+ (NSMutableAttributedString *)getNstring:(NSString *)text changeyString:(NSString *)stringText andFonty:(CGFloat)changesFont andColory:(UIColor *)changeColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    if ([text containsString:stringText]) {
        NSInteger length = stringText.length;
        NSInteger totalLenght = text.length;
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changesFont] range:NSMakeRange(totalLenght-length, length)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:changeColor range:NSMakeRange(totalLenght-length, length)];
    }
    return  attributedString;
}

+ (NSMutableAttributedString *)getNstring:(NSString *)text changeyString:(NSString *)stringText andBoldFont:(CGFloat)changesFont andColory:(UIColor *)changeColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    if ([text containsString:stringText]) {
        NSInteger length = stringText.length;
        NSInteger totalLenght = text.length;
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:changesFont] range:NSMakeRange(totalLenght-length, length)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:changeColor range:NSMakeRange(totalLenght-length, length)];
    }
    return  attributedString;
}



+ (CAKeyframeAnimation *)testAnimationWithStart:(CGPoint)startPoint andEnd:(CGPoint)endPoint{
    
    CAKeyframeAnimation *an = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath, NULL, startPoint.x, startPoint.y);
    CGPathAddQuadCurveToPoint(thePath, NULL, 150, 30, endPoint.x, endPoint.y);
    an.path = thePath;
    an.duration = 0.7;
    CGPathRelease(thePath);
    return an;
}

+ (NSMutableDictionary *)changeNaviTitleColor:(UIColor *)color {
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#333333"];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    return textAttrs;
}

+ (NSString *)getStrWith:(NSMutableArray *)strArrays
{
    return [strArrays componentsJoinedByString:@","];
}
+ (UIImage *)grayscaleImageForImage:(UIImage *)image {
    const int RED = 1;
    const int GREEN = 2;
    const int BLUE = 3;
    
    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, image.size.width * image.scale, image.size.height * image.scale);
    
    int width = imageRect.size.width;
    int height = imageRect.size.height;
    
    // the pixels will be painted to this array
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [image CGImage]);
    
    for(int y = 0; y < height; y++) {
        for(int x = 0; x < width; x++) {
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            // convert to grayscale using recommended method: http://en.wikipedia.org/wiki/Grayscale#Converting_color_to_grayscale
            uint32_t gray = 0.3 * rgbaPixel[RED] + 0.59 * rgbaPixel[GREEN] + 0.11 * rgbaPixel[BLUE];
            
            // set the pixels to gray
            rgbaPixel[RED] = gray;
            rgbaPixel[GREEN] = gray;
            rgbaPixel[BLUE] = gray;
        }
    }
    
    // create a new CGImageRef from our context with the modified pixels
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    // make a new UIImage to return
    UIImage *resultUIImage = [UIImage imageWithCGImage:imageRef
                                                 scale:image.scale
                                           orientation:UIImageOrientationUp];
    
    // we're done with image now too
    CGImageRelease(imageRef);
    
    return resultUIImage;
}

+ (NSAttributedString *)getModelStr:(NSString *)str WithMarkStr:(NSString *)markStr WithChangeStr:(NSString *)changeStr isOrder:(BOOL)isOredr isCar:(BOOL)isCar{
    // 字号
    CGFloat pricesFont = 0.0l;
    if (isOredr) {
        pricesFont = 16;
    }else{
        pricesFont = 18;
    }
    // 去掉人民币符号
    NSString *dd = [str substringFromIndex:1];
    NSMutableString * price_strMutableString = [NSMutableString stringWithString:dd];
    // 获取‘/’前的几个字符的个数
    NSUInteger locations = [price_strMutableString rangeOfString:[NSString stringWithFormat:@"%@",markStr]].location;
    // 获取包括‘/’几个字符
    NSMutableString *addStr = (NSMutableString *)[price_strMutableString substringToIndex:locations];
//    NSMutableString *changeStrs = (NSMutableString *)[price_strMutableString substringWithRange:NSMakeRange(locations + 1, price_strMutableString.length - (locations + 1))];
    NSMutableString *addYuanStr = [NSMutableString stringWithFormat:@"%@元/%@",addStr,changeStr];
   
    return  [self getNstring:addYuanStr Tostring:[NSString stringWithFormat:@"%@",markStr] andFont:pricesFont changeText:changeStr andColor:[UIColor colorWithWhite:0.549 alpha:1.000]];
}
// 字符串加中划线
+ (NSAttributedString *)getLineStr:(NSString *)str{
    if (!str) {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, str.length)];
    return attributedString;
}
/**
 *  改变信号栏字体颜色
 *
 *  @param color 颜色参数
 */
+ (void)changeSignalFormatWithColor:(UIColor *)color{
    UIApplication * app = [UIApplication sharedApplication];
    id obj = [app valueForKeyPath:@"statusBar"];
    unsigned int propertyCount;
    objc_property_t * properties = class_copyPropertyList([obj class], &propertyCount);
    NSMutableArray * arr = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i < propertyCount; i++){
        objc_property_t property = properties[i];
        NSString * propertyStr = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        if ([propertyStr isEqualToString:@"foregroundColor"]){
            [obj setValue:color forKey:propertyStr];
        }
        [arr addObject:propertyStr];
    }
    free(properties);
}
+ (void)cancelRevokeWithController:(UIViewController *)VC{
    // 设置允许摇一摇功能
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    // 并让自己失去第一响应者
    [VC resignFirstResponder];
}
/**
 *  获取自定义文字属性状态
 *
 *  @param allStr    全部文字（带有人民币符号）
 *  @param changeStr 要改变的字段
 *
 *  @return 改变后的字符串状态
 */
+ (NSAttributedString *)getAttributedTest:(NSString *)allStr andChangeStr:(NSString *)changeStr {
    
    allStr = STRING(allStr);
    changeStr = STRING(changeStr);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
    //    MCLog(@"%@",attributedString);
    // 去掉人民币符号
    NSString *rr = [allStr substringToIndex:1];
    if (![rr isEqualToString:@"¥"]) {
        allStr = [NSString stringWithFormat:@"¥%@",allStr];
    }else{
        allStr = allStr;
    }
    
    if (changeStr.length > 0) {
        allStr = [NSString stringWithFormat:@"%@/%@",allStr,changeStr];
        NSString *dd = [allStr substringFromIndex:1];
        NSMutableString * price_strMutableString = [NSMutableString stringWithString:dd];
        // 获取‘/’前的几个字符的个数
        NSUInteger locations = [price_strMutableString rangeOfString:[NSString stringWithFormat:@"%@",@"/"]].location;
        // 获取包括‘/’几个字符
        NSMutableString *addStr = (NSMutableString *)[price_strMutableString substringToIndex:locations];
        NSMutableString *addYuanStr = [NSMutableString stringWithFormat:@"%@元/%@",addStr,changeStr];
        
        CGFloat str_location = [addYuanStr rangeOfString:[NSString stringWithFormat:@"%@",@"/"]].location;
        
        attributedString = [[NSMutableAttributedString alloc] initWithString:addYuanStr];
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(str_location , (addYuanStr.length - str_location ))];
        
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithWhite:0.549 alpha:1.000] range:[addYuanStr rangeOfString:[NSString stringWithFormat:@"/%@",changeStr]]];
    }else{
        NSString *yuanStr = [NSString stringWithFormat:@"%@元",allStr];
        NSString *dd = [yuanStr substringFromIndex:1];
        attributedString = [[NSMutableAttributedString alloc] initWithString:dd];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, dd.length)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, dd.length)];
    }
    
    return attributedString;
}

/**
 *  获取自定义文字属性状态
 *
 *  @param allStr    全部文字（带有人民币符号）
 *  @param changeStr 要改变的字段
 *  @param isInvalid 是否有效
 *  @return 改变后的字符串状态
 */
+ (NSAttributedString *)getAttributedTest:(NSString *)allStr andChangeStr:(NSString *)changeStr isInvalid:(BOOL)isInvalid {
    
    allStr = STRING(allStr);
    changeStr = STRING(changeStr);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]init];
    //    MCLog(@"%@",attributedString);
    // 去掉人民币符号
    NSString *rr = [allStr substringToIndex:1];
    if (![rr isEqualToString:@"¥"]) {
        allStr = [NSString stringWithFormat:@"¥%@",allStr];
    }else{
        allStr = allStr;
    }
    
    if (changeStr.length > 0) {
        allStr = [NSString stringWithFormat:@"%@/%@",allStr,changeStr];
        NSString *dd = [allStr substringFromIndex:1];
        NSMutableString * price_strMutableString = [NSMutableString stringWithString:dd];
        // 获取‘/’前的几个字符的个数
        NSUInteger locations = [price_strMutableString rangeOfString:[NSString stringWithFormat:@"%@",@"/"]].location;
        // 获取包括‘/’几个字符
        NSMutableString *addStr = (NSMutableString *)[price_strMutableString substringToIndex:locations];
        NSMutableString *addYuanStr = [NSMutableString stringWithFormat:@"%@元/%@", addStr, changeStr];
        
        CGFloat str_location = [addYuanStr rangeOfString:[NSString stringWithFormat:@"%@",@"/"]].location;
        
        attributedString = [[NSMutableAttributedString alloc] initWithString:addYuanStr];
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(str_location , (addYuanStr.length - str_location ))];
        UIColor *color = isInvalid ? MUSColor(153, 153, 153, 1) : [UIColor colorWithWhite:0.549 alpha:1.000];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:[addYuanStr rangeOfString:[NSString stringWithFormat:@"/%@",changeStr]]];
    }else{
        NSString *yuanStr = [NSString stringWithFormat:@"%@元",allStr];
        NSString *dd = [yuanStr substringFromIndex:1];
        attributedString = [[NSMutableAttributedString alloc] initWithString:dd];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, dd.length)];
        UIColor *color = isInvalid ? MUSColor(153, 153, 153, 1) : [UIColor blackColor];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, dd.length)];
    }
    
    return attributedString;

}

+ (NSMutableAttributedString *)getNstring:(NSString *)text  andFont:(CGFloat)changeFont  changeTextColor:(NSString *)changeText andColor:(UIColor *)changeColor loc:(NSInteger)location
{
    NSInteger length = changeText.length;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changeFont] range:NSMakeRange(location,length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:changeColor range:NSMakeRange(location,length)];
    
    return  attributedString;
}

+ (NSString *)removeBreakLineSymbolWithString:(NSString *)str {
    if ([str hasSuffix:@"\n"]) {
        NSString *newStr = [str substringToIndex:str.length - 1];
        return [self removeBreakLineSymbolWithString:newStr];
    } else {
        return str;
    }
}

+ (NSArray *)getLinesArrayOfString:(NSString *)string font:(CGFloat)sFont width:(CGFloat)width{
    NSString *text = string;
    UIFont *font = [UIFont systemFontOfSize:sFont];
    
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,width,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}
+(NSString *)stringCompletToFive:(NSString *)string
{
    NSMutableString * tmpStr = [NSMutableString string];
    if (string) {
        if (string.length < 5) {
            for (NSInteger i = 0; i < 5-string.length; i++) {
                [tmpStr appendFormat:@"0"];
            }
            [tmpStr appendString:string];
        }
    }
    return (NSString *)tmpStr;
}
+(UILabel *)createLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius
{
    UILabel * label = [[UILabel alloc]init];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    label.layer.borderWidth = borderWidth;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.cornerRadius = cornerRadius;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentLeft;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    return label;
}
+(UILabel *)createLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius bgColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)textAlignment hidden:(BOOL)isHidden text:(NSString *)text
{
    UILabel * label = [self createLabelWithFontSize:size textColor:color borderWidth:borderWidth borderColor:borderColor cornerRadius:cornerRadius];
    label.backgroundColor = bgColor;
    label.textAlignment = textAlignment;
    label.hidden = isHidden;
    label.text = text;
    label.clipsToBounds = YES;
    return label;
}

+(MUPaddingLabel *)createPadingLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius{
    MUPaddingLabel * label = [[MUPaddingLabel alloc]init];
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    label.layer.borderWidth = borderWidth;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.cornerRadius = cornerRadius;
    label.clipsToBounds = YES;
    label.numberOfLines = 1;
    label.textAlignment = NSTextAlignmentLeft;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    return label;
}
+(MUPaddingLabel *)resetPadingLabelWithFontSize:(NSInteger)size textColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius sourceLabel:(MUPaddingLabel *)label
{
    MUPaddingLabel * desLabel = label;
    desLabel.textColor = color;
    desLabel.layer.borderWidth = borderWidth;
    desLabel.layer.borderColor = borderColor.CGColor;
    desLabel.layer.cornerRadius = cornerRadius;
    desLabel.numberOfLines = 1;
    [desLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    return desLabel;
}
+(NSMutableAttributedString *)changeArString:(NSString *)string withChangeText:(NSString *)changeText withChangeFontSize:(NSInteger)fontSize withChangeColor:(UIColor *)changeColor
{
    if (!string) {
        return  [[NSMutableAttributedString alloc]initWithString:@""];
    }
    
    NSMutableAttributedString * aString = [[NSMutableAttributedString alloc]initWithString:string];
    NSRange range = [string rangeOfString:changeText];
    if (changeColor) {
        [aString addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
    }
    [aString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:range];
    return aString;
}
+ (NSMutableAttributedString *)changeNstring:(NSString *)text Tostring:(NSString *)stringText andFont:(CGFloat)changeFont changeText:(NSString *)changeText andColor:(UIColor *)changeColor andLineationText:(NSString *)lineationText andLineationColor:(UIColor *)lineationColor andLineationFont:(CGFloat)lineationFont;{
    
    CGFloat locations = [text rangeOfString:[NSString stringWithFormat:@"%@",stringText]].location;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:changeFont] range:NSMakeRange(0, locations)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:changeColor range:[text rangeOfString:[NSString stringWithFormat:@"%@",changeText]]];
    
    if ([text containsString:lineationText]) {
        NSInteger length = lineationText.length;
        NSInteger totalLenght = text.length;
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:lineationFont] range:NSMakeRange(totalLenght-length, length)];
        
        [attributedString addAttribute:NSForegroundColorAttributeName value:lineationColor range:NSMakeRange(totalLenght-length, length)];
        
        [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(totalLenght-length, length)];
        
        [attributedString addAttributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSBaselineOffsetAttributeName:@(0)} range:NSMakeRange(totalLenght-length, length)];
    }
    return  attributedString;
}
+(NSAttributedString *)changeStringToAttributeSring:(NSString *)msg
{
    NSAttributedString * aMsg;
    if (msg.length > 0) {
        aMsg = [[NSAttributedString alloc]initWithString:msg];
    }else{
        aMsg = nil;
    }
    return aMsg;
}
+ (float) heightForString:(NSString *)value font:(UIFont*)font andWidth:(float)width{
    UILabel *detailTextView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    detailTextView.font = font;
    detailTextView.text = value;
    detailTextView.numberOfLines = 2;
    detailTextView.lineBreakMode = NSLineBreakByCharWrapping;
    [detailTextView sizeToFit];
    return detailTextView.height;
}
+ (float) heightForString:(NSString *)value font:(UIFont*)font andWidth:(float)width andNumberOfLines:(NSInteger)num{
    UILabel *detailTextView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    detailTextView.font = font;
    detailTextView.text = value;
    detailTextView.numberOfLines = num;
    detailTextView.lineBreakMode = NSLineBreakByCharWrapping;
    [detailTextView sizeToFit];
    return detailTextView.height;
}
+ (float) heightForHtmlString:(NSString *)value font:(UIFont*)font andWidth:(float)width
{
    UILabel *detailTextView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    detailTextView.font = font;
    detailTextView.numberOfLines = 0;
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithData:[value dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    detailTextView.attributedText = attStr;
    [detailTextView sizeToFit];
    return detailTextView.height;
 
}
+ (float) widthForString:(NSString *)value font:(UIFont*)font andHeight:(float)height{
    UILabel *detailTextView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, height)];
    detailTextView.font = font;
    detailTextView.text = value;
    detailTextView.numberOfLines = 2;
    detailTextView.lineBreakMode = NSLineBreakByCharWrapping;
    [detailTextView sizeToFit];
    return detailTextView.width;
}

+(void)setLabelBackgrond:(UIColor *)bgColor andTextColor:(UIColor *)textColor andConerRedio:(CGFloat)redio andBorderWith:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor andLabel:(UILabel *)label
{
    label.backgroundColor = bgColor;
    label.textColor= textColor;
    label.layer.cornerRadius = redio;
    label.layer.borderColor = borderColor.CGColor;
    label.layer.borderWidth = borderWidth;
}
+(NSMutableAttributedString *)string:(NSString *)string appendImageName:(NSString *)imageName
{
    if (!string) {
        return nil;
    }
    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
    [attriStr insertAttributedString:stringImage atIndex:string.length];
    attchImage.image = [UIImage imageNamed:imageName];
    attchImage.bounds = CGRectMake(3, -3, 24, 15);
    return attriStr;
}
+ (NSMutableAttributedString *)getChangeString:(NSString *)text andColor:(UIColor *)changeColor andFont:(CGFloat)fontSize loc:(NSInteger)location
{
    if (!text) {
        return  [[NSMutableAttributedString alloc]initWithString:@""];
    }
    NSMutableAttributedString * aString = [[NSMutableAttributedString alloc]initWithString:text];
    NSArray *arr = [text componentsSeparatedByString:@"."];
    NSString *changeStr = [arr firstObject];
    NSString *rr = [changeStr substringFromIndex:1];
    
    NSInteger length = rr.length;
    [aString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontSize] range:NSMakeRange(location,length)];
    [aString addAttribute:NSForegroundColorAttributeName value:changeColor range:NSMakeRange(location,length)];

 return  aString;
}

+(UIImage *)getImageWithPromoteTag:(NSString *)promoteTag{
    if (!promoteTag) {
        return nil;
    }
    if ([promoteTag isEqualToString:@"2"]) {
       return  [UIImage imageNamed:@"jiang"];
    }if ([promoteTag isEqualToString:@"4"]) {
     return  [UIImage imageNamed:@"miao"];
    }
    if ([promoteTag isEqualToString:@"5"]) {
        return [UIImage imageNamed:@"xian"];
    }
    return nil;
}

+(NSString *)analysisWithOrderUrl:(NSString *)orderUrl{
    if ([orderUrl rangeOfString:@"?"].location != NSNotFound) {
        return [NSString  stringWithFormat:@"%@&",orderUrl];
    }else{
        return [NSString  stringWithFormat:@"%@?",orderUrl];
    }
    return nil;
}
// 禁止某个页面侧滑
+ (void)diableSideSlip:(UIViewController *)vc{
    id traget =vc.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:traget action:nil];
    [vc.view addGestureRecognizer:pan];
}

/**
 * 控制状态栏颜色
 */
+ (void)changeTopStateBarColor:(UIColor *)color{
    if (@available(iOS 13.0, *)) {
       UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].windows[0].windowScene.statusBarManager.statusBarFrame] ;
        statusBar.backgroundColor = color;
        [[UIApplication sharedApplication].windows[0] addSubview:statusBar];
    } else {
        // Fallback on earlier versions
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
           if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
               statusBar.backgroundColor = color;
           }
    }
}

+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {

    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {

    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];

}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {

    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeThatFits:CGSizeZero];
}

+(void)deleteDocumentsWithFolderName:(NSString *)folderName{
    NSString * documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *dataFilePath = [documentsPath stringByAppendingPathComponent:folderName];

    NSLog(@" ------ %@ --------" , dataFilePath);
    NSError *error = nil;
    
    // 删除子文件夹
    BOOL isDelete = [[NSFileManager defaultManager] removeItemAtPath:dataFilePath error:&error];
    if (!isDelete) {
        NSLog(@"删除失败");
    }
    else{
        NSLog(@"删除成功");
    }
}

+ (NSMutableDictionary *)readFileForPlistFileWithIndex:(NSInteger)index WithFolderName:(NSString *)folderName andFileName:(NSString *)fileName{
    
    //获取完整路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    // 子文件夹路径
    NSString *dataFilePath = [documentsPath stringByAppendingPathComponent:folderName];
    
    NSString *plistPath = [dataFilePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%ld.plist",fileName,(long)index]];
    
    NSMutableDictionary *usekkrsDic = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];

    return usekkrsDic;
}

+ (NSString *)countTimeIntervalWithCreatTime:(NSString *)createTime andDeadLineTime:(NSString *)deadLineTime withTimeFormat:(NSString *)timeFormat{
    
    NSDateFormatter *dataFormatter = [[NSDateFormatter alloc]init];
    dataFormatter.dateFormat = timeFormat;
    
    NSDate *createDate = [dataFormatter dateFromString:createTime];
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[createDate timeIntervalSince1970]] integerValue]*1000;
    
    // 优惠开始时间
    NSString *currentDayStr = [dataFormatter stringFromDate:[dataFormatter dateFromString:deadLineTime]];
    NSDate *currentDate = [dataFormatter dateFromString:currentDayStr];
    
    //优惠结束的时间，也用相同的格式去转换
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeSp/1000.0];
    NSString *deadlineStr = [dataFormatter stringFromDate:date];
    NSDate *deadlineDate = [dataFormatter dateFromString:deadlineStr];
    
    NSString * _timeInterval = [NSString stringWithFormat:@"%f",[currentDate timeIntervalSinceDate:deadlineDate]];
    
    return _timeInterval;
}


@end
