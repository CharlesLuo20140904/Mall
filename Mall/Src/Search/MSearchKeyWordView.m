//
//  MSearchKeyWordView.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/25.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MSearchKeyWordView.h"
#import "MHistoryCell.h"
#import "MSearchLayout.h"

#define CELL_HEIGHT 30.0

@interface MSearchKeyWordView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *historyArr;
@property (strong, nonatomic) NSArray *hotKeyArr;
@end

@implementation MSearchKeyWordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

-(void)keyWordViewInitWithFrame:(CGRect)frame historyKeys:(NSArray *)historyArr hotkeys:(NSArray *)hotkeysArr{
    self.frame = frame;
    MSearchLayout *layout = [[MSearchLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0.0, 10.0, frame.size.width, frame.size.height-10.0) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[MHistoryCell class] forCellWithReuseIdentifier:@"historyCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"historyHeader"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"hotKeyHeader"];
    [self addSubview:self.collectionView];
    self.historyArr = historyArr;
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
    CGSize size = [sizeArr[indexPath.row] CGSizeValue];
    return CGSizeMake(size.width+10.0, CELL_HEIGHT);
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
        UIButton *deleteButtton = [UIButton buttonWithType:UIButtonTypeSystem];
        [deleteButtton setFrame:CGRectMake(SCREEN_WIDTH-45.0, 5.0, 20.0, 20.0)];
        [deleteButtton setBackgroundImage:[UIImage imageNamed:@"垃圾桶"] forState:UIControlStateNormal];
        [headView addSubview:deleteButtton];
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
    MHistoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"historyCell" forIndexPath:indexPath];
    cell.content = self.historyArr[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.clickCell) {
        self.clickCell(indexPath);
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
