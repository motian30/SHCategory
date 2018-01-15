//
//  WKWebViewWithProgess.m
//  StockOfBroadband
//
//  Created by Motian on 2017/9/8.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import "WKWebViewWithProgess.h"
#import "WebViewProgress.h"
#import "SHCategory.h"

@interface WKWebViewWithProgess ()<WebViewProgressDelegate>

@property (nonatomic, strong) WebViewProgress *progress;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CALayer *backLayer;

@end

@implementation WKWebViewWithProgess

- (instancetype)initWithFrame:(CGRect)frame configuration:(nonnull WKWebViewConfiguration *)configuration{
    if (self = [super initWithFrame:frame configuration:configuration]) {
    
        [self setupConfig];
        [self setupProgressLayer];
        [self setupProgress];
    }
    return self;
}


- (void)startLoad{
    
    if (self.urlStr) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
            [self loadRequest:request];
        });
    }
}

- (void)setupConfig{
    self.backgroundColor = [UIColor whiteColor];
    self.autoresizesSubviews = NO;
    self.contentMode = UIViewContentModeCenter;
    
    self.scrollView.autoresizesSubviews = NO;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator= NO;
    self.scrollView.showsVerticalScrollIndicator= NO;
    
}



- (void)setupProgressLayer{
    CGFloat height = self.progressHeight > 0 ? self.progressHeight : 2.5;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, height/2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, height/2)];
    path.lineWidth = height;
    path.lineCapStyle = kCGLineCapRound;
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.path = path.CGPath;
    self.progressLayer.lineWidth = height;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.strokeStart = 0.0;
    self.progressLayer.strokeEnd = 0.0;
    self.progressLayer.strokeColor = [UIColor yellowColor].CGColor;
    
    [self.scrollView.layer addSublayer:self.progressLayer];
    
    self.backLayer = [CALayer layer];
    [self.backLayer addSublayer:[self gradientLayerWith:self.colors]];
    
    self.backLayer.mask = self.progressLayer;
    [self.scrollView.layer addSublayer:self.backLayer];
    
}

- (void)setupProgress{
    self.progress = [[WebViewProgress alloc] init];
    self.navigationDelegate = self.progress;
    self.progress.delegate = self;
}

- (CAGradientLayer *)gradientLayerWith:(NSMutableArray *)colors{
    if (IsArrEmpty(colors)) {
        colors = [NSMutableArray array];
        [colors addObject:[UIColor colorWithHexString:@"#22A0C9"]];
        [colors addObject:[UIColor colorWithHexString:@"#4FD3FB"]];
    }
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.bounds;
    gradient.colors = @[(__bridge id)[colors[0] CGColor],(__bridge id)[colors[1] CGColor]];
    gradient.locations = @[@(.2),@(.8)];
    gradient.startPoint = CGPointMake(0, .5);
    gradient.endPoint = CGPointMake(1, .5);
    
    return gradient;
}


#pragma mark - WebViewProgressDelegate
- (void)setupProgress:(CGFloat)progress{
    
    self.progressLayer.strokeEnd = progress;
    [self.progressLayer layoutIfNeeded];

    if (progress >= 1.0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                
            } completion:^(BOOL finished) {
                [self.backLayer removeFromSuperlayer];
                [self.progressLayer removeFromSuperlayer];
                
            }];
        });
        
    }

}

#pragma mark - setter/getter
- (void)setColors:(NSMutableArray *)colors{
    _colors = [NSMutableArray arrayWithArray:colors];
}

- (void)setProgressHeight:(CGFloat)progressHeight{
    _progressHeight = progressHeight;
}

- (void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    
}



@end
