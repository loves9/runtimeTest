//
//  Bird.m
//  runtimeTest
//
//  Created by LKLFS on 16/7/7.
//  Copyright © 2016年 LKLFS. All rights reserved.
//

#import "Bird.h"
#import "People.h"
@implementation Bird

// 1. 不动态添加方法  进入第二步
+ (BOOL)resolveClassMethod:(SEL)sel{
    return NO;
}

// 2. 不指定备选对象 响应aSelector，进入第三步
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return nil;
}

// 3. 返回方法选择器 然后进入第四步
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

// 第四部：这步我们修改调用对象
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    // 我们改变调用对象为People
    People *cangTeacher = [[People alloc] init];
    cangTeacher.name = @"苍老师";
    [anInvocation invokeWithTarget:cangTeacher];
}
@end






