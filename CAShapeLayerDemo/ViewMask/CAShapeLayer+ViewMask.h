//
//  CAShapeLayer+ViewMask.h
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/7/15.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>



@interface CAShapeLayer (ViewMask)

+ (instancetype)createMaskLayerWithView:(UIView *)view;

@end
