

#import <Foundation/Foundation.h>

@interface UUIDManager : NSObject
+(void)saveUUID:(NSString *)uuid;

+(id)readUUID;

+(void)deleteUUID;

@end
