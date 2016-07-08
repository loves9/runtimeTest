//
//  People.m
//  runtimeTest
//
//  Created by LKLFS on 16/7/7.
//  Copyright © 2016年 LKLFS. All rights reserved.
//

#import "People.h"

#if TARGET_IPHONE_SIMULATOR
#import <objc/objc-runtime.h>
#else
#import <objc/runtime.h>
#import <objc/message.h>
#endif

@implementation People

// 获取类所有属性
- (NSDictionary *)allProperties
{
    unsigned int count = 0;
    NSMutableDictionary * resultDict = [[NSMutableDictionary alloc] init];

    // 获取类的所有属性
    objc_property_t * properties = class_copyPropertyList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        // 获取属性的名称和值
        const char *propertyName = property_getName(properties[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        
        if (propertyValue) {
            resultDict[name] = propertyValue;
        } else {
            resultDict[name] = @"字典的key对应的value不能为nil哦";
        }
    }
    
    // properties 是数组指针 需要释放内存
    free(properties);
    return resultDict;
}

// 获取所有属性  值
- (NSDictionary *)allIvars
{
    unsigned int count = 0;
    NSMutableDictionary * resultDict = [[NSMutableDictionary alloc] init];
    
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (NSUInteger i = 0; i < count; i ++) {
        
        const char *varName = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:varName];
        id varValue = [self valueForKey:name];
        
        if (varValue) {
            resultDict[name] = varValue;
        } else {
            resultDict[name] = @"字典的key对应的value不能为nil哦！";
        }
        
    }
    
    free(ivars);
    
    return resultDict;
}

- (NSDictionary *)allMethods
{
    unsigned int count = 0;
    NSMutableDictionary * resultDict = [[NSMutableDictionary alloc] init];
    
    // 获取类的所有方法，如果没有方法count就为0
    Method *methods = class_copyMethodList([self class], &count);
    
    for (NSUInteger i = 0; i < count; i ++) {
        
        // 获取方法名称
        SEL methodSEL = method_getName(methods[i]);
        const char *methodName = sel_getName(methodSEL);
        NSString *name = [NSString stringWithUTF8String:methodName];
        
        // 获取方法的参数列表
        int arguments = method_getNumberOfArguments(methods[i]);
        
        resultDict[name] = @(arguments-2);
    }
    
    free(methods);
    
    return resultDict;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    // 我们没有给People类声明sing方法，我们这里动态添加方法
    if ([NSStringFromSelector(sel) isEqualToString:@"sing"]) {
        class_addMethod(self, sel, (IMP)otherSing, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void otherSing(id self, SEL cmd)
{
    NSLog(@"%@ 唱歌啦！",((People *)self).name);
}

@end









