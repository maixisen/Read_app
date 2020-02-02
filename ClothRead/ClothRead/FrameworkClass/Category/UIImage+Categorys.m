//
//  UIImage+Categorys.m
//  FrameworkProject
//
//  Created by 陈哲是个好孩子 on 15/8/4.
//  Copyright (c) 2015年 Beijing Yunshan Information Technology Co., Ltd. All rights reserved.
//

#import "UIImage+Categorys.h"


@implementation UIImage (Transform)

-(UIImage *)compressToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGRect rect = {{0,0}, size};
    [self drawInRect:rect];
    UIImage * compressedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImg;
}

-(CGSize)getContainerSizeWithLimitWidth:(CGFloat)limitWidth andLimitHeight:(CGFloat)limitHeight
{
    CGSize newSize;
    CGFloat width1 = self.size.width;
    CGFloat height1 = self.size.height;
    if (width1 <= limitWidth && height1 <= limitHeight)
    {
        newSize = self.size;
    }
    else
    {
        if (width1 >= height1)
        {
            newSize = CGSizeMake(limitWidth, ((height1 * limitWidth) / width1));
        }
        else
        {
            newSize = CGSizeMake(((width1 * limitHeight) / height1), limitHeight);
        }
    }
    return newSize;
}

-(UIImage *)resizeImageWithEdge:(UIEdgeInsets)edgeInset
{
    return [self resizableImageWithCapInsets:edgeInset resizingMode:UIImageResizingModeTile];
}

+(UIImage *)transformToPureImageWithColor:(UIColor *)color
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

-(UIImage*)imageRotatedByDegrees:(CGFloat)degrees
{
    
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    CGSize rotatedSize;
    
    rotatedSize.width = width;
    rotatedSize.height = height;
    
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);
    CGContextRotateCTM(bitmap, M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



@end

@implementation UIImage (Bundle)

+(NSString*)getAppIconPath
{
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

+(UIImage *)getAppIcon
{
    return [[UIImage alloc] initWithContentsOfFile:[self getAppIconPath]];
}

+(UIImage *)getCurrentScreenImage:(UIView *)vie
{
    UIImage * img = nil;
//    @try {
//        if ([[MCDeviceTool getDeviceSystemVersion] floatValue] >= 8.3)
//        {
//            UIGraphicsBeginImageContextWithOptions(vie.size, vie.opaque, 0.0);
//            [vie.layer renderInContext:UIGraphicsGetCurrentContext()];
//            img = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//        }
//        else
//        {
//            if (CGRectIsEmpty(vie.bounds))
//            {
//                UIGraphicsBeginImageContextWithOptions(vie.size, vie.opaque, 0.0);
//                [vie.layer renderInContext:UIGraphicsGetCurrentContext()];
//                img = UIGraphicsGetImageFromCurrentImageContext();
//                UIGraphicsEndImageContext();
//            }
//            else
//            {
//                img = [UIImage imageNamed:@"lunch_start.jpg"];
//            }
//        }
//
//    }
//    @catch (NSException *exception) {
//        img = [UIImage imageNamed:@"lunch_start.jpg"];
//    }
//    @finally {
//        if(!img)
//        {
//            img = [UIImage imageNamed:@"lunch_start"];
//        }
//        return img;
//    }
    return img;
}

+ (UIImage*)imageWithSize:(CGSize)size borderColor:(UIColor *)color borderWidth:(CGFloat)borderWidth
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [[UIColor clearColor] set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGFloat lengths[] = { 10, 5 };
    CGContextSetLineDash(context, 0, lengths, 1);
    CGContextMoveToPoint(context, 0.0, 0.0);
    CGContextAddLineToPoint(context, size.width, 0.0);
    CGContextAddLineToPoint(context, size.width, size.height);
    CGContextAddLineToPoint(context, 0, size.height);
    CGContextAddLineToPoint(context, 0.0, 0.0);
    CGContextStrokePath(context);
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
