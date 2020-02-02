//
//  BaseHttpService.h
//  Multiverse
//
//  Created by Kathleen on 2019/10/4.
//  Copyright © 2019 lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseHttpResponse.h"
#import "BaseHttpManager.h"

#define JSONRequsetTime  60


@protocol BaseHttpServiceDelegate <NSObject>

// 请求成功
- (void)requestSuccess:(BaseHttpResponse *)response;

// 请求失败
- (void)requestFail:(BaseHttpResponse *)response;

@end

// 网络响应数据的处理
@interface BaseHttpService : NSObject

// 代理
@property(nonatomic, weak)id<BaseHttpServiceDelegate> serviceDelegate;

// 处理成功从服务器响应的数据
- (void)manageServiceSuccess:(BaseHttpResponse *)responseObject anaAlertType:(BaseHttpAlertType)type;
// 处理未得到服务器响应的情况
- (void)manageServiceFail:(BaseHttpResponse *)responseObject anaAlertType:(BaseHttpAlertType)type;
// 处理网络请求失败或者网络请求成功返回error的情况
- (void)handlerFailInfo:(BaseHttpResponse *)responseObject;

@end
