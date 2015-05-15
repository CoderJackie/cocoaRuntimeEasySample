//
//  ViewController.m
//  CoCoa-RunTime
//
//  Created by xujiaqi on 15/5/13.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import "Student.h"
#import "Person+Sleep.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    Person *person = [[Person alloc] init];
    objc_msgSend(person, @selector(eatFood));
    
    Student *student = [[Student alloc] init];
    objc_msgSend(student, sel_registerName("eatFood"));
    */
    
    /*
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivarList[i];
        const char *propertyName = ivar_getName(ivar);
        const char *typeEncoding = ivar_getTypeEncoding(ivar);
        NSLog(@"%s", propertyName);
        NSLog(@"%s", typeEncoding);
    }
    */

    /*
    Person *person = [[Person alloc] init];
    [person respondsToSelector:@selector(eatFood)];
    
    [Person instancesRespondToSelector:@selector(eatFood)];
    */
    
    /*
    Person *person = objc_msgSend(objc_msgSend([Person class], @selector(alloc)), @selector(init));
    objc_msgSend(person, @selector(drink));
    */
     
    /*
    //声明一个函数指针
    void (*MyPrint)(id,SEL,NSString*);
    
    MyPrint = (void (*)(id,SEL,NSString*))[self methodForSelector:@selector(Print:)];
    MyPrint(self,@selector(Print:),@"Hello World");
    */
    
    /*
    Person *person = [[Person alloc] init];
//    [person setSleepTime:8];
//    NSLog(@"%@", @([person sleepTime]));
    person.sleepTime = 8;
    NSLog(@"%@", @(person.sleepTime));
    */
    
    
#if 0   //关联属性
    /*Seciton 0. 关联数据的Key和Value*/
    static char overviewKey;
    static const char *myOwnKey = "VideoProperty\0";
    static const char intValueKey = 'i';
    
    NSArray *array = [[NSArray alloc]
                      initWithObjects:@ "One", @"Two", @"Three", nil];
    
    // For the purposes of illustration, use initWithFormat: to ensure
    // we get a deallocatable string
    NSString *overview = [[NSString alloc]
                          initWithFormat:@"%@", @"First three numbers"];
    NSString *videoKeyValue = @"This is a video";
    NSNumber *intValue = [[NSNumber alloc]initWithInt:5];
    
    /*Section 1. 关联数据设置部分*/
    objc_setAssociatedObject (
                              array,
                              &overviewKey,
                              overview,
                              OBJC_ASSOCIATION_RETAIN
                              );
    
    objc_setAssociatedObject (
                              array,
                              myOwnKey,
                              videoKeyValue,
                              OBJC_ASSOCIATION_RETAIN
                              );
    
    objc_setAssociatedObject (
                              array,
                              &intValueKey,
                              intValue,
                              OBJC_ASSOCIATION_RETAIN
                              );
    
    /*Section 3. 关联数据查询部分*/
    NSString *associatedObject =  (NSString *) objc_getAssociatedObject (array, &overviewKey);
    NSLog(@"associatedObject: %@", associatedObject);//First three numbers
    NSString *associatedObject2 = (NSString *) objc_getAssociatedObject(array, myOwnKey);
    NSLog(@"Video Key value is %@", associatedObject2);//This is a video
    NSString *assObject3 = (NSString *) objc_getAssociatedObject(array, &myOwnKey);
    if( assObject3 )
    {
        NSLog(@"不会进入这里! assObject3 应当为nil!");
    }
    else
    {
        NSLog(@"OK. 通过myOwnKey的地址是得不到数据的!");
    }
    NSNumber *assKeyValue = (NSNumber *) objc_getAssociatedObject(array, &intValueKey);
    NSLog(@"Int value is %d",[assKeyValue intValue]);
    
    /*Section 3. 关联数据清理部分*/
    objc_setAssociatedObject (
                              array,
                              &overviewKey,
                              nil,
                              OBJC_ASSOCIATION_ASSIGN
                              );
    
    objc_setAssociatedObject (
                              array,
                              myOwnKey,
                              nil,
                              OBJC_ASSOCIATION_ASSIGN
                              );
    
    objc_setAssociatedObject (
                              array,
                              &intValueKey,
                              nil,
                              OBJC_ASSOCIATION_ASSIGN
                              );
#endif

}

- (void)Print:(NSString*) str
{
    NSLog(@"%@",str);
}
@end
