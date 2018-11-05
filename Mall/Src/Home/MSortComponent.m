//
//  MSortComponentController.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/9/5.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MSortComponent.h"
#import "SwipeBannerView.h"
#import "ClassifyIconView.h"
#import "ActivityEntryView.h"
/***************************************
 CarouselWidget           //轮播图控件
 QuickLinkWidget          //首页分类icon
 BannerJigsawWidget       //4个活动入口
 BrandJigsawWidget        //品牌墙推荐
 ActivityShowTimerWidget  //首页活动组合挂件(顶部banner下方滑动展示商品，有倒计时)
 ActivityPintuanWidget    //同上，只是没有倒计时
 ActivityShowWidget       //同上
 BannerWidget             //单图banner
 ProductJigsawWidget      //商品两列三列展示
 ProductSliderWidget      //商品滑动展示
 ProductShowWidget        //单品展示控件
 StoreListWidget          //
 GetCouponWidget          //
 GetCouponShopWidget      //
 GoldBoardWidget          //
 ArticleListWidget        //
 AnnouncementWidget       //
 ***************************************/


@interface MSortComponent ()

@end

@implementation MSortComponent

-(NSMutableArray *)viewDataInit{
    NSMutableArray *viewArr = [NSMutableArray array];
    NSArray *typeArr = @[@"CarouselWidget",@"QuickLinkWidget",];
    for (NSString *typeStr in typeArr) {
        if ([typeStr isEqualToString:@"CarouselWidget"]) {
            [viewArr addObject:[self swipeViewInitWithData:@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg"]]];
        }else if([typeStr isEqualToString:@"QuickLinkWidget"]){
            [viewArr addObject:[self iconViewInitWithData:nil]];
        }
    }
    return viewArr;
}

/**
 ** 初始化轮播组件
 **/
-(SwipeBannerView*)swipeViewInitWithData:(id)data{
    NSArray *imageArr = (NSArray*)data;
    SwipeBannerView *swipeView = [[SwipeBannerView alloc] init];
    [swipeView swipeViewInitWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_WIDTH/2)
                            Imageurls:imageArr
                   indicatorTintColor:[UIColor grayColor]
            currentIndicatorTintColor:[UIColor redColor]
                             duration:3];
    swipeView.clickImgAction = ^(NSInteger curIndex) {
        if (curIndex == 0) {
            NSLog(@"succeed");
        }
    };
    return swipeView;
}

/**
 ** scrollView委托方法
 **/
-(ClassifyIconView *)iconViewInitWithData:(id)data{
    ClassifyIconView *iconView = [[ClassifyIconView alloc] init];
    [iconView iconViewWithIconData:nil];
    iconView.clickIconAction = ^(NSInteger curIndex) {
        [self.delegate clickObject:nil withType:nil];
    };
    return iconView;
}

/**
 ** scrollView委托方法
 **/

-(ActivityEntryView*)entryViewInitWithData:(id)data{
    ActivityEntryView *entryView = [[ActivityEntryView alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_WIDTH, 180.0)];
    return entryView;
}

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/

/**
 ** scrollView委托方法
 **/


@end
