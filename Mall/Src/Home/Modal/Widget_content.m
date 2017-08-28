//
//  Widget_content.m
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/14.
//  Copyright © 2017年 luo. All rights reserved.
//

#import "Widget_content.h"

@implementation Widget_content

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"key": @"key",
                                                                  @"image": @"image",
                                                                  @"route_type": @"route_object.route_type",
                                                                  @"route_target": @"route_object.",
                                                                  @"route_params": @"route_object.route_params"
                                                                  }];
}
@end
