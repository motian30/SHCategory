//
//  WebViewProgress.m
//  StockOfBroadband
//
//  Created by Motian on 2017/9/8.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import "WebViewProgress.h"

@interface WebViewProgress ()

@property (nonatomic, assign) CGFloat initialProgressValue;
@property (nonatomic, assign) CGFloat interactiveProgressValue;
@property (nonatomic, assign) CGFloat finalProgressValue;

@property (nonatomic, assign) NSInteger loadingCount;
@property (nonatomic, assign) NSInteger maxLoadCount;
@property (nonatomic, strong) NSURL *currentURL;

@end

@implementation WebViewProgress

- (instancetype)init {

    if (self = [super init]) {
        self.maxLoadCount = self.loadingCount = 1.0;
        self.initialProgressValue = .1;
        self.interactiveProgressValue = 0.5;
        self.finalProgressValue = .9;
    }
    return self;
}


- (void)startProgress {
    if (self.progress < self.initialProgressValue) {
        [self setProgress:self.progress];
    }
}


- (void)incrementProgress {
    CGFloat progress = self.progress;
    CGFloat maxProgress =  self.finalProgressValue;
    CGFloat currentPercent = (double)self.loadingCount / (double)self.maxLoadCount;
    CGFloat increase = (maxProgress - progress) * currentPercent;
    progress += increase;
    progress = fmin(progress, maxProgress);
    [self setProgress:progress];
}


- (void)completeProgress {
    [self setProgress:1.0];
}


- (void)reset {
    self.maxLoadCount = 1.0;
    self.loadingCount = 0;
    self.progress = 0;
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    if ([self.WKWebViewDelegate respondsToSelector:@selector(webView:didStartProvisionalNavigation:)]) {
        [self.WKWebViewDelegate webView:webView didStartProvisionalNavigation:navigation];
    }
    _loadingCount += 1;
    _maxLoadCount = fmax(_maxLoadCount, _loadingCount);
    [self startProgress];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    if ([self.WKWebViewDelegate respondsToSelector:@selector(webView:didCommitNavigation:)]) {
        [self.WKWebViewDelegate webView:webView didCommitNavigation:navigation];
    }
    
    _loadingCount -= 1;
    _maxLoadCount = fmax(_maxLoadCount, _loadingCount);
    [self incrementProgress];
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    if ([self.WKWebViewDelegate respondsToSelector:@selector(webView:didFinishNavigation:)]) {
        [self.WKWebViewDelegate webView:webView didFinishNavigation:navigation];
    }
    
    [self completeProgress];

}

- (void)webView:(WKWebView *)webView didFailNavigation: (null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
    if ([self.WKWebViewDelegate respondsToSelector:@selector(webView:didFailNavigation:withError:)]) {
        [self.WKWebViewDelegate webView:webView didFailNavigation:navigation withError:error];
    }
    
    [self completeProgress];
    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}



- (void)setProgress:(CGFloat)progress {
    if (progress > _progress || progress == 0) {
        _progress = progress;
        if ([self.delegate respondsToSelector:@selector(setupProgress:)]) {
            [self.delegate setupProgress:progress];
        }
    }
}

@end
