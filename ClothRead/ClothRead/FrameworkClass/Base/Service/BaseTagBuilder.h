//
//  BaseTagBuilder.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/4.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 网络服务唯一标识（记录每次请求的tag标识）
@interface BaseTagBuilder : NSObject<NSCopying,NSMutableCopying>

/* 网路请求的唯一标识 */
@property(nonatomic , assign)NSUInteger httpTag;

/** 获取网络请求的tag实例(单例) */
+ (instancetype)shareTagBuilder;

/** 外部获取tag唯一标识 */
- (NSUInteger)getHttpTag;

@end

NS_ASSUME_NONNULL_END
