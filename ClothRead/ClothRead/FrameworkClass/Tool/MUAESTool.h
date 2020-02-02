//
//  MUAESTool.h
//  Multiverse
//
//  Created by Kathleen on 2019/11/28.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUAESTool : NSObject

/** 加密 */
+ (NSString *)AES128Encrypt:(NSString *)plainText key:(NSString *)key;
/** 解密 */
+ (NSString *)AES128Decrypt:(NSString *)encryptText key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
