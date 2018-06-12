//
//  ViewController.m
//  CAShapeLayerDemo
//
//  Created by ccd on 2017/7/15.
//  Copyright © 2017年 CCD. All rights reserved.
//

#import "ViewController.h"
#import "MaskViewController.h"
#import "CircleProgressViewController.h"
#import "ARCViewController.h"
#import "ColoredCircleViewController.h"

#import "CAShapeLayer+ViewMask.h"
#import "CircleView.h"
#import "ArcProgress.h"

#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) CircleView *cirView;
@property(nonatomic, strong) UISlider *slider;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) int count;
@property(nonatomic, strong) ArcProgress *arcProgress;
@property(nonatomic, strong) UITableView *tabView;
@property(nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的进度条";
    [self getData];
    [self createTabView];
    
}
- (void)getData
{
    _dataArr = [[NSArray alloc] init];
    _dataArr = @[@"ViewMask",@"CircleView",@"ArcProgress",@"ColoredCircleView"];
}

- (void)createTabView
{
    _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    _tabView.dataSource = self;
    _tabView.delegate = self;
    [self.view addSubview:_tabView];
    
    _tabView.tableFooterView = [UIView new];
}


#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reuseId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController * VC ;
    switch (indexPath.row) {
        case 0:
            VC = [[MaskViewController alloc] init];
            break;
        case 1:
            VC = [[CircleProgressViewController alloc] init];
            break;
        case 2:
            VC = [[ARCViewController alloc] init];
            break;
        case 3:
            VC = [[ColoredCircleViewController alloc] init];
            break;
    }
    [self.navigationController pushViewController:VC animated:YES];
    VC = nil;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
