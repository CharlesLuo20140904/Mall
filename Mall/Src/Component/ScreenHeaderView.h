//
//  ScreenHeaderView.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/9/5.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenHeaderView : UIView
@property (copy, nonatomic) void(^clickMenuAction)(NSInteger index);
-(void)headerViewInitWithFrame:(CGRect)frame
                    menuTitles:(NSArray*)titles;
@end 
