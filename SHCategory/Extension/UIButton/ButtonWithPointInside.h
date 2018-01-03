//
//  ButtonWithPointInside.h
//  B2B
//
//  Created by Motian on 2017/4/13.
//  Copyright © 2017年 GOGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonWithPointInside : UIButton

typedef NS_ENUM(NSInteger, PointInsideDirection) {
    PointInsideLeft ,
    PointInsideRight ,
    
};

@property(nonatomic,assign)IBInspectable CGFloat radius;
@property(nonatomic,assign) PointInsideDirection pointInsideDirection;

@end
