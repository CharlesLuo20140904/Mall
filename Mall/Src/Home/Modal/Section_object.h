//
//  Section_object.h
//  Mall
//
//  Created by Chow Tai Fook on 2017/8/11.
//  Copyright © 2017年 luo. All rights reserved.
//
/**滑动页**/
#import <JSONModel/JSONModel.h>
#import "Section_content.h"

@interface Section_object : JSONModel
@property (nonatomic, strong) NSString *section_title;
@property (nonatomic, strong) NSString *section_key;
@property (nonatomic, strong) NSString *section_content_type;
@property (nonatomic, strong) NSArray<Section_content *> *section_content;
@end
