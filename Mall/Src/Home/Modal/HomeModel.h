//
//  HomeModel.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/24.
//  Copyright © 2017年 luo. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Section_object.h"

@interface HomeModel : JSONModel
@property (strong, nonatomic) NSArray<Section_object*> *section_object;
@property (strong, nonatomic) NSString *section_object_hash;
@property (strong, nonatomic) NSString *section_object_last_modify;
@end
