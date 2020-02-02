//
//  BaseTagBuilder.m
//  Multiverse
//
//  Created by Kathleen on 2019/10/4.
//  Copyright © 2019 lee. All rights reserved.
//

#import "BaseTagBuilder.h"

@implementation BaseTagBuilder

static BaseTagBuilder *tagBuilder = nil;

+ (instancetype)shareTagBuilder{
    if (tagBuilder == nil) {
        tagBuilder = [[BaseTagBuilder alloc]init];
        tagBuilder.httpTag = 0;
    }
    return tagBuilder;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tagBuilder = [super allocWithZone:zone];
    });
    return tagBuilder;
}

- (id)copyWithZone:(NSZone *)zone{
    return self;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return self;
}

- (NSUInteger)getHttpTag{
    _httpTag ++;
    if (_httpTag == UINT_MAX) {
        _httpTag = 0;
    }
    return _httpTag;
}

@end
