//
//  WYCityModel.m
//  MeituanHD
//
//  Created by 王云 on 16/9/17.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYCityModel.h"

@implementation WYCityModel



// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"districts" : NSClassFromString(@"WYDistrictModel")};
}


@end
