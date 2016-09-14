//
//  HomeNavView.m
//  MeituanHD
//
//  Created by 王云 on 16/9/14.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "HomeNavView.h"

@implementation HomeNavView

/** 提供类方法, 快速创建View*/
+ (instancetype)homeNavView
{
    return [[NSBundle mainBundle] loadNibNamed:@"HomeNavView" owner:nil options:nil].firstObject;
    
}

@end
