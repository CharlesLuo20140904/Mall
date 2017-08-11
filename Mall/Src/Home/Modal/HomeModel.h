//
//  HomeModel.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/3.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Section_object.h"

@class HomeData;

@interface HomeModel : JSONModel
@property (strong, nonatomic) NSArray<Section_object *> * section_objects;
@property (strong, nonatomic) NSString *section_object_hash;
@property (assign, nonatomic) NSString *section_object_last_modify;
@end
