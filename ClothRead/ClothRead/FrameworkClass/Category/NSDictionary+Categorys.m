//
//  NSDictionary+Categorys.m
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

#import "NSDictionary+Categorys.h"

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * mutaStr = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [mutaStr appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [mutaStr appendString:@"}\n"];
    
    return mutaStr;
}

@end

@implementation NSMutableDictionary (Checknil)

-(void)setMUObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject != nil && anObject != NULL)
    {
        [self setObject:anObject forKey:aKey];
    }
    else
    {
//        [self setObject:[NSNull null] forKey:aKey];
        return;
    }
}

@end
