//
//  Widget_content.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/14.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Widget_content : JSONModel
@property (strong, nonatomic) NSString * key;
@property (strong, nonatomic) NSString * image;
@property (strong, nonatomic) NSString * route_type;
@property (strong, nonatomic) NSString * route_target;
@property (strong, nonatomic) id route_params;

@end
