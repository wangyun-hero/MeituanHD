//
//  WYDropDownView.h
//  MeituanHD
//
//  Created by 王云 on 16/9/15.
//  Copyright © 2016年 王云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYDropDownView : UIView

/** 提供类方法, 快速创建View*/
+ (instancetype)dropdownView;

@property(nonatomic,strong) NSArray *categoryModelArray;

@end
