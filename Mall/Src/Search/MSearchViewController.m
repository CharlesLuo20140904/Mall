//
//  MSearchViewController.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/25.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MSearchViewController.h"
#import "MSearchKeyWordView.h"

@interface MSearchViewController ()<UISearchBarDelegate>
@property(nonatomic,weak)UIView *containerView;
@end

@implementation MSearchViewController

-(instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController{
    self = [super initWithSearchResultsController:searchResultsController];
    if (self) {
        self.searchBar.placeholder = @"search";
        self.searchBar.delegate = self;
        self.searchBar.barTintColor = [UIColor whiteColor];
        self.hidesNavigationBarDuringPresentation = NO;
        self.dimsBackgroundDuringPresentation = NO;
        self.searchBar.tintColor = [UIColor grayColor];
        UITextField*searchField = [self.searchBar valueForKey:@"_searchField"];
        [searchField setBackgroundColor:[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0]];
//        if(@available(iOS 11.0, *)){
//            [[self.searchBar.heightAnchor constraintEqualToConstant:44] setActive:YES];
//        }
        [self.searchBar setValue:@"取消"forKey:@"_cancelButtonText"];
        searchField.enablesReturnKeyAutomatically = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor clearColor];
//    UIView *containView = [self.view.superview.subviews objectAtIndex:0];
//    containView.backgroundColor = [UIColor clearColor];
//    [self.view insertSubview:[self keyWordView] atIndex:0];
}

-(void)viewWillAppear:(BOOL)animated{
//    [self.tabBarController.tabBar setHidden:YES];
}


-(UIView*)keyWordView{
    NSArray *historyArr = @[@"面膜",@"奶粉",@"伊斯晶钻蜗牛霜覆防氧化面霜",@"美赞成一段二段三段四段奶粉",@"水果",@"三只松鼠",@"特产美食",@"男装鞋子"];
    MSearchKeyWordView *keyView = [[MSearchKeyWordView alloc] init];
    [keyView keyWordViewInitWithFrame:self.view.bounds historyKeys:historyArr hotkeys:nil];
    keyView.clickCell = ^(NSIndexPath *currentIndexPath) {
        
        NSLog(@"%@",currentIndexPath);
    };
//    view.backgroundColor = [UIColor whiteColor];
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20.0, 100.0, 250.0, 50.0)];
//    [btn setTitle:@"click me" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:btn];
    return keyView;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    self.active = YES;
    
    [self.Mdelegate pushView];
}

-(void)test{
    NSLog(@"sadasd");
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
