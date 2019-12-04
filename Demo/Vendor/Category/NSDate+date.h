//  NSDate+date.h
//  YDXZ
//  Created by bailing on 2018/7/18.
//  Copyright © 2018年 niecong. All rights reserved.

#import <Foundation/Foundation.h>

@interface NSDate (date)
//显示时间的工具类
// 是否是今年
- (BOOL)isThisYear;

// 是否今天
- (BOOL)isThisToday;

// 是否昨天
- (BOOL)isThisYesterday;

@end
