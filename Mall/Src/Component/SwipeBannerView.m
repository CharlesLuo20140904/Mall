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
@end
@implementation SwipeBannerView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.contentSize = CGSizeMake(3*SCREEN_RECT.size.width, 0.0);
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        [self.scrollView setContentOffset:CGPointMake(SCREEN_RECT.size.width, 0.0)];
        self.imageNameArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"];
        NSInteger count = [self.imageNameArr count];
        NSLog(@"%f",SCREEN_RECT.size.width/2);
        for (int i=0; i<count-1; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0+i*SCREEN_RECT.size.width, 0.0, SCREEN_RECT.size.width, 187.5)];
            if (i == 0) {
                imageView.image = [UIImage imageNamed:self.imageNameArr[count-1]];
                self.leftImageView = imageView;
            }else if (i == 1){
                imageView.image = [UIImage imageNamed:self.imageNameArr[i-1]];
                self.centerImageView = imageView;
            }else if (i ==2 ){
                imageView.image = [UIImage imageNamed:self.imageNameArr[i-1]];
                self.rightImageView = imageView;
            }
            [self.scrollView addSubview:imageView];
        }
        
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];

    }
    return self;
}

-(UIPageControl *)pageControl{
    if (_pageControl == nil) { 
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0.0, SCREEN_RECT.size.width/2-10.0, SCREEN_RECT.size.width, 10.0)];
        _pageControl.currentPage = 1;
        _pageControl.numberOfPages = 4;
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
//        [_pageControl addTarget:self action:@selector(<#selector#>) forControlEvents:<#(UIControlEvents)#>];
    }
    return _pageControl;
}

-(void)startTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(startRun:) userInfo:nil repeats:YES];
}

-(void)stopTimer{
    [self.timer setFireDate:[NSDate distantFuture]];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

}

@end
