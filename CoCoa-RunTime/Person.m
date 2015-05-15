//
//  Person.m
//  CoCoa-RunTime
//
//  Created by xujiaqi on 15/5/13.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
- (void)eatFood
{
    NSLog(@"人吃饭");
}

//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    
//}

+ (BOOL)resolveInstanceMethod:(SEL)aSel
{
    if (aSel == @selector(drink)) {
        
        
        IMP imp = imp_implementationWithBlock(^(){
            NSLog(@"喝水drink");
        });
        
        
        /*
        Method method = class_getInstanceMethod([self class], @selector(drinkTea));
        
        IMP imp = method_getImplementation(method);
        */
        
        /*
        IMP imp = class_getMethodImplementation([self class], @selector(drinkTea));
        */

        class_addMethod([self class], aSel, imp, "v@:");
        
        return YES;
    } else {
        return [super resolveInstanceMethod:aSel];
    }
}

- (void)drinkTea
{
    NSLog(@"喝茶");
}
@end
