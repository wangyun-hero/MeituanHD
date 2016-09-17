//
//  WYDistrictModel.h
//  MeituanHD
//
//  Created by 王云 on 16/9/17.
//  Copyright © 2016年 王云. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYDistrictModel : NSObject
/** 名字*/
@property (nonatomic, copy) NSString *name;

/** 子区域数据*/
@property (nonatomic, strong) NSArray *subdistricts;

@end
