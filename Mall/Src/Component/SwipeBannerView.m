//
//  SwipeBannerView.m
//  Mall
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

-(void)swipeViewInitWithFrame:(CGRect)fram Imageurls:(NSArray *)imgUrl indicatorTintColor:(UIColor *)color currentIndicatorTintColor:(UIColor *)currentColor duration:(NSTimeInterval)duration{
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.currentIndex=0;
        self.scrollView.frame = frame;
        [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0.0)];
        [self addSubview:self.scrollView];
        self.imageNameArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
        self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, frame.size.height)];
        self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0.0, SCREEN_WIDTH, frame.size.height)];
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0.0, SCREEN_WIDTH, frame.size.height)];
        self.leftImageView.image = [UIImage imageNamed:self.imageNameArr[self.imageNameArr.count-1]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToWebview)];
        self.centerImageView.userInteractionEnabled = YES;
        [self.centerImageView addGestureRecognizer:tap];
        self.centerImageView.image = [UIImage imageNamed:self.imageNameArr[0]];
        self.rightImageView.image = [UIImage imageNamed:self.imageNameArr[1]];
        [self.scrollView addSubview:self.leftImageView];
        [self.scrollView addSubview:self.centerImageView];
        [self.scrollView addSubview:self.rightImageView];
        [self addSubview:self.pageControl];
        [self startTimer];
    }
    return self;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, 0.0);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(void)jumpToWebview{
    [self.delegate delegatemethod];
}

-(UIPageControl *)pageControl{
    if (_pageControl == nil) { 
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, SCREEN_WIDTH/2.0-10.0, SCREEN_WIDTH, 10.0)];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 4;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    }
    return _pageControl;
}

-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(startRun) userInfo:nil repeats:YES];
}

-(void)stopTimer{
    [self.timer setFireDate:[NSDate distantFuture]];
}

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
