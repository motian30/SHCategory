//
//  WKWebViewWithProgess.h
//  StockOfBroadband
//
//  Created by Motian on 2017/9/8.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebViewWithProgess : WKWebView

@property (nonatomic, strong) NSMutableArray *colors;

@property (nonatomic, assign) CGFloat progressHeight;

@property (nonatomic, copy) NSString *urlStr;


- (void)startLoad;

@end
