//
//  MHistoryCell.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/29.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "MHistoryCell.h"

@interface MHistoryCell ()
@property (strong, nonatomic) UILabel *contentLabel;
@end

@implementation MHistoryCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        UIGraphicsBeginImageContextWithOptions(frame.size, NO, 0);
        CGContextRef context =UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 0.8);
        CGContextMoveToPoint(context, 1.0+5.0, 1.0);
        CGContextAddLineToPoint(context, width-6.0, 1.0);
        CGContextAddArcToPoint(context, width-1.0, 1.0, width-1.0, 6.0, 5.0);
        CGContextAddLineToPoint(context, width-1.0, height-6.0);
        CGContextAddArcToPoint(context, width-1.0, height-1.0, width-6.0, height-1.0, 5.0);
        CGContextAddLineToPoint(context, width-6.0, height-1.0);
        CGContextAddArcToPoint(context, 1.0, height-1.0, 1.0, height-6.0, 5.0);
        CGContextAddLineToPoint(context, 1.0, 6.0);
        CGContextAddArcToPoint(context, 1.0, 1.0, 6.0, 1.0, 5.0);
        CGContextClosePath(context);
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        CGContextStrokePath(context);
        UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        backgroundImageView.image = backgroundImage;
        [self addSubview:backgroundImageView];
        self.contentLabel.frame = self.bounds;
        [self addSubview:self.contentLabel];
        
    }
    return self;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = [UIColor darkGrayColor];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

-(void)setContent:(NSString *)content{
    if (content) {
        self.contentLabel.text = content;
    }
}

@end
