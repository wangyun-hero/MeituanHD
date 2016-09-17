//
//  MTCollectionViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/14.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "MTCollectionViewController.h"
#import "HomeNavView.h"
#import "WYCategoryViewController.h"
#import "WYDistrictViewController.h"
@interface MTCollectionViewController ()

@end

@implementation MTCollectionViewController


- (instancetype)init
{
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = HMColor(230, 230, 230);
  
    //设置左边的logo
    [self setupNavLeft];
    //设置右边的item
    [self setupNavRight];
    
    //添加城市选择的通知
    [WYNotificationCenter addObserver:self selector:@selector(cityVCDidChangeNotification:) name:HMCityDidChangeNotifacation object:nil];
}

#pragma mark -通知实现
-(void)cityVCDidChangeNotification:(NSNotification *)notification
{
    //取到通过通知传的值,就是城市名字
    NSString *cityName = notification.userInfo[HMCityNameKey];
    NSLog(@"%@",cityName)
}

#pragma mark -移除通知
-(void)dealloc
{
    [WYNotificationCenter removeObserver:self];
}

-(void)setupNavLeft
{
    //1 设置logo
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStylePlain target:nil action:nil];
    //取消交互
    item.enabled = NO;
    
    //2 分类
    HomeNavView *categoryNavView = [HomeNavView homeNavView];
    UIBarButtonItem *cateItem = [[UIBarButtonItem alloc]initWithCustomView:categoryNavView];
    [categoryNavView addTarget:self action:@selector(categoryClick) forControlEvents:UIControlEventTouchUpInside];
    
    //3 区域
    HomeNavView *districtNavView = [HomeNavView homeNavView];
    UIBarButtonItem *disItem = [[UIBarButtonItem alloc]initWithCustomView:districtNavView];
    [districtNavView setTarget:self action:@selector(districtClick)];
    
    
    //4 排序
    HomeNavView *sortNavView = [HomeNavView homeNavView];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc]initWithCustomView:sortNavView];
    
    
    self.navigationItem.leftBarButtonItems = @[item,cateItem,disItem,sortItem];
}

-(void)setupNavRight
{
    //添加地图按钮
    UIBarButtonItem *mapItem = [UIBarButtonItem barBuutonItemWithTarget:self action:@selector(mapItemClick) icon:@"icon_map" highlighticon:@"icon_map_highlighted"];
    mapItem.customView.width = 60;
    //添加搜索按钮
    UIBarButtonItem *searchItem = [UIBarButtonItem barBuutonItemWithTarget:self action:@selector(searchItemClick) icon:@"icon_search" highlighticon:@"icon_search_highlighted"];
    searchItem.customView.width = 60;
    //设置右边的导航栏按钮
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
}

-(void)districtClick
{
    //获取控制器
    WYDistrictViewController *vc = [WYDistrictViewController new];
    //呈现方式
    vc.modalPresentationStyle = UIModalPresentationPopover;
    //获取Popover
    UIPopoverPresentationController *popVC = vc.popoverPresentationController;
    //绑定属性
    popVC.barButtonItem = self.navigationItem.leftBarButtonItems[2];
    //弹出
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)categoryClick
{
    //获取控制器
    WYCategoryViewController *vc = [[WYCategoryViewController alloc]init];
    //呈现方式
    vc.modalPresentationStyle = UIModalPresentationPopover;
    //获取Popover
    UIPopoverPresentationController *popVC = vc.popoverPresentationController;
    //绑定属性
    popVC.barButtonItem = self.navigationItem.leftBarButtonItems[1];
    //弹出
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)mapItemClick
{
    NSLog(@"地图");
}

-(void)searchItemClick
{
    NSLog(@"搜索");
}

@end
