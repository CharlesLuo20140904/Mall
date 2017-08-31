//
//  MSearchResultController.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/31.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MSearchResultController.h"
#import "MSearchResultCell.h"

@interface MSearchResultController ()<UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation MSearchResultController

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView registerClass:[MSearchResultCell class] forCellReuseIdentifier:@"resultCell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSearchResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultCell"];
    if (!cell) {
        cell = [[MSearchResultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resultCell"];
    }
    cell.textLabel.text = @"面膜";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
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
