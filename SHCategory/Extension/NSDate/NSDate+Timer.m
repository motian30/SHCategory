

#import "NSDate+Timer.h"

@implementation NSDate (Timer)
- (BOOL)isThisYear
{
    // 判断是否是今年 NSCalendar去做时间处理
    // 1.创建日历类
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获取当前时间日期组件(年)
    NSDateComponents *curComp = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    // 获取发帖日期组件(年)
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


@end
