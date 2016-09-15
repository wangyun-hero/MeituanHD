//
//  WYCategoryViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/15.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYCategoryViewController.h"
#import "WYDropDownView.h"

@interface WYCategoryViewController ()

@end

@implementation WYCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建下拉菜单view
    WYDropDownView *dropDownView = [WYDropDownView dropdownView];
    
    //添加到控制器的view上
    [self.view addSubview:dropDownView];
    
    //设置弹框的大小(就是xib中dropview的大小)
    self.preferredContentSize = dropDownView.size;
    
    
}



@end
