//
//  ARCViewController.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/8/11.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "ARCViewController.h"
#import "ArcProgress.h"


#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
@interface ARCViewController ()

@property(nonatomic, strong) ArcProgress *arcProgress;
@property(nonatomic, strong) UISlider *slider;

@end

@implementation ARCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createArcProgress];
}

- (void)createArcProgress
{
    _arcProgress = [[ArcProgress alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-100, 200, 200, 300)];
    [self.view addSubview:_arcProgress];
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(50, kScreenHeight-60, kScreenWidth-100, 30)];
    [_slider setMaximumValue:1.0];
    [_slider setMinimumValue:0.0];
    [self.view addSubview:_slider];
    [_slider addTarget:self action:@selector(changeProValue:) forControlEvents:UIControlEventValueChanged];
}
- (void)changeProValue:(UISlider *)slider
{
    //    _cirView.progressValue = slider.value;
    _arcProgress.progressValue = slider.value;
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
