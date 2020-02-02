//
//  NSArray+Categorys.m
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

#import "NSArray+Categorys.h"

@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mutaStr appendFormat:@"\t%@,\n", obj];
    }];
    
    [mutaStr appendString:@")"];
    
    return mutaStr;
}

- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}
@end
