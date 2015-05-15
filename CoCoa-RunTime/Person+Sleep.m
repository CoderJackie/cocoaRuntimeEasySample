//
//  Person+Sleep.m
//  CoCoa-RunTime
//
//  Created by xujiaqi on 15/5/15.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "Person+Sleep.h"
#import <objc/runtime.h>

static char sleepTimeKey;
@implementation Person (Sleep)

- (void)setSleepTime:(NSInteger)sleepTime
{
    objc_setAssociatedObject(self, &sleepTimeKey, @(sleepTime), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)sleepTime
{
    NSNumber *number = (NSNumber *)objc_getAssociatedObject(self, &sleepTimeKey);
    return [number integerValue];
}
@end
