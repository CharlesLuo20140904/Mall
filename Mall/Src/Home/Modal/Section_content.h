//
//  Section_content.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/11.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Widget_object.h"

@interface Section_content : JSONModel
@property (strong, nonatomic) NSArray<Widget_object *> *widget_object;
@property (strong, nonatomic) NSString *widget_object_hash;
@property (strong, nonatomic) NSString *widget_object_last_modify;
@end
