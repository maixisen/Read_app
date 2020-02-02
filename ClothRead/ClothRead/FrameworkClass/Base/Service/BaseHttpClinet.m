//
//  BaseHttpClinet.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/3.
//  Copyright © 2019 lee. All rights reserved.
//

#import "BaseHttpClinet.h"
#import "BaseHttpManager.h"
#import "BaseHttpResponse.h"
#import "BaseTagBuilder.h"


@implementation BaseHttpClinet

+ (NSUInteger)getDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut{
    
    // 设置请求tag标识
    NSInteger httpTag = [[BaseTagBuilder shareTagBuilder] getHttpTag];
    
    AFHTTPSessionManager *manager = [self  setAFNWithtimeOut:timeOut andUrl:url andDicLog:parameters andHttpTag:httpTag];
    
    NSURLSessionTask *task = [manager GET:url parameters:[MUAESTool AES128Encrypt:[self dictionaryToJson:parameters] key:AES128Key] progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BaseHttpResponse *response = [self responseWithResponseObject:responseObject andUrl:url andIsSuccessService:YES andHttpTag:httpTag];
        // 数据返回
        if (httpSuccess) httpSuccess(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDictionary *errorData = [self dictionaryWithJsonString:str];
        
        BaseHttpResponse *response = [self responseWithResponseObject:errorData andUrl:url andIsSuccessService:NO andHttpTag:httpTag];
        // 数据返回
        if (httpFail) httpFail(response);
               
    }];
    
    [[BaseHttpManager shareManager].dataDictory sui_setObj:task forKey:[NSString stringWithFormat:@"%lu",(long)httpTag]];
    return httpTag;
}

+ (NSUInteger)postDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut{
    
    // 设置请求tag标识
    NSInteger httpTag = [[BaseTagBuilder shareTagBuilder] getHttpTag];
    
    AFHTTPSessionManager *manager = [self  setAFNWithtimeOut:timeOut andUrl:url andDicLog:parameters andHttpTag:httpTag];
    
    NSURLSessionDataTask *task = [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BaseHttpResponse *response = [self responseWithResponseObject:responseObject andUrl:url andIsSuccessService:YES andHttpTag:httpTag];
        // 数据返回
        if (httpSuccess) httpSuccess(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSData * data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        
        NSString * str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        NSDictionary *errorData = [self dictionaryWithJsonString:str];
        
        BaseHttpResponse *response = [self responseWithResponseObject:errorData andUrl:url andIsSuccessService:NO andHttpTag:httpTag];
        // 数据返回
        if (httpFail) httpFail(response);
    }];

   [[BaseHttpManager shareManager].dataDictory sui_setObj:task forKey:[NSString stringWithFormat:@"%lu",(long)httpTag]];
    return httpTag;
}

+ (NSUInteger)putDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut{
    
    // 设置请求tag标识
    NSInteger httpTag = [[BaseTagBuilder shareTagBuilder] getHttpTag];
    
    AFHTTPSessionManager *manager = [self  setAFNWithtimeOut:timeOut andUrl:url andDicLog:parameters andHttpTag:httpTag];
    
    NSURLSessionDataTask *task = [manager PUT:url parameters:[MUAESTool AES128Encrypt:[self dictionaryToJson:parameters] key:AES128Key] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BaseHttpResponse *response = [self responseWithResponseObject:responseObject andUrl:url andIsSuccessService:YES andHttpTag:httpTag];
        // 数据返回
        if (httpSuccess) httpSuccess(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        BaseHttpResponse *response = [self responseWithResponseObject:error andUrl:url andIsSuccessService:NO andHttpTag:httpTag];
        // 数据返回
        if (httpFail) httpFail(response);
    }];
    
    [[BaseHttpManager shareManager].dataDictory sui_setObj:task forKey:[NSString stringWithFormat:@"%lu",(long)httpTag]];
    return httpTag;
}

+ (NSUInteger)deleteDataWithUrl:(NSString *)url andParameters:(NSMutableDictionary *)parameters andHttpSuccess:(successBlock)httpSuccess andHttpFail:(failBlock)httpFail andTimeOut:(NSInteger)timeOut{
    
    // 设置请求tag标识
    NSInteger httpTag = [[BaseTagBuilder shareTagBuilder] getHttpTag];
    
    AFHTTPSessionManager *manager = [self  setAFNWithtimeOut:timeOut andUrl:url andDicLog:parameters andHttpTag:httpTag];
    
    NSURLSessionDataTask *task = [manager DELETE:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        BaseHttpResponse *response = [self responseWithResponseObject:responseObject andUrl:url andIsSuccessService:YES andHttpTag:httpTag];
        // 数据返回
        if (httpSuccess) httpSuccess(response);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        BaseHttpResponse *response = [self responseWithResponseObject:error andUrl:url andIsSuccessService:NO andHttpTag:httpTag];
        // 数据返回
        if (httpFail) httpFail(response);
    }];
    
    [[BaseHttpManager shareManager].dataDictory sui_setObj:task forKey:[NSString stringWithFormat:@"%lu",(long)httpTag]];
    return httpTag;
}

// 创建AFN
+ (AFHTTPSessionManager *)setAFNWithtimeOut:(NSInteger)timeOut andUrl:(NSString *)url andDicLog:(NSDictionary *)dicLog andHttpTag:(NSInteger)httpTag{
    
    NSDictionary *dataDicLog = dicLog;
    
    NSLog(@"上传服务器参数（url:%@ \ntag:%lu）----\n%@\n",url,(long)httpTag,dataDicLog);
    
    // 创建AFN
    AFHTTPSessionManager *manager = [BaseHttpManager shareManager].sessionManager;
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = timeOut;
    // 设置请求序列化
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置回调序列化
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    return manager;
}
// 服务器返回数据处理
+ (BaseHttpResponse *)responseWithResponseObject:(id  _Nullable)responseObject andUrl:(NSString *)url andIsSuccessService:(BOOL)isSuccess andHttpTag:(NSInteger)httpTag{
    
    // 服务器返回数据处理
    BaseHttpResponse *response = [[BaseHttpResponse alloc]init];
    NSDictionary *responsDict = nil;
    if (isSuccess) {
        NSString *dataStr = [MUAESTool AES128Decrypt:[responseObject sui_objectForKey:@"message"] key:AES128Key];
        NSLog(@"url:%@：__tag:%lu___接口返回_____：%@",url, (long)httpTag,dataStr);
        responsDict = (NSDictionary *)[self dictionaryWithJsonString:dataStr];
        [responsDict setValue:[responseObject objectForKey:@"code"] forKey:@"code"];
    }
    // 处理success/error
    (isSuccess)? (response.object = responsDict):(response.errorInfo = responseObject);
    response.tag = httpTag;
    response.url = url;
    
    return response;
}
// 字典转json格式字符串：
+ (NSString *)dictionaryToJson:(NSMutableDictionary *)dic{
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
// json格式字符串转字典：
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
