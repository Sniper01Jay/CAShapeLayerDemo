//
//  MaskViewController.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/8/11.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "MaskViewController.h"
#import "CAShapeLayer+ViewMask.h"

@interface MaskViewController ()

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createViewMask];
}

#pragma mark - createViewMask
- (void)createViewMask
{
    //    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(40, 50, 300, 100)];
    //    view.backgroundColor = [UIColor orangeColor];
    //    [self.view addSubview:view];
    
    UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(40, 100, 100, 100)];
    [view setImage:[UIImage imageNamed:@"sunrise.jpg"]];
    [self.view addSubview:view];
    
    CAShapeLayer * layer = [CAShapeLayer createMaskLayerWithView:view];
    view.layer.mask = layer;
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
