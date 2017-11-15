//
//  Obj-Json.h
//  ShanghaoQA
//
//  Created by Motian on 2017/4/5.
//  Copyright © 2017年 ClavisJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Obj_Json : NSObject


/**
 json - NSDictionary

 */
+ (__kindof NSDictionary *)JsonToDictionary:(NSString *)json;

/**
 json - NSArray
 
 */
+ (__kindof NSArray *)JsonToArray:(NSString *)json;

/**
 object - json
 
 */
+ (__kindof NSString *)ObjToJson:(id)obj;

/**
 NSObject - NSDictionary
 
 */
+ (__kindof NSDictionary*)getObjectData:(id)obj;


/**
 NSDictionary - NSObject
 
 */
+ (instancetype )dictToObject:(__kindof NSDictionary *)dict;

@end
