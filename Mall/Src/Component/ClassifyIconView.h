//
//  ClassifyIconView.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/6/22.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassifyIconView : UIView

@property (copy, nonatomic) void(^clickIconAction) (NSInteger curIndex);
-(void)iconViewWithIconData:(NSDictionary*)iconDataDict;

@end
