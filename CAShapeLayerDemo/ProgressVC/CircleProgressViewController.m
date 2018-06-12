//
//  CircleProgressViewController.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/8/11.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "CircleProgressViewController.h"
#import "CircleView.h"

@interface CircleProgressViewController ()

@property(nonatomic, strong) CircleView *cirView;
@property(nonatomic, strong) UISlider *slider;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) int count;

@end

@implementation CircleProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createCircleProgress];
}

#pragma mark - createCircleProgress
- (void)createCircleProgress
{
    _count = 0;
    _cirView = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _cirView.center = self.view.center;
    [self.view addSubview:_cirView];
    
    //    _slider = [[UISlider alloc] initWithFrame:CGRectMake(50, kScreenHeight-60, kScreenWidth-100, 30)];
    //    [_slider setMaximumValue:1.0];
    //    [_slider setMinimumValue:0.0];
    //    [self.view addSubview:_slider];
    //    [_slider addTarget:self action:@selector(changeProValue:) forControlEvents:UIControlEventValueChanged];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(animate) userInfo:nil repeats:YES];
    
}
- (void)animate
{
    _count++;
    if (_count != 11) {
        _cirView.progressValue += 0.1;
        NSLog(@"value: %f",_cirView.progressValue);
    }else{
        [_timer invalidate];
        _timer = nil;
//        [_cirView removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
