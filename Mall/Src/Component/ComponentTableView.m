//
//  ComponentTableView.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/9/11.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "ComponentTableView.h"

@interface ComponentTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *mainTalbleView;
@end

@implementation ComponentTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mainTalbleView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        self.mainTalbleView.delegate = self;
        self.mainTalbleView.dataSource = self;
        self.mainTalbleView.tableFooterView = [[UIView alloc] init];
        self.mainTalbleView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //    self.mainTalbleView.backgroundColor = [UIColor greenColor];
        
        [self.mainTalbleView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"component"];
        [self addSubview:self.mainTalbleView];

    }
    return self;
}

/*****tableview方法******/
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ViewArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CGRectGetHeight([self.ViewArr[indexPath.row] frame]);
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"component"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"component"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    [cell.contentView addSubview:self.ViewArr[indexPath.row]];
    return cell;
}

/************/

-(void)setViewArr:(NSArray *)ViewArr{
    if (ViewArr.count != 0) {
        _ViewArr = ViewArr;
        [self.mainTalbleView reloadData];
    }
}

@end
