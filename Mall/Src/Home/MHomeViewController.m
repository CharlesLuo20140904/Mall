//
//  MHomeViewController.m
//  Mall
//
//  Created by luo on 2017/5/11.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MHomeViewController.h"
#import "SwipeBannerView.h"
#import "WebViewController.h"

@interface MHomeViewController ()

@end

@implementation MHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSArray *imageArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",];
    SwipeBannerView *swipeView = [[SwipeBannerView alloc] init];
    [swipeView swipeViewInitWithFrame:CGRectMake(0.0, 0.0,SCREEN_WIDTH, SCREEN_WIDTH/2)
                            Imageurls:imageArr indicatorTintColor:[UIColor grayColor]
            currentIndicatorTintColor:[UIColor redColor]
                             duration:3];
    swipeView.clickImgAction = ^(NSInteger curIndex) {
        if (curIndex == 0) {
            NSLog(@"succeed");
        }
    };
    [self.view addSubview:swipeView];
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
