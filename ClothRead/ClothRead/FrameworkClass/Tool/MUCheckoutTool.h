//
//  MUCheckoutTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/30.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUCheckoutTool : NSObject

// 校验手机号
+ (BOOL) validateMobile:(NSString *)mobileNum;
// 校验邮箱
+ (BOOL) validateEmail:(NSString *)email;
// 校验身份证
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

@end

NS_ASSUME_NONNULL_END
