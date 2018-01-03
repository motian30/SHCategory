//
//  HideInputAccessory.m
//  StockOfBroadband
//
//  Created by Motian on 2017/9/22.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import "HideInputAccessory.h"
#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <objc/runtime.h>

@implementation HideInputAccessory

- (id)inputAccessoryView {
    
    return nil;
    
}

+ (void)removeInputAccessoryViewFromWKWebView:(WKWebView *)webView {
    
    UIView *targetView;
    
    for (UIView *view in webView.scrollView.subviews) {
        
        if([[view.class description] hasPrefix:@"WKContent"]) {
            
            targetView = view;
            
        }
        
    }
    
    if (!targetView) {
        
        return;
        
    }
    
    NSString *hideInputAccessoryViewClassName = [NSString stringWithFormat:@"%@_HideInputAccessoryView", targetView.class.superclass];
    
    Class newClass = NSClassFromString(hideInputAccessoryViewClassName);
    
    if(newClass == nil) {
        
        newClass = objc_allocateClassPair(targetView.class, [hideInputAccessoryViewClassName cStringUsingEncoding:NSASCIIStringEncoding], 0);
        
        if(!newClass) {
            
            return;
            
        }
        
        Method method = class_getInstanceMethod([HideInputAccessory class], @selector(inputAccessoryView));
        
        class_addMethod(newClass, @selector(inputAccessoryView), method_getImplementation(method), method_getTypeEncoding(method));
        
        objc_registerClassPair(newClass);
        
    }
    
    object_setClass(targetView, newClass);
    
}

@end
