//
//  AlertView.h
//  SHCategoryExample
//
//  Created by Motian on 2017/12/6.
//  Copyright © 2017年 Motian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , ShowAnimationStyle) {
    AnimationDefault    = 0,
    AnimationLeftShake     ,
    AnimationTopShake      ,
    AnimationNO            ,
};

typedef NS_ENUM(NSInteger , TextAlignment) {
    TextAlignmentCenter = 0,
    TextAlignmentLeft      ,
    TextAlignmentRight
};

@interface AlertView : UIView

typedef void(^AlertClickIndexBlock)(NSInteger clickIndex);


@property (nonatomic,copy)AlertClickIndexBlock clickBlock;
/**
 instancetype
 
 @param title 标题
 @param message 内容
 @param cancelTitle 取消按钮
 @param otherBtnTitle 其他按钮
 @param block 按钮回调
 @return self
 */
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelBtnTitle:(NSString *)cancelTitle otherBtnTitle:(NSString *)otherBtnTitle clickIndexBlock:(AlertClickIndexBlock)block;


/**
 展示弹框
 */
- (void)showLXAlertView;


/**
 动画类型
 */
@property (nonatomic,assign)ShowAnimationStyle animationStyle;


/**
 内容文字对齐方式
 */
@property (nonatomic,assign)TextAlignment textAlignment;


/**
 颜色可选项
 */
@property (nonatomic,assign)UIColor *titleColor;
@property (nonatomic,assign)UIColor *messageColor;
@property (nonatomic,assign)UIColor *cancelBtColor;
@property (nonatomic,assign)UIColor *otherBtColor;

/**
 字体大小
 */
@property (nonatomic, assign) CGFloat titleFont;
@property (nonatomic, assign) CGFloat messageFont;
@property (nonatomic, assign) CGFloat buttonFont;


/**
 不消失
 */
@property (nonatomic,assign)BOOL dontDissmiss;




@end
