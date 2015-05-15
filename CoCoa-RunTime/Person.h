//
//  Person.h
//  CoCoa-RunTime
//
//  Created by xujiaqi on 15/5/13.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *age;

- (void)eatFood;

- (void)drink;
@end
