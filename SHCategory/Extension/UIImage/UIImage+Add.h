//
//  UIImage+Add.h
//  SHCategoryExample
//
//  Created by Motian on 2018/1/3.
//  Copyright © 2018年 Motian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Add)


/** 根据颜色生成图片 */
+ (UIImage *)creatImageWithColor:(UIColor *)color;

/** 设置图片的透明度 */
- (UIImage *)alpha:(CGFloat)alpha;

/** 返回该图片是否alpha通道 */
- (BOOL)hasAlphaChannel;

/** 获得灰度图 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;


/** 切圆角，使用绘图技术 */
- (UIImage *)circleImage;

/** 缩放 */
+ (UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;

/** 指定宽度缩放 */
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;


/** UIImage 转换成 base64字符串 */
- (NSString *)base64String;

/** base64 字符串转 UIImage图片 */
+ (UIImage *)imageWithBase64String:(NSString *)base64String;

@end
