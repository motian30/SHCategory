
#import <Foundation/Foundation.h>


@interface FileManager : NSObject

 ///把对象归档存到沙盒里

+(void)saveObject:(id)object byFileName:(NSString*)fileName;

 /// 通过文件名从沙盒中找到归档的对象

+(id)getObjectByFileName:(NSString*)fileName;


 /// 根据文件名删除沙盒中的 plist 文件

+(void)removeFileByFileName:(NSString*)fileName;

 
 ///存储用户偏好设置 到 NSUserDefults

+(void)saveUserData:(id)data forKey:(NSString*)key;

 
 ///读取用户偏好设置

+(id)readUserDataForKey:(NSString*)key;

 ///删除用户偏好设置
+(void)removeUserDataForkey:(NSString*)key;

///创建文件夹
+ (BOOL)createDir:(NSString *)dirPath;

///删除文件夹
+(BOOL)deleteDir:(NSString *)dirPath;

/// 移动文件夹
+ (BOOL)moveDir:(NSString *)srcDirPath to:(NSString *)desDirPath;

///创建文件
+ (BOOL)createFile:(NSString *)filePath withData:(NSData *)data;

/// 是否存在文件
+(BOOL)isExistWithFile:(NSString *)filePath;

///  计算文件大小 
+ (unsigned long long)fileSizeAtPath:(NSString *)filePath;

@end

