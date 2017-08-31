//
//  MSearchKeyWordView.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/25.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSearchKeyWordView : UIView
@property (copy, nonatomic) void(^clickCell) (NSIndexPath * currentIndexPath);
-(void)keyWordViewInitWithFrame:(CGRect)frame
                    historyKeys:(NSArray*)historyArr
                        hotkeys:(NSArray*)hotkeysArr;
@end
