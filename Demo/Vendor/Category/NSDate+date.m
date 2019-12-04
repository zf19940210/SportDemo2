//  NSDate+date.m
//  YDXZ
//  Created by bailing on 2018/7/18.
//  Copyright © 2018年 niecong. All rights reserved.

#import "NSDate+date.h"

@implementation NSDate (date)

// 判断是否为今年
- (BOOL)isThisYear
{
    
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // NSCalendarUnit枚举代表想获得哪些差值（这里设置年月日时分秒，那么接下来差值就会显示这几项的信息）
    //    NSCalendarUnit unit = NSCalendarUnitYear; // 这里直接放在下面就好了，不用再声明一个NSCalendarUnit对象
    
    
    // 获得某个时间的“年”这个元素
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self]; // 传进来的创建时间
    
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]]; //当前时间
    
    return dateCmps.year == nowCmps.year;
}

// 判断是否是今天
- (BOOL)isThisToday
{
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 先将这两个NSDate对象转换成NSString对象
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:nowDate];
    
    // 将不含时分秒的date字符串相比较，年月日完全相同时自然是同一天，也就是今天了
    return [dateStr isEqualToString:nowStr];
    
}

// 判断是否是昨天
- (BOOL)isThisYesterday
{
    NSDate *nowDate = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 先将这两个NSDate对象转换成NSString对象
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:nowDate];
    
    // 再将NSString按照fmt格式转换成不含 时分秒 的NSDate格式（目的就是为了去除 时分秒，单纯比较年月日）
    NSDate *date = [fmt dateFromString:dateStr];
    nowDate = [fmt dateFromString:nowStr];
    
    
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:nowDate options:0];
    
    // 我们只判断year与month相同情况下的day。year不同那么就算是昨天是去年的最后一天，我们也按照“非今年”的格式显示。month不同那么就算是昨天是上个月的最后一天我们也按照“今年的其他日子”的格式显示
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

@end
