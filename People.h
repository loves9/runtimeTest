//
//  People.h
//  runtimeTest
//
//  Created by LKLFS on 16/7/7.
//  Copyright © 2016年 LKLFS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
{
    // 职业
    NSString * _occupation;
    // 国籍
    NSString * _nationality;
    
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSUInteger age;

- (NSDictionary *)allProperties;
- (NSDictionary *)allIvars;
- (NSDictionary *)allMethods;

- (void)sing;


@end
