//
//  NSNumber+Category.m
//  MeicaiStore
//
//  Created by MU962 on 15/10/22.
//  Copyright © 2015年 MU Co., Ltd. All rights reserved.
//

#import "NSNumber+Category.h"

@implementation NSNumber (check)
-(instancetype)checkNumberIfnil
{
    if (self == nil)
    {
        return @0;
    }
    return self;
}
@end
