//
//  NetworkRequest.m
//  SHCategoryExample
//
//  Created by Motian on 2017/11/6.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import "NetworkRequest.h"
#import "Obj-Json.h"
#import "DataConstant.h"

static AFHTTPSessionManager *defaultManager;

static NSTimeInterval defaultTimeoutInterval = 10;

@implementation NetworkRequest

- (instancetype)init{
    self = [super init];
    if (self) {
        if (!defaultManager) {
            defaultManager = [AFHTTPSessionManager manager];
            defaultManager.requestSerializer.timeoutInterval = defaultTimeoutInterval;
            [defaultManager.securityPolicy setAllowInvalidCertificates:YES];
        }
        _timeOutInterval = defaultTimeoutInterval;
    }
    return self;
}

- (void)requestWithType:(ResType)type URLAddress:(NSString *)url Parameters:(id)parameters Success:(NetworkRequestSuccessBlock)success failure:(NetworkRequestFailedBlock)failure progress:(NetworkRequestProgressBlock)progress{
    
    if (!self.self.hiddenEffect){
        [SVProgressHUD dismiss];
        [SVProgressHUD show];
    }
    
    if (self.header){
        for(NSString *key in [self.header allKeys]){
            [defaultManager.requestSerializer setValue:[self.header objectForKey:key]  forHTTPHeaderField:key];
        }
    }
    
    if (self.timeOutInterval != defaultTimeoutInterval && self.timeOutInterval > 0) {
        defaultManager.requestSerializer.timeoutInterval = _timeOutInterval;
    }
    
    if (self.jsonPar) {
        parameters = [Obj_Json ObjToJson:parameters];
    }
    
    
    if (type == GET_Request) {
        [self getDataWith:[self fullURLAddressWith:url] Parameters:parameters Success:success failure:failure progress:progress];
    }else if (type == POST_Request){
        [self postDataWith:[self fullURLAddressWith:url] Parameters:parameters Success:success failure:failure progress:progress];
    }
}


- (void)getDataWith:(NSString *)url Parameters:(id)parameters Success:(NetworkRequestSuccessBlock)success failure:(NetworkRequestFailedBlock)failure progress:(NetworkRequestProgressBlock)progress{
    
    
    [defaultManager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progress) {
            progress(self,downloadProgress.fractionCompleted);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.hiddenEffect) {
            [SVProgressHUD  dismiss];
        }
        
        if (success) {
            if (self.jsonResponse) {
                responseObject = [Obj_Json JsonToDictionary:responseObject];
            }
            success(self, responseObject);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@",error);
        if (self.hiddenEffect) {
            [SVProgressHUD  dismiss];
        }
        if (failure) {
            failure(self, error);
        }
    }];
    
}

- (void)postDataWith:(NSString *)url Parameters:(id)parameters Success:(NetworkRequestSuccessBlock)success failure:(NetworkRequestFailedBlock)failure progress:(NetworkRequestProgressBlock)progress{
   

    [defaultManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
        if (progress) {
            progress(self,uploadProgress.fractionCompleted);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.hiddenEffect) {
            [SVProgressHUD  dismiss];
        }
 
        if (success) {
            if (self.jsonResponse) {
                responseObject = [Obj_Json JsonToDictionary:responseObject];
            }
            success(self, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"Error: %@",error);
        
        if (self.hiddenEffect) {
            [SVProgressHUD  dismiss];
        }
        if (failure){
            failure(self, error);
        }
    }];
    
}

- (NSString *)fullURLAddressWith:(NSString *)urlstr{
    if (self.aloneUrlAddress) {
        return urlstr;
    }else{
        return [NSString stringWithFormat:@"%@%@",Basic_URL,urlstr];
    }
}


@end
