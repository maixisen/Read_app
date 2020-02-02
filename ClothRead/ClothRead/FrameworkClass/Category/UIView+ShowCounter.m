//
//  UIView+ShowCounter.m
//  LLibrary
//
//  Created by lijinfei on 16/4/10.
//  Copyright © 2016年 bart. All rights reserved.
//

#import "UIView+ShowCounter.h"
static void *showCountKey = &showCountKey;
@implementation UIView (ShowCounter)
-(void)setShowCount:(NSNumber *)showCount
{
    objc_setAssociatedObject(self, & showCountKey, showCount, OBJC_ASSOCIATION_COPY);
}

-(NSNumber *)showCount
{
    return objc_getAssociatedObject(self, &showCountKey);
}
@end
