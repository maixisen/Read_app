//
//  UIView+CodeView.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import "UIView+CodeView.h"
#import <objc/runtime.h>


@implementation UIView (CodeView)

- (CGFloat)cornerRadius
{
    return [objc_getAssociatedObject(self, @selector(cornerRadius)) floatValue];
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = (cornerRadius > 0);
}

- (BOOL)avatarCorner{
    return [objc_getAssociatedObject(self, @selector(cornerRadius)) floatValue] > 0;
}

- (void)setAvatarCorner:(BOOL)corner{
    if (corner){
        self.layer.cornerRadius = CGRectGetWidth(self.frame)/2;
        self.layer.masksToBounds = corner;
    }
}

- (CGFloat)borderWidth{
    return [objc_getAssociatedObject(self, @selector(borderWidth)) floatValue];
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = (borderWidth > 0);
}


- (UIColor *)borderColor{
    return objc_getAssociatedObject(self, @selector(borderColor));
}

- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}


+ (__kindof UIView *)MQLoadNibView{
    NSString *className = NSStringFromClass([self class]);
    return [[[UINib nibWithNibName:className bundle:nil] instantiateWithOwner:self options:nil] lastObject];
}


-(void)codeViewSetCornerRadius:(CGFloat)radius{
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
}
-(void)codeSetViewCircleWithBorderWidth:(CGFloat) width andColor:(UIColor *)borColor{
    [self codeViewSetCornerRadius:(self.frame.size.height/2)];
    self.layer.borderWidth=width;
    self.layer.borderColor=[borColor CGColor];
}

@end
