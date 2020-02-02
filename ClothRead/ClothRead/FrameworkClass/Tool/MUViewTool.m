//
//  MUViewTool.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import "MUViewTool.h"

@implementation MUViewTool
+(CGSize)getLabelActualSize:(NSString *)str andFont:(CGFloat)fontSize andLines:(NSInteger)lines andlabelWidth:(CGFloat)labelWidth
{
    NSString *fomateStr = STRING(str);
    
    CGSize size11 = [fomateStr sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName]];
    
    CGSize size = [fomateStr boundingRectWithSize:CGSizeMake(labelWidth, 100000) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName] context:nil].size;
    
    if (size.width == 0.0)
    {
        size = CGSizeMake(0.0f, 0.0f);
    }
    
    
    if (lines == 0)
    {
        if (size.width < labelWidth)
        {
            labelWidth = size.width;
        }
        return CGSizeMake(labelWidth,size.height);
    }
    else
    {
        NSInteger labelLines = (int)(size.height/size11.height);
        if (labelLines >= lines)
        {
            return CGSizeMake(labelWidth, lines * size11.height);
        }
        else
        {
            return CGSizeMake(labelWidth, labelLines * size11.height);
        }
    }
}

+(UIImage *)changeColorToImage:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)resizeImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    CGFloat imageW = image.size.width * 0.5;
    CGFloat imageH = image.size.height * 0.5;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) resizingMode:UIImageResizingModeTile];
}

+(CGSize)getImageSizeToChange:(UIImage *)image
{
    CGSize newSize;
    if (image.size.width <= 200 && image.size.height <= 200)
    {
        newSize = image.size;
    }
    else
    {
        if (image.size.width >= image.size.height)
        {
            newSize = CGSizeMake(200, ((image.size.height * 200) / image.size.width));
        }
        else
        {
            newSize = CGSizeMake(((image.size.width * 200) / image.size.height), 200);
        }
    }
    return newSize;
}
@end
