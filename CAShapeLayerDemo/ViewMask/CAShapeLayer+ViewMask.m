//
//  CAShapeLayer+ViewMask.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/7/15.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "CAShapeLayer+ViewMask.h"


@implementation CAShapeLayer (ViewMask)

+ (instancetype)createMaskLayerWithView:(UIView *)view
{
    CGFloat viewHeight = CGRectGetWidth(view.frame);
    CGFloat viewWidth = CGRectGetHeight(view.frame);
    
    CGFloat rightSpace = 10;
    CGFloat topSpace = 15;
    
    CGPoint point1 = CGPointMake(0, 0);
    CGPoint point2 = CGPointMake(viewWidth-rightSpace, 0);
    CGPoint point3 = CGPointMake(viewWidth-rightSpace, topSpace);
    CGPoint point4 = CGPointMake(viewWidth, topSpace);
    CGPoint point5 = CGPointMake(viewWidth-rightSpace, topSpace + rightSpace);
    CGPoint point6 = CGPointMake(viewWidth-rightSpace, viewHeight);
    CGPoint point7 = CGPointMake(0, viewHeight);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path closePath];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    
    return layer;
}

@end
