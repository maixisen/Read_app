//
//  BaseHttpClinet.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/3.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseHttpResponse;

// 成功回调
typedef void(^successBlock)(BaseHttpResponse *response);
// 失败回调
typedef void(^failBlock)(BaseHttpResponse * response);

// 网络请求业务
@interface BaseHttpClinet : NSObject

/**
 *  get请求方式请求网络数
 *
 *  @param url             接口URI
 *  @param parameters      请求数据参数
 *  @param httpSuccess     成功回调
 *  @param httpFail        失败回调
 *  @param timeOut         请求时间
 *
 *  return
*/
+ (NSUInteger)getDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut;

/**
 *  post请求方式请求网络数
 *
 *  @param url             接口URI
 *  @param parameters      请求数据参数
 *  @param httpSuccess     成功回调
 *  @param httpFail        失败回调
 *  @param timeOut         请求时间
 *
 *  return
 */
+ (NSUInteger)postDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut;

/**
 *  put请求方式请求网络数
 *
 *  @param url             接口URI
 *  @param parameters      请求数据参数
 *  @param httpSuccess     成功回调
 *  @param httpFail        失败回调
 *  @param timeOut         请求时间
 *
 *  return
 */
+ (NSUInteger)putDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut;

/**
 *  delete请求方式请求网络数
 *
 *  @param url             接口URI
 *  @param parameters      请求数据参数
 *  @param httpSuccess     成功回调
 *  @param httpFail        失败回调
 *  @param timeOut         请求时间
 *
 *  return
 */
+ (NSUInteger)deleteDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut;

@end

