//
//  BaseHttpManager.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/2.
//  Copyright © 2019 lee. All rights reserved.
//

#import "BaseHttpManager.h"

@implementation BaseHttpManager

static BaseHttpManager *baseManager = nil;

+ (instancetype)shareManager{
    
    if (baseManager == nil) {
        baseManager = [[BaseHttpManager alloc]init];
        baseManager.sessionManager = [AFHTTPSessionManager manager];
        baseManager.dataDictory = [NSMutableDictionary dictionary];
    }
    return baseManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseManager = [super allocWithZone:zone];
    });
    return baseManager;
}

- (id)copyWithZone:(NSZone *)zone{
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return self;
}
@end
