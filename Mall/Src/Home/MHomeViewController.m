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
#import "Section_object.h"
#import "Section_content.h"
#import "MSearchViewController.h"
#import "ActivityEntryView.h"
#import "MSearchResultController.h"
#import "MResultListViewController.h"

@interface MHomeViewController ()<UISearchControllerDelegate,UISearchResultsUpdating,MSearchViewDelegate>
@property (strong, nonatomic) NSArray *section_objects;
@property (nonatomic, strong) MSearchViewController *searchController;
@property (nonatomic, strong) MSearchResultController *vc;
@end

@implementation MHomeViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        /** 不加 **/
        self.definesPresentationContext = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.hidesBottomBarWhenPushed = YES;
    
//    self.hidesBottomBarWhenPushed = YES;
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.extendedLayoutIncludesOpaqueBars = YES;
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.toolbar.translucent = NO;
    NSArray *imageArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",];
    [CLNetworkingManager getNetworkRequestWithUrlString:HOME_TAB_SCENE_URL parameters:nil isCache:YES succeed:^(id data) {
//        NSLog(@"%@",data);
        NSData *dstr = [NSJSONSerialization dataWithJSONObject:[data objectForKey:@"data"] options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc] initWithData:dstr encoding:NSUTF8StringEncoding];
        HomeModel *hm = [[HomeModel alloc] initWithString:str error:nil];
        self.section_objects = hm.section_object;
//        NSLog(@"%zi",hm.section_object.count);
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
    
    self.vc = [[MSearchResultController alloc] init];
    
    self.searchController = [[MSearchViewController alloc] initWithSearchResultsController:self.vc];
    self.searchController.Mdelegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    self.navigationItem.titleView = self.searchController.searchBar;
    
    ActivityEntryView *entryView = [[ActivityEntryView alloc] initWithFrame:CGRectMake(0.0, CGRectGetMaxY(iconView.frame), SCREEN_WIDTH, 180.0)];
    [self.view addSubview:entryView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self navigationItemInit];
}

-(void)willPresentSearchController:(UISearchController *)searchController{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    [self.tabBarController.tabBar setHidden:YES];
    
}

-(void)navigationItemInit{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"扫一扫"] style:UIBarButtonItemStylePlain target:self action:@selector(scanQrcode)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"消息"] style:UIBarButtonItemStylePlain target:self action:@selector(showMessage)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)willDismissSearchController:(UISearchController *)searchController{
    [self navigationItemInit];
    [self.tabBarController.tabBar setHidden:NO];
}

-(void)searchBarInit{

}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{

}

-(void)pushView{
    MResultListViewController *listVC = [[MResultListViewController alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
}

-(void)scanQrcode{

}


-(void)showMessage{

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
