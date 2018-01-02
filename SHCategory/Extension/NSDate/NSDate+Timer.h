

#import <Foundation/Foundation.h>

@interface NSDate (Timer)


/// 判断是否是今年
- (BOOL)isThisYear;

/// 判断下是否是今天
- (BOOL)isThisToday;

/// 判断下是否是昨天
- (BOOL)isThisYesterday;

/// 获取与当前时间差值
- (NSDateComponents *)deltaWithNow;

/// 获取时间戳
- (NSString *)dateToTimeStamp;


/**
 格式化NSDate

 @param formatString 时间转化格式
 @return 格式化字符串
 
 
 G: 公元时代，例如AD公元
 yy: 年的后2位
 yyyy: 完整年
 MM: 月，显示为1-12
 MMM: 月，显示为英文月份简写,如 Jan
 MMMM: 月，显示为英文月份全称，如 Janualy
 dd: 日，2位数表示，如02
 d: 日，1-2位显示，如 2
 D: 今年的第几天，如361
 EEE: 简写星期几，如Sun
 EEEE: 全写星期几，如Sunday
 aa: 上下午，AM/PM
 H: 时，24小时制，0-23
 K：时，12小时制，0-11
 m: 分，1-2位
 mm: 分，2位
 s: 秒，1-2位
 ss: 秒，2位
 S: 毫秒
 
 */
- (NSString *)dateToDateStringWithFormat:(NSString *)formatString ;



#pragma mark - 类方法
/**
 *  现在的日期
 *
 *  @return 现在的日期
 */
+ (instancetype) dateNow;

/**
 *  明天的日期
 *
 *  @return 明天的日期
 */
+ (instancetype) dateTomorrow;

/**
 *  昨天的日期
 *
 *  @return 昨天的日期
 */
+ (instancetype) dateYesterday;

+ (instancetype) dateWithDaysBeforeNow: (NSInteger) days;

+ (instancetype) dateByAddingDays: (NSInteger) dDays;
+ (instancetype)convertDateToLocalTime: (NSDate *)forDate;

@end
