//
//  SwipeBannerView.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/5/17.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol mydelegate <NSObject>

-(void)delegatemethod;

@end

@interface SwipeBannerView : UIView
@property (assign, nonatomic) id<mydelegate> delegate;
@property (strong, nonatomic) NSArray *imageNameArr;
-(void)swipeViewInitWithFrame:(CGRect)fram
                                Imageurls:(NSArray*)imgUrl
                       indicatorTintColor:(UIColor*)color
                currentIndicatorTintColor:(UIColor*)currentColor
                                 duration:(NSTimeInterval)duration;
@end
