//
//  MSearchViewController.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/25.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MSearchViewController.h"
#import "MSearchKeyWordView.h"

@interface MSearchViewController ()
@property(nonatomic,weak)UIView *containerView;
@end

@implementation MSearchViewController

-(instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController{
    self = [super initWithSearchResultsController:searchResultsController];
    if (self) {
        self.searchBar.placeholder = @"search";
        self.searchBar.barTintColor = [UIColor colorWithRed:1.2 green:0.5 blue:0.4 alpha:1.0];
        self.hidesNavigationBarDuringPresentation = NO;
        self.dimsBackgroundDuringPresentation = NO;
        self.searchBar.tintColor = [UIColor grayColor];
        UITextField*searchField = [self.searchBar valueForKey:@"_searchField"];
        [searchField setBackgroundColor:[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1.0]];
        [self.searchBar setValue:@"取消"forKey:@"_cancelButtonText"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    UIView *containView = [self.view.superview.subviews objectAtIndex:0];
    containView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:[self keyWordView]];
}

-(UIView*)keyWordView{
    MSearchKeyWordView *view = [[MSearchKeyWordView alloc] initWithFrame:CGRectMake(0.0, 64.0, SCREEN_WIDTH, SCREEN_HEIGHT-64.0)];
//    view.backgroundColor = [UIColor whiteColor];
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20.0, 100.0, 250.0, 50.0)];
//    [btn setTitle:@"click me" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//    [view addSubview:btn];
    return view;
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
