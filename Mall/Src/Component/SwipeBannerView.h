//
//  SwipeBannerView.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/5/17.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeBannerView : UIView

@property (strong, nonatomic) NSArray *imageNameArr;
-(SwipeBannerView*)swipeViewInitWithImageurls:(NSArray*)imgUrl indicatorTintColor:(UIColor*)color currentIndicatorTintColor:(UIColor*)currentColor compeltion:(void(^)(NSString *result))compeltion;
@end
