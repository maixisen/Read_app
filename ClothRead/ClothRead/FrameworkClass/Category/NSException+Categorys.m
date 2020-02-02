//
//  NSException+Categorys.m
//  FrameworkProject
//
//  Created by MU on 15/8/4.
//  Copyright (c) 2015年 MU Co., Ltd. All rights reserved.
//

#import "NSException+Categorys.h"
#include <execinfo.h>

@implementation NSException (Trace)

- (NSArray *)backtrace
{
    NSArray *addresses = self.callStackReturnAddresses;
    unsigned count = (int)addresses.count;
    void **stack = malloc(count * sizeof(void *));
    
    for (unsigned i = 0; i < count; ++i)
    {
        stack[i] = (void *)[addresses[i] longValue];
    }
    
    
    char ** strings = (char **)backtrace_symbols(stack, count);
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; ++i)
    {
        [ret addObject:@(strings[i])];
    }
    
    
    free(stack);
    free(strings);
    
    return ret;
}

@end
