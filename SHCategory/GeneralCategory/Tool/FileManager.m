
#import "FileManager.h"

@implementation FileManager

/// 把对象归档存到沙盒里
+(void)saveObject:(id)object byFileName:(NSString*)fileName
{
    NSString *path  = [self appendFilePath:fileName];
    
    [NSKeyedArchiver archiveRootObject:object toFile:path];
    
}
/// 通过文件名从沙盒中找到归档的对象
+(id)getObjectByFileName:(NSString*)fileName
{
    
    NSString *path  = [self appendFilePath:fileName];

    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

/// 根据文件名删除沙盒中的 plist 文件
+(void)removeFileByFileName:(NSString*)fileName
{
    NSString *path  = [self appendFilePath:fileName];

    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

/// 拼接文件路径
+(NSString*)appendFilePath:(NSString*)fileName
{
   
    NSString *documentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
     NSString *file = [NSString stringWithFormat:@"%@/%@.archiver",documentsPath,fileName];

    return file;
}

/// 存储用户偏好设置 到 NSUserDefults
+(void)saveUserData:(id)data forKey:(NSString*)key
{
    if (data)
    {
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}
/// 读取用户偏好设置
+(id)readUserDataForKey:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults]objectForKey:key];

}
/// 删除用户偏好设置
+(void)removeUserDataForkey:(NSString*)key
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
}

///创建文件夹
+ (BOOL)createDir:(NSString *)dirPath {
	if ([[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {
		return NO;
	} else {
		[[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
		return YES;
	}
}

///删除文件夹
+(BOOL)deleteDir:(NSString *)dirPath{
	if ([[NSFileManager defaultManager] fileExistsAtPath:dirPath]) {
		NSError *error = nil;
		return [[NSFileManager defaultManager] removeItemAtPath:dirPath error:&error];
	}
	return NO;
}

+ (BOOL)moveDir:(NSString *)srcDirPath to:(NSString *)desDirPath {
	NSError *error = nil;
	if ([[NSFileManager defaultManager] moveItemAtPath:srcDirPath toPath:desDirPath error:&error]) {
		SHLog(@"移动文件夹失败");
		return NO;
	} else {
		SHLog(@"移动文件夹成功");
		return YES;
	}
}



///创建文件
+ (BOOL)createFile:(NSString *)filePath withData:(NSData *)data {
	return [[NSFileManager defaultManager] createFileAtPath:filePath contents:data attributes:nil];
}

/// 判断文件是否存在
+(BOOL)isExistWithFile:(NSString *)filePath {
	return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

///  计算文件大小
+ (unsigned long long)fileSizeAtPath:(NSString *)filePath {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	if ([self isExistWithFile:filePath]) {
		unsigned long long fileSize = [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
		return fileSize;
	} else {
		SHLog(@"file is not exist");
		return 0;
	}
}

/// 计算文件夹中所有文件大小
+ (unsigned long long)folderSizeAtPath:(NSString*)folderPath {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	if ([self isExistWithFile:folderPath]) {
		NSEnumerator *childFileEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
		unsigned long long folderSize = 0;
		NSString *fileName = @"";
		while ((fileName = [childFileEnumerator nextObject]) != nil){
			NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
			folderSize += [self fileSizeAtPath:fileAbsolutePath];
		}
		return folderSize / (1000.0 * 1000.0);
	} else {
		SHLog(@"file is not exist");
		return 0;
	}
}


@end
