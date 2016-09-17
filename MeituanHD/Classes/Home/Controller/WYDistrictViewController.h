//
//  WYDistrictViewController.h
//  MeituanHD
//
//  Created by 王云 on 16/9/16.
//  Copyright © 2016年 王云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYDistrictViewController : UIViewController

//当选则了城市之后,城市数据返回,又在区域点击传到这里,然后再传给dropview实现数据源
@property (nonatomic, strong) NSArray *districtArray;

@end
