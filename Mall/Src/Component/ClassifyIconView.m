//
//  ClassifyIconView.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/6/22.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "ClassifyIconView.h"

#define ICON_SPACE ([UIScreen mainScreen].bounds.size.width-20-70*4)/3

@implementation ClassifyIconView

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)classifyIconViewInitWith:(NSArray*)objectArr{
    
}

-(void)iconViewWithIconData:(NSDictionary*)iconDataDict{
    NSArray *imgArray = @[@"母婴精选",@"时尚生活",@"全球美食",@"美妆个护"];
    self.frame = CGRectMake(0.0, SCREEN_WIDTH/2, SCREEN_WIDTH, imgArray.count/4*80.0);
    for (int i=0; i<imgArray.count; i++) {
        NSInteger column = i/4;
        UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(10.0+(i%4)*(70.0+ICON_SPACE), 0.0+column*(80), 70.0, 70.0)];
        iconView.userInteractionEnabled = YES;
        iconView.tag = i+1000;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconAction:)];
        [iconView addGestureRecognizer:singleTap];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15.0, 10.0, 40.0, 40.0)];
        imageView.image = [UIImage imageNamed:imgArray[i]];
        [iconView addSubview:imageView];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 60.0, 70.0, 10.0)];
        titleLabel.text = imgArray[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:13];
        [iconView addSubview:titleLabel];
        [self addSubview:iconView];
    }
}

-(void)iconAction:(UITapGestureRecognizer*)singleTap{
    if (self.clickIconAction) {
        self.clickIconAction(singleTap.view.tag);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
