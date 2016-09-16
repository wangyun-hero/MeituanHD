//
//  WYCityViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/16.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYCityViewController.h"

@interface WYCityViewController ()

@end

@implementation WYCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}

-(void)setupNav
{
    self.title = @"切换城市";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barBuutonItemWithTarget:self action:@selector(backItemClick) icon:@"btn_navigation_close" highlighticon:@"btn_navigation_close_hl"];
    
}

-(void)backItemClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
