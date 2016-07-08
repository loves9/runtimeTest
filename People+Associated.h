//
//  People+Associated.h
//  runtimeTest
//
//  Created by LKLFS on 16/7/7.
//  Copyright © 2016年 LKLFS. All rights reserved.
//

#import "People.h"

typedef void (^CodingCallBack)();

@interface People (Associated)
@property (nonatomic, strong) NSNumber *associatedBust; // 胸围
@property (nonatomic, copy) CodingCallBack associatedCallBack;  // 写代码
@end
