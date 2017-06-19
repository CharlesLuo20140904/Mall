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
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSTimeInterval scrollDuration;
@property (assign, nonatomic) NSInteger index;
@end
@implementation SwipeBannerView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"asdasdasd");
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0,  0.0, frame.size.width, frame.size.height)];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.contentSize = CGSizeMake(3*SCREEN_WIDTH, 0.0);
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        [self.scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0.0)];
        self.imageNameArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];

        self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, frame.size.height)];
        self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0.0, SCREEN_WIDTH, frame.size.height)];
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0.0, SCREEN_WIDTH, frame.size.height)];
        self.leftImageView.image = [UIImage imageNamed:self.imageNameArr[self.imageNameArr.count-1]];
        self.centerImageView.image = [UIImage imageNamed:self.imageNameArr[1]];
        self.rightImageView.image = [UIImage imageNamed:self.imageNameArr[2]];
        [self.scrollView addSubview:self.leftImageView];
        [self.scrollView addSubview:self.centerImageView];
        [self.scrollView addSubview:self.rightImageView];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];

    }
    return self;
}

-(UIPageControl *)pageControl{
    if (_pageControl == nil) { 
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, SCREEN_WIDTH/2.0-10.0, SCREEN_WIDTH, 10.0)];
        _pageControl.currentPage = 1;
        _pageControl.numberOfPages = 4;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
//        [_pageControl addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>];
    }
    return _pageControl;
}

-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(startRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)stopTimer{
    [self.timer setFireDate:[NSDate distantFuture]];
}

-(void)startRun{
    
}

-(void)resetImage{
    self.index++;
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.currentIndex = (NSInteger)(scrollView.contentOffset.x/SCREEN_WIDTH+0.5)%(NSInteger)SCREEN_WIDTH;
    NSLog(@"%zi",self.currentIndex);
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.imageNameArr.count > 1) {
        [self.timer setFireDate:[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]];
    }
    [scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0.0)];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

}

@end
