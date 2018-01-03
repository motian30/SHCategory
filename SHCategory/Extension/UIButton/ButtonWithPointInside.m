

#import "ButtonWithPointInside.h"

@implementation ButtonWithPointInside



- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = self.bounds;
    CGFloat widthDelta = MAX(60.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(60.0 - bounds.size.height, 0);
    
    switch (self.pointInsideDirection) {
        case PointInsideLeft:
            point = CGPointMake(point.x + 0.5 * widthDelta, point.y);
            break;
        case PointInsideRight:
            point = CGPointMake(point.x - 0.5 * widthDelta, point.y);
            break;
        default:
            break;
    }
    
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}


@end
