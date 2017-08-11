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
#import "ClassifyIconView.h"
#import "CLNetworkingManager.h"
#import <JSONModel/JSONModel.h>
#import "HomeModel.h"

@interface MHomeViewController ()
@end

@implementation MHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSArray *imageArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",];
    [CLNetworkingManager getNetworkRequestWithUrlString:HOME_TAB_SCENE_URL parameters:nil isCache:YES succeed:^(id data) {
//        NSLog(@"%@",data);
        NSData *d = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
//        Section_Content *hm = [[Section_Content alloc] initWithString:str error:nil];
//        NSLog(@"%@",hm);
    } fail:^(NSError *error) {
        
    }];
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
    ClassifyIconView *iconView = [[ClassifyIconView alloc] init];
    [iconView iconViewWithIconData:nil];
    iconView.clickIconAction = ^(NSInteger curIndex) {
        NSLog(@"%zi",curIndex);
    };
    [self.view addSubview:iconView];
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
