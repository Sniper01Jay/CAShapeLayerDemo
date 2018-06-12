//
//  ArcProgress.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/7/17.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "ArcProgress.h"

@interface ArcProgress ()

@property(nonatomic, strong) UILabel *prgLab;
@property(nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ArcProgress

- (UILabel *)prgLab
{
    if (!_prgLab) {
        _prgLab = [[UILabel alloc] initWithFrame:self.bounds];
        _prgLab.textAlignment = NSTextAlignmentCenter;
    }
    return _prgLab;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.prgLab.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:self.prgLab];
}

- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    
    //修改文字
    _prgLab.text = [NSString stringWithFormat:@"%.2f%%",progressValue *100];
    
    [self.shapeLayer removeFromSuperlayer];
    
    //圆心
    CGPoint point = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    //起点
    CGFloat startAngle = -M_PI/2;
    //结束位置
    CGFloat endAngle = self.progressValue * M_PI *2 + startAngle;
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:point radius:self.frame.size.width/2 startAngle:startAngle endAngle:endAngle clockwise:YES];
    //画一根到圆心的线
    [path addLineToPoint:point];
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:layer];
    
    self.shapeLayer = layer;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
