//
//  MSearchLayout.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/29.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MSearchLayout.h"

@interface MSearchLayout ()

@property (strong, nonatomic) NSMutableArray * sectionArr;

@property (strong, nonatomic) NSMutableArray * frameArr;

@property (assign, nonatomic) NSInteger currentWidth;

@property (strong, nonatomic) NSMutableArray * headerSizeArr;

@property (assign, nonatomic) int row;

@property (assign, nonatomic) CGFloat currentHight;

@property (assign, nonatomic) id<UICollectionViewDelegateFlowLayout>delegate;

@end


@implementation MSearchLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
          self.sectionArr = [NSMutableArray array];

    }
    return self;
}

-(void)prepareLayout{
    
    self.delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    
    self.headerSizeArr = [NSMutableArray array];
    
    self.currentHight = 0.0;
   
    NSInteger sectionCount = [self.collectionView numberOfSections];
    
//    NSLog(@"-----%@",self.headerSizeArr);
//    UICollectionViewLayoutAttributes * layoutHeader = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:0]];
//    
//    layoutHeader.frame =CGRectMake(0,0, self.headerReferenceSize.width, self.headerReferenceSize.height);
//
//    [self.frameArr addObject:layoutHeader];
    
    self.frameArr = [NSMutableArray array];
    
    for (int j=0; j<sectionCount; j++) {
        
        self.frameArr = [NSMutableArray array];
        
        self.currentWidth = 0.0;
        
        self.row = 0;
        
        NSInteger cellCount = [self.collectionView numberOfItemsInSection:j];
        
        for (int i=0; i<cellCount; i++) {
            
            [self LayoutForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:j]];
            
        }
        [self.sectionArr addObject:self.frameArr];
        CGSize headerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:j];
        CGRect firstRect = CGRectFromString([self.frameArr firstObject]);
        CGFloat minY = CGRectGetMinY(firstRect)-5.0-headerSize.height;
        CGRect lastRect = CGRectFromString([self.frameArr lastObject]);
        self.currentHight = CGRectGetMaxY(lastRect)+10.0;
        [self.headerSizeArr addObject:NSStringFromCGRect(CGRectMake(0.0, minY, headerSize.width, headerSize.height))];
    }
}


-(void)LayoutForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    UIEdgeInsets edgeInsets = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.item];
    
    CGSize headerSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:indexPath.section];
    
    CGFloat width = itemSize.width + self.currentWidth;
    
    int i=0;
    
    
    if ((edgeInsets.left+width+edgeInsets.right)>[UIScreen mainScreen].bounds.size.width) {
        
        i++;
        
        self.row += i;
        
    }
    
    CGFloat x = (edgeInsets.left+width+edgeInsets.right) > [UIScreen mainScreen].bounds.size.width?edgeInsets.left:self.currentWidth+edgeInsets.left;
    
    CGFloat y = edgeInsets.top+headerSize.height+self.row*(itemSize.height+5)+self.currentHight;
    
    CGRect newFrame = CGRectMake(x, y, itemSize.width, itemSize.height);
    
    self.currentWidth = (edgeInsets.left+width+edgeInsets.right)>[UIScreen mainScreen].bounds.size.width?itemSize.width+5.0:width+5.0;
    
    [self.frameArr addObject:NSStringFromCGRect(newFrame)];
    
}



- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect

{
    
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    for (int i=0; i<self.headerSizeArr.count; i++) {
        UICollectionViewLayoutAttributes * layoutHeader = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:i]];
        
        layoutHeader.frame = CGRectFromString(self.headerSizeArr[i]);
        
        [layoutAttributes addObject:layoutHeader];
    }
    for (int j=0; j<self.sectionArr.count; j++) {
        NSArray *itemArr = self.sectionArr[j];
        for (int i = 0; i<itemArr.count; i++) {
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:j]];
            
            attributes.frame = CGRectFromString(itemArr[i]);
            
            
            [layoutAttributes addObject:attributes];
            
        }
    }

    return  layoutAttributes;
    
}


@end
