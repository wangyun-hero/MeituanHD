//
//  WYCityViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/16.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYCityViewController.h"
#import "WYCityGroupModel.h"

@interface WYCityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *cityGroupArray;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tabView;


@end

@implementation WYCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    //数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityGroups.plist" ofType:nil];
    NSArray *groupArray = [[NSArray alloc]initWithContentsOfFile:path];
    //字典转模型,并用全局属性去记录
    self.cityGroupArray = [NSArray yy_modelArrayWithClass:[WYCityGroupModel class] json:groupArray];
    
    //设置索引的颜色
    self.tabView.sectionIndexColor = WYTintColor;
    self.searchBar.tintColor = WYTintColor;
}

-(void)setupNav
{
    //设置标题和item
    self.title = @"切换城市";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barBuutonItemWithTarget:self action:@selector(backItemClick) icon:@"btn_navigation_close" highlighticon:@"btn_navigation_close_hl"];
}
#pragma mark -数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cityGroupArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WYCityGroupModel *model = self.cityGroupArray[section];
    return model.cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    //获取对应位置的模型
    WYCityGroupModel *model = self.cityGroupArray[indexPath.section];
    cell.textLabel.text = model.cities[indexPath.row];
    return  cell;
}

#pragma mark -代理方法
//设置组头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    WYCityGroupModel *model = self.cityGroupArray[section];
    return model.title;
}

//右侧索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //相当于取到所有的title并且返回
    return [self.cityGroupArray valueForKey:@"title"];
}


#pragma mark -cityVC左边item的点击事件

-(void)backItemClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
