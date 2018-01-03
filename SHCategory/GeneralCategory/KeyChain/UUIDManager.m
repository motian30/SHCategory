

#import "UUIDManager.h"
#import "KeyChain.h"

@implementation UUIDManager

static NSString * const KEY_IN_KEYCHAIN = @"";
static NSString * const KEY_UUID = @"";

+(void)saveUUID:(NSString *)uuid
{
    NSMutableDictionary *usernameUuidPairs = [NSMutableDictionary dictionary];
    [usernameUuidPairs setObject:uuid forKey:KEY_UUID];
    [KeyChain save:KEY_IN_KEYCHAIN data:usernameUuidPairs];
}

+(id)readUUID
{
    NSMutableDictionary *usernameUuidPairs = (NSMutableDictionary *)[KeyChain load:KEY_IN_KEYCHAIN];
    return [usernameUuidPairs objectForKey:KEY_UUID];
}

+(void)deleteUUID
{
    [KeyChain delete:KEY_IN_KEYCHAIN];
}

@end
