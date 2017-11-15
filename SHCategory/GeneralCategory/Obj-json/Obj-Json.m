//
//  Obj-Json.m
//  ShanghaoQA
//
//  Created by Motian on 2017/4/5.
//  Copyright © 2017年 ClavisJ. All rights reserved.
//

#import "Obj-Json.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation Obj_Json

+ (BOOL)isEmptyStr:(NSString *)str{
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0||
        str == nil ||
        str == NULL ||
        [str isKindOfClass:[NSNull class]] ||
        [str isEqualToString:@""]||
        [str isEqualToString:@"(null)"] ||
        [str isEqualToString:@"<null>"] ||
        [str isEqualToString:@"null"] ||
        [str isEqualToString:@"NULL"]
        ) {
        return YES;
    }else {
        return NO;
    }
}

+ (__kindof NSDictionary *)JsonToDictionary:(NSString *)json{
    if ([self isEmptyStr:json]) {
        NSLog(@"json is empty");
        return nil;
    }
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];

    return dictionary;
}

+ (__kindof NSArray *)JsonToArray:(NSString *)json{
    
    if ([self isEmptyStr:json]) {
        NSLog(@"json is empty");
        return nil;
    }

    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];

    return array;

}

+ (__kindof NSString *)ObjToJson:(id)obj{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:nil];
    NSString * jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonStr;
}

+ (__kindof NSDictionary*)getObjectData:(id)obj{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    
    for(int i = 0;i < propsCount; i++) {
        
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        
        if (!(value == nil || [value isKindOfClass:[NSNull class]])){
            value = [self getObjectInternal:value];
            [dic setObject:value forKey:propName];
        }
    }
    
    return dic;
}

+ (id)getObjectInternal:(id)obj {
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    
    if([obj isKindOfClass:[NSNumber class]]
       ){
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]]) {
        
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        
        for(int i = 0; i < objarr.count; i++) {
            
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        
        for(NSString *key in objdic.allKeys) {
            
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
    
}



+ (instancetype )dictToObject:(__kindof NSDictionary *)dict{
    id obj = [self new];
   
    for (NSString *property in [self propertList]) {
       
        if (dict[property]) {
            
            [obj setValue:dict[property] forKey:property];
        }
    }
    return obj;
}


+ (NSArray *)propertList{
    unsigned int count = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i< count; i++) {
        
        objc_property_t property = propertyList[i];
        
        const char *cName = property_getName(property);
        NSString *name = [[NSString alloc]initWithUTF8String:cName];
        
        [arr addObject:name];
    }
    
    free(propertyList);
    return arr.copy;
}


@end
