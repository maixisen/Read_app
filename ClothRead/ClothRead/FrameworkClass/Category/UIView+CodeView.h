//
//  UIView+CodeView.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/26.
//  Copyright © 2019 lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CodeView)

@property (nonatomic) IBInspectable CGFloat cornerRadius;

/** 头像圆角 */
@property (nonatomic) IBInspectable BOOL avatarCorner;

/** 边框 */
@property (nonatomic) IBInspectable CGFloat borderWidth;

/** 边框颜色*/
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

+ (__kindof UIView *)MQLoadNibView;

- (void)codeSetViewCircleWithBorderWidth:(CGFloat) width andColor:(UIColor *)borColor;

- (void)codeViewSetCornerRadius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
