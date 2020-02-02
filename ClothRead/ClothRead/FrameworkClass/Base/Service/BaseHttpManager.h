//
//  BaseHttpManager.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/2.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  网络请求manager
 */
@interface BaseHttpManager : NSObject<NSCopying,NSMutableCopying>

/**
 *  网络请求队列管理
 */
@property(nonatomic , strong)AFHTTPSessionManager * sessionManager;

/**
 *  保存队列数据
 */
@property(nonatomic , strong)NSMutableDictionary *dataDictory;

/**
 *  单例
 */
+ (instancetype)shareManager;

@end

