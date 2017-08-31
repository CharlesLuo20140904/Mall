//
//  ActivityEntryView.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/3.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "ActivityEntryView.h"

#define margin 5.0

@implementation ActivityEntryView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}


-(void)setImageArr:(NSArray *)imageArr{
    if (imageArr.count != 0) {
        for (int i=0; i<imageArr.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            if (i > 1) {
                imageView.frame = CGRectMake(margin+(i%2)*(margin+(SCREEN_WIDTH-3*margin)/2), margin, (self.frame.size.width-3*margin)/2, (self.frame.size.height-3*margin)/2);
            }else{
                imageView.frame = CGRectMake(margin+(i%2)*(margin+(SCREEN_WIDTH-3*margin)/2), 2*margin+(self.frame.size.height-3*margin)/2, (self.frame.size.width-3*margin)/2, (self.frame.size.height-3*margin)/2);
            }
            imageView.backgroundColor = [UIColor grayColor];
            [self addSubview:imageView];
        }
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
