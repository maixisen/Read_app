//
//  NSArray+Log.m
//  Multiverse
//
//  Created by 张强张强 on 2019/12/31.
//  Copyright © 2019 lee. All rights reserved.
//

#import "NSArray+Log.h"


@implementation NSArray (Log)

/**
 *  输出正常NSArray的中文
 */

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];

    [strM appendString:@")"];

    return strM;
}

@end

@implementation NSDictionary (Log)

/**
 *  输出正常NSDictionary的中文
 */
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];

    [strM appendString:@"}\n"];

    return strM;
}


@end
