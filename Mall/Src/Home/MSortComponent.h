//
//  MSortComponentController.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/9/5.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ComponentDelegate <NSObject>

@required
-(void)clickObject:(id)objc withType:(NSString *)type;

@end

@interface MSortComponent : NSObject
@property (weak, nonatomic) id<ComponentDelegate> delegate;
@property (strong, nonatomic) NSArray *slideViewDatas;
-(NSMutableArray *)viewDataInit;
@end
