

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (CGFloat)agt_height
{
    return self.frame.size.height;
}
- (void)setAgt_height:(CGFloat)agt_height
{
    CGRect frame = self.frame;
    frame.size.height = agt_height;
    self.frame = frame;
}

- (CGFloat)agt_width
{
    return self.frame.size.width;
}
- (void)setAgt_width:(CGFloat)agt_width
{
    CGRect frame = self.frame;
    frame.size.width = agt_width;
    self.frame = frame;
}

- (CGFloat)agt_x
{
    return self.frame.origin.x;
}

- (void)setAgt_x:(CGFloat)agt_x
{
    CGRect frame = self.frame;
    frame.origin.x = agt_x;
    self.frame = frame;
}

- (CGFloat)agt_y
{
    return self.frame.origin.y;
}

- (void)setAgt_y:(CGFloat)agt_y
{
    CGRect frame = self.frame;
    frame.origin.y = agt_y;
    self.frame = frame;
}
- (void)setAgt_centerY:(CGFloat)agt_centerY
{
    CGPoint center = self.center;
    center.y = agt_centerY;
    self.center = center;
}

- (CGFloat)agt_centerY
{
    return self.center.y;
}

- (void)setAgt_centetX:(CGFloat)agt_centetX
{
    CGPoint center = self.center;
    center.x = agt_centetX;
    self.center = center;
}

- (CGFloat)agt_centetX
{
    return self.center.x;
}

@end
