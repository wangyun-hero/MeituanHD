//
//  WYCityModel.h
//  MeituanHD
//
//  Created by 王云 on 16/9/17.
//  Copyright © 2016年 王云. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYCityModel : NSObject

/** 名字*/
@property (nonatomic, copy) NSString *name;

/** 拼音全称*/
@property (nonatomic, copy) NSString *pinYin;

/** 拼音缩写*/
@property (nonatomic, copy) NSString *pinYinHead;

/** 子数据(区县街道)--> districts 对应的也是数据模型*/
@property (nonatomic, strong) NSArray *districts;


@end
