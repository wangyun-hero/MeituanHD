//
//  WYNavController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/14.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYNavController.h"

@interface WYNavController ()

@end

@implementation WYNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//当类第一次创建的时候被调用
+(void)initialize
{
    //获取navBar
    UINavigationBar *navBar = [UINavigationBar appearance];
    //设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    
}

@end
