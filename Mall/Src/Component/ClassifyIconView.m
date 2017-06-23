//
//  ClassifyIconView.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/6/22.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "ClassifyIconView.h"

@implementation ClassifyIconView

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)classifyIconViewInitWith:(NSArray*)objectArr{
    
}

-(UIView*)iconViewWithFrame:(CGRect)frame{
    UIView *iconView = [[UIView alloc] initWithFrame:frame];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
    imageView.image = [UIImage imageNamed:@""];
    [iconView addSubview:imageView];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
//    title.textColor = [U];
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
