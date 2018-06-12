//
//  ColoredCircleProgressView.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/8/11.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "ColoredCircleProgressView.h"

@interface ColoredCircleProgressView ()

@property(nonatomic, strong) CAShapeLayer *bgLayer;
@property(nonatomic, strong) CAShapeLayer *foreLayer;
@property(nonatomic, strong) UIBezierPath *bezierPath;
//渐变色
@property(nonatomic, strong) CAGradientLayer *gradientLayer;

@property(nonatomic, strong) UILabel *numLab;

@end

@implementation ColoredCircleProgressView

- (UILabel *)numLab
{
    if (!_numLab) {
        _numLab = [[UILabel alloc] initWithFrame:self.bounds];
        _numLab.center = self.center;
        _numLab.textAlignment = NSTextAlignmentCenter;
    }
    return _numLab;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLayer];
        [self addSubview:self.numLab];
    }
    return self;
}

- (void)createLayer
{
    _bgLayer = [[CAShapeLayer alloc] init];
    _bgLayer.frame = self.bounds;
    _bgLayer.fillColor = [UIColor clearColor].CGColor;
    _bgLayer.lineWidth = 4.0f;
    _bgLayer.strokeColor = [UIColor lightGrayColor].CGColor;
//    _bgLayer.strokeStart = 0.0f;
//    _bgLayer.strokeEnd = 1.0f;
    [self.layer addSublayer:_bgLayer];
    
    
    _foreLayer = [[CAShapeLayer alloc] init];
    _foreLayer.frame = self.bounds;
    _foreLayer.fillColor = [UIColor clearColor].CGColor;
    _foreLayer.lineWidth = 4.0f;
    _foreLayer.strokeColor = [UIColor redColor].CGColor;
//    _foreLayer.strokeStart = 0.f;
//    _foreLayer.strokeEnd = 0.f;
    [self.layer addSublayer:_foreLayer];
    
    _bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:self.frame.size.width/2 startAngle:-M_PI_2 endAngle:M_PI*1.5 clockwise:YES];
    self.bgLayer.path = _bezierPath.CGPath;
    self.foreLayer.path = _bezierPath.CGPath;
    self.foreLayer.strokeEnd = 0;
    
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.frame = self.bounds;
    self.gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
    _gradientLayer.locations = @[@0,@0.5,@1];
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(0, 1);
    [self.layer addSublayer:self.gradientLayer];
    
    //设置mask
    [self.gradientLayer setMask:self.foreLayer];
    
}

- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    _foreLayer.strokeEnd = progressValue;
    _numLab.text = [NSString stringWithFormat:@"%.2f%%",progressValue*100];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
