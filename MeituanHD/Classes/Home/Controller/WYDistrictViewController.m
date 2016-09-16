//
//  WYDistrictViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/16.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYDistrictViewController.h"
#import "WYDropDownView.h"
#import "WYCityViewController.h"
@interface WYDistrictViewController ()

@end

@implementation WYDistrictViewController


- (IBAction)switchCityButtonClick:(id)sender
{
    NSLog(@"aaaaaaa");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //取到view
    WYDropDownView *dropView = [WYDropDownView dropdownView];
    [self.view addSubview:dropView];
    
    //dropview的高度就是navView的高
    [self.view layoutIfNeeded];
    UIView *navView = self.view.subviews[0];
    dropView.y = navView.bounds.size.height;
    
    //设置Popover的大小
    CGFloat height = CGRectGetMaxY(dropView.frame);
    self.preferredContentSize = CGSizeMake(dropView.size.width, height);
}



@end
