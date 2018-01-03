//
//  TextViewWithPlaceholder.h
//  SHCategoryExample
//
//  Created by Motian on 2018/1/3.
//  Copyright © 2018年 Motian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewWithPlaceholder : UITextView

@property (nonatomic,weak) UILabel *placeholderLabel;
@property(nonatomic,copy) NSString *placeholder;
@property(nonatomic,strong) UIColor *placeholderColor;

@end
