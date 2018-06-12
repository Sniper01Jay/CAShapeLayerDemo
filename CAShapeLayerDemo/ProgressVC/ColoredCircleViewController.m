//
//  ColoredCircleViewController.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/8/11.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "ColoredCircleViewController.h"
#import "ColoredCircleProgressView.h"

@interface ColoredCircleViewController ()

@property(nonatomic, strong) ColoredCircleProgressView *coloredView;

@end

@implementation ColoredCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createView];
}
- (void)createView
{
    _coloredView = [[ColoredCircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _coloredView.center = self.view.center;
    [self.view addSubview:_coloredView];
    _coloredView.progressValue = 1;
    
    
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
