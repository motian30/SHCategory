

#import <Foundation/Foundation.h>

@interface NSString (Base64)


/**
 对当前字符串进行 BASE 64 编码，并且返回结果

 @return NSString
 */
- (NSString *)base64Encode;


/**
 对当前字符串进行 BASE 64 解码，并且返回结果

 @return NSString
 */
- (NSString *)base64Decode;

@end
