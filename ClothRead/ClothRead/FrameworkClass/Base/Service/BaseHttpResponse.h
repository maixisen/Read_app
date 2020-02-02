//
//  BaseResponse.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/3.
//  Copyright © 2019 lee. All rights reserved.
//

typedef enum {
    BaseHttpAlertTypeNone = 1001,
    BaseHttpAlertTypeNative,
    BaseHttpAlertTypeToast,
    BaseHttpAlertTypeWindowNative
}BaseHttpAlertType;

#import <Foundation/Foundation.h>

// 网络响应（本地处理）
@interface BaseHttpResponse : NSObject

// 服务器响应数据（有效信息）
@property(nonatomic, strong)id object;

// 服务器响应数据（错误信息/无效信息）
@property(nonatomic, strong)NSError *errorInfo;

// 请求的url
@property(nonatomic, strong)NSString *url;

// 判断是网络请求成功里面服务器返回的失败or没有服务器网络请求回来的失败 yes代表成功里面的失败 no代表就是纯粹网络失败
@property (nonatomic, assign) BOOL isRequestSuccessFail;

// 针对网络service，设置弹框类型
@property(nonatomic, assign)BaseHttpAlertType alertType;

// 网络唯一标示
@property(nonatomic ,assign) NSInteger tag;

@end
