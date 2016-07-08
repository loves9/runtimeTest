//
//  main.m
//  runtimeTest
//
//  Created by LKLFS on 16/7/7.
//  Copyright © 2016年 LKLFS. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

#import "People.h"
#import "People+Associated.h"
#import "Bird.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        People * teacher = [[People alloc] init];
        teacher.name = @"松岛枫";
        teacher.age = 28;
        [teacher setValue:@"老师" forKey:@"occupation"];
        [teacher setValue:@"霓虹国" forKey:@"nationality"];
        
//        teacher.associatedBust = @(90);
//        teacher.associatedCallBack = ^(){
//            NSLog(@"苍老师要写代码了！");
//        };
//        teacher.associatedCallBack();
        
//        NSDictionary *propertyResultDic = [teacher allProperties];
//        for (NSString *propertyName in propertyResultDic.allKeys) {
//            NSLog(@"propertyName:%@, propertyValue:%@",propertyName, propertyResultDic[propertyName]);
//        }
//        
//        NSDictionary *ivarResultDic = [teacher allIvars];
//        for (NSString *ivarName in ivarResultDic.allKeys) {
//            NSLog(@"ivarName:%@, ivarValue:%@",ivarName, ivarResultDic[ivarName]);
//        }
//        
//        NSDictionary *methodResultDic = [teacher allMethods];
//        for (NSString *methodName in methodResultDic.allKeys) {
//            NSLog(@"methodName:%@, argumentsCount:%@", methodName, methodResultDic[methodName]);
//        }
        
//        [teacher sing];
        
        Bird *bird = [[Bird alloc] init];
        bird.name = @"不死鸟";
        ((void (*)(id, SEL))objc_msgSend)((id)bird, @selector(sing));
    }
    return 0;
}
