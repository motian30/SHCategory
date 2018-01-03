//
//  WebViewProgress.h
//  StockOfBroadband
//
//  Created by Motian on 2017/9/8.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@protocol WebViewProgressDelegate <NSObject>

- (void)setupProgress:(CGFloat )progress;

@end

@interface WebViewProgress : NSObject<WKNavigationDelegate>

@property (nonatomic, weak) id <WKNavigationDelegate> WKWebViewDelegate;
@property (nonatomic, weak) id <WebViewProgressDelegate> delegate;

@property (nonatomic, assign) CGFloat progress;

@end
