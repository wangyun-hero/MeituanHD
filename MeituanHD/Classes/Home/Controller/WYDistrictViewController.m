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
#import "WYCityViewController.h"
#import "WYNavController.h"

@interface WYDistrictViewController ()

@end

@implementation WYDistrictViewController


- (IBAction)switchCityButtonClick:(id)sender
{
    //让之前的控制器消失
    [self dismissViewControllerAnimated:YES completion:nil];
    //给cityVC包裹一个nav控制器
    WYCityViewController *cityVC = [WYCityViewController new];
    WYNavController *nav = [[WYNavController alloc]initWithRootViewController:cityVC];
    //呈现样式
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    //转场样式
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //模态
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
    
//    [self presentViewController:nav animated:YES completion:nil];
    
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
