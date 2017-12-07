
#import "NSString+Path.h"

@implementation NSString (Path)

- (NSString *)appendDocumentDir {
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendCacheDir {
    NSString *dir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendTempDir {
    NSString *dir = NSTemporaryDirectory();
    
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}

@end
