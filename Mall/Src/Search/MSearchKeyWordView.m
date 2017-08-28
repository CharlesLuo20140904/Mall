//
//  MSearchKeyWordView.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/25.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MSearchKeyWordView.h"

@interface MSearchKeyWordView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation MSearchKeyWordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"historyCell"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"historyHeader"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hotKeyHeader"];
        [self addSubview:self.collectionView];
        self.historyArr = @[@"面膜",@"面膜啊大叔大婶的啊实打实的",@"面膜是事实",@"面膜啊",@"面膜啊实打",];
    }
    return self;
}

-(NSMutableArray *)sizeForArr:(NSArray*)stringArr{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i<stringArr.count; i++) {
        CGSize size = [stringArr[i] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20.0, 20) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        [arr addObject:[NSValue valueWithCGSize:size]];
    }
    return arr;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.historyArr.count;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5.0;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5.0, 10.0, 10.0, 10.0);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *sizeArr = [self sizeForArr:self.historyArr];
//    NSLog(@"===%zi",[self.historyArr[indexPath.row] length]);
    return [sizeArr[indexPath.row] CGSizeValue];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 30.0);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *headIdentifier = @"hotKeyHeader";
    UICollectionReusableView *headView = nil;
    if (indexPath.section == 0) {
        headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentifier forIndexPath:indexPath];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5.0, 100.0, 20.0)];
        title.text = @"搜索历史";
        title.font = [UIFont systemFontOfSize:14];
        [headView addSubview:title];
    }else if (indexPath.section == 1){
        headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentifier forIndexPath:indexPath];
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5.0, 100.0, 20.0)];
        title.font = [UIFont systemFontOfSize:14];
        title.text = @"热门搜索";
        [headView addSubview:title];
    }
    
    return headView;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"historyCell" forIndexPath:indexPath];
    if (!cell) {
        //
    }
    cell.backgroundColor = [UIColor greenColor];
    UILabel *label = [];
    return cell;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
