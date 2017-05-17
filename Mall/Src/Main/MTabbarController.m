//
//  MTabbarController.m
//  Mall
//
//  Created by luo on 2017/5/11.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MTabbarController.h"
#import "MNavigationController.h"
#import "MHomeViewController.h"
#import "MClassifyViewController.h"
#import "MActivitiesViewController.h"
#import "MCartViewController.h"
#import "MPersonCenterViewController.h"

@interface MTabbarController ()

@end

@implementation MTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArr = @[@"首页",@"分类",@"最新优惠",@"购物车",@"个人中心"];
    NSArray *controllers = @[@"MHomeViewController",@"MClassifyViewController",@"MActivitiesViewController",@"MCartViewController",@"MPersonCenterViewController"];
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:5];
    for (int i=0; i<titleArr.count; i++) {
        id myObj = [[NSClassFromString(controllers[i]) alloc] init];
        UIViewController *vc = (UIViewController*)myObj;
        vc.view.backgroundColor = [UIColor whiteColor];
        vc.title = titleArr[i];
        MNavigationController *nc = [[MNavigationController alloc] initWithRootViewController:vc];
        [temp addObject:nc];
    }
    self.viewControllers = temp;
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
