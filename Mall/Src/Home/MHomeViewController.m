//
//  MHomeViewController.m
//  Mall
//
//  Created by luo on 2017/5/11.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MHomeViewController.h"
#import "SwipeBannerView.h"

@interface MHomeViewController ()

@end

@implementation MHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    SwipeBannerView *swipeView = [[SwipeBannerView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_RECT.size.width, [UIScreen mainScreen].bounds.size.width/2)];
//    [self.view addSubview:swipeView];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.parentViewController.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.navigationController.navigationBar.translucent = NO;
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 64.0,SCREEN_RECT.size.width, SCREEN_RECT.size.width/2.0)];
    demoView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:demoView];
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
