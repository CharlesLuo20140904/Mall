//
//  SwipeBannerView.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/5/17.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeBannerView : UIView
@property (copy, nonatomic) void(^clickImgAction) (NSInteger curIndex);
@property (strong, nonatomic) NSArray *imageNameArr;
-(void)swipeViewInitWithFrame:(CGRect)frame
                                Imageurls:(NSArray*)imgUrls
                       indicatorTintColor:(UIColor*)color
                currentIndicatorTintColor:(UIColor*)currentColor
                                 duration:(NSTimeInterval)duration;
@end
