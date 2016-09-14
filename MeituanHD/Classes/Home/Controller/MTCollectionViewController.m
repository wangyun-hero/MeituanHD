//
//  MTCollectionViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/14.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "MTCollectionViewController.h"



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
  
    
    //设置右边的item
    [self setupNavRight];
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

-(void)mapItemClick
{
    NSLog(@"地图");
}

-(void)searchItemClick
{
    NSLog(@"搜索");
}

@end
