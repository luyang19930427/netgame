//
//  NSDate+XRCategory.h
//  Predict
//
//  Created by 杜宁 on 2016/11/21.
//  Copyright © 2016年 xinrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XRCategory)

//时间戳---->NSDate
+ (NSDate *)dateFromTimestamp:(NSString *)timestamp;

//当前时间 -> 时间戳
- (long long)timestamp;

//时间戳---->时间字符串
+ (NSString *)parsingWithTimestamp:(NSString *)timestamp dateFormat:(NSString *)dateFormat;

+ (NSString*)stringFromTimestamp:(long long)timestamp dateFormat:(NSString *)dateFormat;

+ (NSString *)dateFromTimeString:(NSString *)times dateFormat:(NSString *)dateFormat;

/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;
/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;
@end
