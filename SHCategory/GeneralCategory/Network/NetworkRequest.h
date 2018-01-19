//
//  NetworkRequest.h
//  SHCategoryExample
//
//  Created by Motian on 2017/11/6.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

static const NSString *Basic_URL= @"";


@class NetworkRequest;

typedef NS_ENUM(NSUInteger, RequestType) {
    GET_Request,
    POST_Request,
};

typedef void (^NetworkRequestSuccessBlock)(NetworkRequest * NR,id response);
typedef void (^NetworkRequestFailedBlock)(NetworkRequest * NR,NSError * error);
typedef void (^NetworkRequestProgressBlock)(NetworkRequest * NR,CGFloat progress);

@interface NetworkRequest : NSObject

/**
 Network Request
 */
- (void)requestWithType:(ResType)type
             URLAddress:(NSString *)url
             Parameters:(id)parameters
                Success:(NetworkRequestSuccessBlock)success
                failure:(NetworkRequestFailedBlock)failure
               progress:(NetworkRequestProgressBlock)progress;


//Optional
@property (nonatomic, assign) NSTimeInterval timeOutInterval;

//Optional - Request header
@property (nonatomic, strong) NSDictionary * header;

//Optional - Not show mask
@property (nonatomic, assign) BOOL hiddenEffect;

//Optional - URL address is alone
@property (nonatomic, assign) BOOL aloneUrlAddress;

//Optional - Parameters is json
@property (nonatomic, assign) BOOL jsonPar;

//Optional - Response is json
@property (nonatomic, assign) BOOL jsonResponse;


@end
