

#import "NSDate+Timer.h"

@implementation NSDate (Timer)


/**
 *  明天的日期
 *
 *  @return 明天的日期
 */
+ (NSDate *) dateTomorrow {
	return [self convertDateToLocalTime:[NSDate dateWithDaysFromNow:1]];
}

/**
 *  昨天的日期
 *
 *  @return 昨天日期
 */
+ (instancetype) dateYesterday {
	return [self convertDateToLocalTime:[NSDate dateWithDaysBeforeNow:1]];
}
/**
 *  现在的日期
 *
 *  @return 现在的日期
 */
+ (NSDate *) dateNow {
	return [self convertDateToLocalTime:[NSDate date]];
}



- (BOOL)isThisYear
{
    // 判断是否是今年 NSCalendar去做时间处理
    // 1.创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获取当前时间日期组件(年)
    NSDateComponents *curComp = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
	
    NSDateComponents *passComp = [calendar components:NSCalendarUnitYear fromDate:self];
    
    return curComp.year == passComp.year;
}
- (BOOL)isThisToday
{
    // 1.创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar isDateInToday:self];
}
- (BOOL)isThisYesterday
{
    // 1.创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    return [calendar isDateInYesterday:self];

}

- (NSDateComponents *)deltaWithNow
{
    // 1.创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:NSCalendarWrapComponents];
}

- (NSString *)dateToTimeStamp{
	return  [NSString stringWithFormat:@"%ld", (long)[self timeIntervalSince1970]];
}

/// 格式化NSDate
- (NSString *)dateToDateStringWithFormat:(NSString *)formatString {
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:formatString];
	return [dateFormatter stringFromDate:self];
}

/**
 *  将日期转换为当前时区的日期
 *
 *  @param forDate 要转换的日期
 *
 *  @return 转换过的日期
 */
+ (NSDate *)convertDateToLocalTime: (NSDate *)forDate {
	
	NSTimeZone *nowTimeZone = [NSTimeZone localTimeZone];
	NSInteger timeOffset = [nowTimeZone secondsFromGMTForDate:forDate];
	NSDate *newDate = [forDate dateByAddingTimeInterval:timeOffset];
	return newDate;
}

/**
 *  从现在起向后推几天的日期
 *
 *  @param days 向后推的天数
 *
 *  @return 后推得到的日期
 */
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days {
	return [self convertDateToLocalTime:[self dateByAddingDays:days]];
}

/**
 *  指定日期后推几天得到的日期
 *
 *  @param dDays 后推的天数
 *
 *  @return 后推得到的日期
 */
+ (instancetype) dateByAddingDays: (NSInteger) dDays {
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	[dateComponents setDay:dDays];
	NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:[[NSDate alloc] init] options:0];
	return newDate;
}


/**
 *  从现在起向前推几天的日期
 *
 *  @param days 向前推的天数
 *
 *  @return 前推得到的日期
 */
+ (instancetype) dateWithDaysBeforeNow: (NSInteger) days {
//	return [self convertDateToLocalTime:[[NSDate date] dateByAddingDays:days]];
//
	SHLog(@"%@", [[NSDate date] dateBySubtractingDays:days]);
	return [[NSDate date] dateBySubtractingDays:days];
}

/**
 *  指定日期前推几天的到的日期
 *
 *  @param dDays 前推的天数
 *
 *  @return 前推得到的日期
 */
- (instancetype) dateBySubtractingDays: (NSInteger) dDays {
	return [NSDate dateByAddingDays: (dDays * -1)];
//	return nil;
}


@end
