
#ifndef Log_h
#define Log_h

#import <asl.h>

#define FILE [(@"" __FILE__) lastPathComponent]


#define _NSLog(fmt,...) {                                           \
do                                                                  \
{                                                                   \
NSString *str = [NSString stringWithFormat:fmt, ##__VA_ARGS__];     \
printf("%s\n",[str UTF8String]);                                    \
asl_log(NULL, NULL, ASL_LEVEL_NOTICE, "%s", [str UTF8String]);      \
}                                                                   \
while (0);                                                          \
}


//#define NSLog(fmt, ...) _NSLog((@"flie - %@ line :%d func - %s " fmt),                                                                                 \
//FILE,                                                               \
//__LINE__,                                                           \
//__FUNCTION__,                                                       \
//##__VA_ARGS__)                                                      \

#ifdef DEBUG
#define SHString [NSString stringWithFormat:@"%s", __FILE__].lastPathComponent
#define SHLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define SHLog(...)
#endif

//#ifdef DEBUG
//#define SHLog(fmt, ...) _NSLog((@"flie - %@ line :%d func - %s " fmt),                   \
//FILE,                                                               \
//__LINE__,                                                           \
//__FUNCTION__,                                                       \
//##__VA_ARGS__)
//#else
//#define SHLog(...)
//#endif

#endif /* Log_h */
