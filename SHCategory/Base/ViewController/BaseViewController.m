//
//  BaseViewController.m
//  B2B
//
//  Created by GOGO on 16/4/12.
//  Copyright © 2016年 GOGO. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()



@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
}


- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];

    NSLog(@" %s safeAreaInsets %@",__func__,NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    
}


@end
