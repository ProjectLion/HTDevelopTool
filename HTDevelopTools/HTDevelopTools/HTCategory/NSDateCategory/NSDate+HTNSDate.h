//
//  NSDate+HTNSDate.h
//  HT
//
//  Created by HT on 2017/11/6.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HTNSDate)

/**
 根据date获取年份
 
 @param date date
 @return 年份
 */
+ (NSInteger)ht_getYear:(NSDate *)date;

/**
 根据date获取月份
 
 @param date date
 @return 月份
 */
+ (NSInteger)ht_getMonth:(NSDate *)date;

/**
 根据date获取天
 
 @param date date
 @return 天
 */
+ (NSInteger)ht_getDay:(NSDate *)date;

/**
 根据date获取小时
 
 @param date date
 @return 时
 */
+ (NSInteger)ht_getHour:(NSDate *)date;

/**
 根据date获取分钟
 
 @param date date
 @return 分钟
 */
+ (NSInteger)ht_getMinute:(NSDate *)date;

/**
 根据date获取秒
 
 @param date date
 @return 秒
 */
+ (NSInteger)ht_getSecond:(NSDate *)date;


/**
 转换时间格式 由yyyy-MM-dd HH:mm:ss到yyyy-MM-dd

 @param date 需要转换的date
 @return 转换后的date
 */
//+ (NSDate *)ht_transfDateFormatToDate:(NSDate *)date;


/**
 将时间字符串转为NSDate格式

 @param dateString 时间字符串
 @return NSDate
 */
+ (NSDate *)ht_transfStringToDate:(NSString *)dateString withFormat:(NSString *)format;

@end
