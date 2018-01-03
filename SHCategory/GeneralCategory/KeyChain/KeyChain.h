

#import <Foundation/Foundation.h>

@interface KeyChain : NSObject

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service ;

+ (void)save:(NSString *)service data:(id)data;

+ (id)load:(NSString *)service;

+ (void)delete:(NSString *)service;

@end
