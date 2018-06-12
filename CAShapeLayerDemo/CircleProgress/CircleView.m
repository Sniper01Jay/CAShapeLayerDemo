//
//  CircleView.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/7/17.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()

@property(nonatomic, strong) CAShapeLayer *bgLayer;
@property(nonatomic, strong) CAShapeLayer *foreLayer;
@property(nonatomic, strong) UIBezierPath *bezierPath;

@property(nonatomic, strong) UILabel *numLab;

//仿appstore的下载进度条
//@property(nonatomic, strong) UIBezierPath *foreBezierPath;

@end

@implementation CircleView

- (UILabel *)numLab
{
    if (!_numLab) {
        _numLab = [[UILabel alloc] initWithFrame:self.bounds];
        _numLab.center = self.center;
//        _numLab.textColor = [UIColor blackColor];
//        _numLab.font = [UIFont systemFontOfSize:14.0];
        _numLab.textAlignment = NSTextAlignmentCenter;
    
        
        /* 仿appstore的下载进度条
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2-20, self.frame.size.height/2-20, 40, 40)];
        _numLab.backgroundColor = [UIColor blueColor];
        */
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
    
    _bgLayer = [CAShapeLayer layer];
    _bgLayer.frame = self.bounds;
    _bgLayer.fillColor = [UIColor clearColor].CGColor;
    _bgLayer.lineWidth = 4.0f;
    _bgLayer.strokeColor = [UIColor grayColor].CGColor;
    _bgLayer.strokeStart = 0.f;
    _bgLayer.strokeEnd = 1.0f;
    [self.layer addSublayer:_bgLayer];
    
    _foreLayer = [CAShapeLayer layer];
    _foreLayer.frame = self.bounds;
    _foreLayer.fillColor = [UIColor clearColor].CGColor;
    _foreLayer.lineWidth = 4.0f;
    _foreLayer.lineCap = kCALineCapRound;
    _foreLayer.strokeColor = [UIColor redColor].CGColor;
    _foreLayer.strokeStart = 0.f;
    _foreLayer.strokeEnd = 0.f;
    [self.layer addSublayer:_foreLayer];
    
    
    _bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2 startAngle:-M_PI_2 endAngle:M_PI*1.5 clockwise:YES];
    _foreLayer.path = _bezierPath.CGPath;
    _bgLayer.path = _bezierPath.CGPath;
    
    /*  仿appstore的下载进度条
    _foreBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2-4 startAngle:-M_PI_2 endAngle:M_PI*1.5 clockwise:YES];
    _foreLayer.path = _foreBezierPath.CGPath;
    */
}

- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    self.foreLayer.strokeEnd = progressValue;
    self.numLab.text = [NSString stringWithFormat:@"%.2f%%",progressValue*100];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
