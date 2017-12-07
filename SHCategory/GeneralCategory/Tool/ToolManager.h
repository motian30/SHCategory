
#import <Foundation/Foundation.h>

@interface ToolManager : NSObject

@end

@interface ToolManager (CheckText)



/**
 验证数字

 @param number NSString
 @return BOOL
 */
+ (BOOL)validateNumber:(NSString*)number;


/**
 验证邮箱

 @param email NSString
 @return BOOL
 */
+ (BOOL)validateEmail:(NSString *)email;


/**
 验证手机

 @param mobile NSString
 @return BOOL
 */
+ (BOOL)validateMobile:(NSString *)mobile;



/**
 验证车牌

 @param carNo NSString
 @return BOOL
 */
+ (BOOL)validateCarNo:(NSString *)carNo;


/**
 验证车架号
 
 @param CheJiaNumber NSString
 @return BOOL
 */
+ (BOOL) checkCheJiaNumber:(NSString *) CheJiaNumber;


/**
 验证用户名

 @param name NSString
 @return BOOL
 */
+ (BOOL)validateUserName:(NSString *)name;


/**
 验证车架号
 
 @param name NSString
 @return BOOL
 */
+ (BOOL) checkCheJiaNumber:(NSString *) CheJiaNumber;


/**
 验证密码

 @param passWord NSString
 @return BOOL
 */
+ (BOOL) validatePassword:(NSString *)passWord;


/**
 验证昵称

 @param nickname NSString
 @return BOOL
 */
+ (BOOL) validateNickname:(NSString *)nickname;


/**
 验证身份证

 @param identityCard NSString
 @return BOOL
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;


/**
 验证银行卡号

 @param bankNumber NSString
 @return BOOL
 */
+ (BOOL) validateBankNumber:(NSString *) bankNumber;

@end
