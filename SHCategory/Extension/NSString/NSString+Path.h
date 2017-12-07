

#import <Foundation/Foundation.h>

@interface NSString (Path)

/// 给当前文件追加文档路径
- (NSString *)appendDocumentDir;

/// 给当前文件追加缓存路径
- (NSString *)appendCacheDir;

/// 给当前文件追加临时路径
- (NSString *)appendTempDir;

@end
