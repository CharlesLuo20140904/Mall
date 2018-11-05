//
//  MHomeViewController.m
//  Mall
//
//  Created by luo on 2017/5/11.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MHomeViewController.h"
#import "WebViewController.h"
#import "CLNetworkingManager.h"
#import <JSONModel/JSONModel.h>
#import "HomeModel.h"
#import "Section_object.h"
#import "Section_content.h"
#import "MSearchResultController.h"
#import "MResultListViewController.h"
#import "MSortComponent.h"
#import "ComponentTableView.h"
#import "MWebViewController.h"
#import "MImagePickController.h"

@interface MHomeViewController ()<UISearchControllerDelegate,UISearchResultsUpdating,MSearchViewDelegate,ComponentDelegate>
@property (strong, nonatomic) NSArray *section_objects;
@property (nonatomic, strong) MSearchResultController *vc;
@property (assign, nonatomic) BOOL shouldHideTabbar;
@end

@implementation MHomeViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        /** 不加 **/
        self.definesPresentationContext = YES;
        [self navigationItemInit];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ComponentTableView *mainView = [[ComponentTableView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT-64.0)];
    MSortComponent *sortComponent = [[MSortComponent alloc] init];
    sortComponent.delegate = self;
    mainView.ViewArr = [sortComponent viewDataInit];
    [self.view addSubview:mainView];
    [CLNetworkingManager getNetworkRequestWithUrlString:HOME_TAB_SCENE_URL parameters:nil isCache:YES succeed:^(id data) {
//        NSLog(@"%@",data);
        NSData *dstr = [NSJSONSerialization dataWithJSONObject:[data objectForKey:@"data"] options:NSJSONWritingPrettyPrinted error:nil];
        NSString *str = [[NSString alloc] initWithData:dstr encoding:NSUTF8StringEncoding];
        HomeModel *hm = [[HomeModel alloc] initWithString:str error:nil];
        self.section_objects = hm.section_object;
//        NSLog(@"%zi",hm.section_object.count);
    } fail:^(NSError *error) {
        
    }];

    
    
    self.vc = [[MSearchResultController alloc] init];
    self.searchController = [[MSearchViewController alloc] initWithSearchResultsController:self.vc];
    self.searchController.Mdelegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    if (@available(iOS 11.0, *)) {
        self.navigationItem.searchController = self.searchController;
        self.searchController.active = YES;
    } else {
        // Fallback on earlier versions
        self.navigationItem.titleView = self.searchController.searchBar;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.tabBarController.tabBar setHidden:NO];
    

}

/*****组件委托方法*****/
-(void)clickObject:(id)objc withType:(NSString *)type{
    MWebViewController *mwc = [[MWebViewController alloc] init];
    mwc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mwc animated:YES];
}

/*****搜索框方法******/
-(void)willPresentSearchController:(UISearchController *)searchController{
//    self.shouldHideTabbar = NO;
//    [self hideNavigationItem];
}

-(void)hideNavigationItem{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
//    [self.tabBarController.tabBar setHidden:YES];
}

-(void)navigationItemInit{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"扫一扫"] style:UIBarButtonItemStylePlain target:self action:@selector(scanQrcode)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"消息"] style:UIBarButtonItemStylePlain target:self action:@selector(showMessage)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)willDismissSearchController:(UISearchController *)searchController{
    NSLog(@"willDismissSearchController");
//    [self navigationItemInit];
//    if (!self.shouldHideTabbar) {
//        [self.tabBarController.tabBar setHidden:NO];
//    }
}

//-(void)willPresentSearchController:(UISearchController *)searchController{
//
//}

-(void)presentSearchController:(UISearchController *)searchController{
    NSLog(@"+++++");
}


-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"--------");
}

-(void)pushView{
    MResultListViewController * listVC = [[MResultListViewController alloc] init];
//    self.shouldHideTabbar = YES;
    listVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:listVC animated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)scanQrcode{
    MImagePickController *Pvc = [[MImagePickController alloc] init];
    Pvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:Pvc animated:YES];
}

-(void)showMessage{
    
}

/************/



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
