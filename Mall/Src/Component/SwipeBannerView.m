//
//  SwipeBannerView.m
//  图片轮播控件
//
//  Created by Chow Tai Fook on 2017/5/17.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "SwipeBannerView.h"

@interface SwipeBannerView ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UIImageView *centerImageView;
@property (strong, nonatomic) UIImageView *rightImageView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (assign, nonatomic) NSInteger currentIndex;
@property (assign, nonatomic) NSInteger leftIndex;
@property (assign, nonatomic) NSInteger rightIndex;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSTimeInterval scrollDuration;
@end
@implementation SwipeBannerView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.currentIndex=0;
    }
    return self;
}



-(void)swipeViewInitWithFrame:(CGRect)frame Imageurls:(NSArray *)imgUrls indicatorTintColor:(UIColor *)color currentIndicatorTintColor:(UIColor *)currentColor duration:(NSTimeInterval)duration{
    self.frame = frame;
    self.scrollView.frame = frame;
    [self addSubview:self.scrollView];
    self.imageNameArr = imgUrls;
    
    /** 如果是1张图，不显示小圆点，同时不启动轮播 **/
    if (self.imageNameArr.count != 0) {
        if (self.imageNameArr.count == 1) {
            [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0.0)];
            /** 中间的imageView **/
            self.centerImageView.frame = CGRectMake(SCREEN_WIDTH, 0.0, SCREEN_WIDTH, frame.size.height);
            self.centerImageView.image = [UIImage imageNamed:self.imageNameArr[0]];
            [self.scrollView addSubview:self.centerImageView];
        }else{
            self.scrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, 0.0);
            [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0.0)];
            /** 左边的imageView **/
            self.leftImageView.frame = CGRectMake(0.0, 0.0, SCREEN_WIDTH, frame.size.height);
            self.leftImageView.image = [UIImage imageNamed:self.imageNameArr[self.imageNameArr.count-1]];
            [self.scrollView addSubview:self.leftImageView];
            
            /** 中间的imageView **/
            self.centerImageView.frame = CGRectMake(SCREEN_WIDTH, 0.0, SCREEN_WIDTH, frame.size.height);
            self.centerImageView.image = [UIImage imageNamed:self.imageNameArr[0]];
            [self.scrollView addSubview:self.centerImageView];
            
            /** 右边的imageView **/
            self.rightImageView.frame = CGRectMake(SCREEN_WIDTH*2, 0.0, SCREEN_WIDTH, frame.size.height);
            self.rightImageView.image = [UIImage imageNamed:self.imageNameArr[1]];
            [self.scrollView addSubview:self.rightImageView];
            
            /** 小圆点 **/
            self.pageControl.frame = CGRectMake(0.0, SCREEN_WIDTH/2.0-10.0, SCREEN_WIDTH, 10.0);
            self.pageControl.numberOfPages = self.imageNameArr.count;
            self.pageControl.pageIndicatorTintColor = color;
            self.pageControl.currentPageIndicatorTintColor = currentColor;
            [self addSubview:self.pageControl];
            
            /** 定时器滚动 **/
            self.scrollDuration = duration;
            [self startTimer];
        }
    }
}

/**
 ** scrollView委托方法
 **/
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(UIPageControl *)pageControl{
    if (_pageControl == nil) { 
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPage = 0;
    }
    return _pageControl;
}

-(UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

-(UIImageView *)centerImageView{
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc] init];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgAction:)];
        self.centerImageView.userInteractionEnabled = YES;
        [self.centerImageView addGestureRecognizer:tap];
    }
    return _centerImageView;
}

-(UIImageView *)rightImageView{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] init];
    }
    return _rightImageView;
}

/**
 ** 点击图片
 **/
-(void)imgAction:(UITapGestureRecognizer*)singleTap{
    if (self.clickImgAction) {
        self.clickImgAction(self.currentIndex);
    }
}

/**
 ** 启动定时器
 **/
-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollDuration target:self selector:@selector(startRun) userInfo:nil repeats:YES];
}

/**
 ** 停止定时器
 **/
-(void)stopTimer{
    [self.timer setFireDate:[NSDate distantFuture]];
}

/**
 ** 定时器的方法
 **/
-(void)startRun{
    [self.scrollView setContentOffset:CGPointMake(2*SCREEN_WIDTH, 0.0) animated:YES];
}

-(void)resetImage{
    self.leftIndex = (self.currentIndex + self.imageNameArr.count - 1)%self.imageNameArr.count;
    self.rightIndex = (self.currentIndex +self.imageNameArr.count + 1)%self.imageNameArr.count;
    self.leftImageView.image = [UIImage imageNamed:self.imageNameArr[self.leftIndex]];
    self.centerImageView.image = [UIImage imageNamed:self.imageNameArr[self.currentIndex]];
    self.rightImageView.image = [UIImage imageNamed:self.imageNameArr[self.rightIndex]];
    [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0.0)];;
}

/**
 ** scrollView委托方法
 **/
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x/SCREEN_WIDTH;
    if (offsetX == 0) {
        self.currentIndex = (self.currentIndex + self.imageNameArr.count - 1) % self.imageNameArr.count;
    }else if(offsetX == 2){
        self.currentIndex = (self.currentIndex + self.imageNameArr.count + 1) % self.imageNameArr.count;
    }
    [self.pageControl setCurrentPage:self.currentIndex];
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    NSLog(@"----%@",@"EndDragging");
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.imageNameArr.count > 1) {
        [self.timer setFireDate:[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]];
    }
    [self resetImage];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    NSLog(@"----%@",@"Animation");
    [self resetImage];
}

@end
