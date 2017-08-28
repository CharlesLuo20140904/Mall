//
//  Widget_object.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/14.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Widget_content.h"

@interface Widget_object : JSONModel
@property (strong, nonatomic) NSString *widget_id;
@property (strong, nonatomic) NSString *widget_title;
@property (strong, nonatomic) NSString *widget_type;
@property (assign, nonatomic) NSInteger widget_order;
@property (assign, nonatomic) BOOL widget_visible;
@property (strong, nonatomic) NSString *widget_hash;
@property (strong, nonatomic) NSString *widget_last_modify;
@property (strong, nonatomic) NSArray<Widget_content *> *widget_content;
@end
