//
//  WYCitySearchTableViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/17.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYCitySearchTableViewController.h"
#import "WYCityModel.h"
@interface WYCitySearchTableViewController ()
//总的城市数据数组
@property (nonatomic, strong) NSArray *citiesArray;

//搜索的结果数组
@property (nonatomic, strong) NSMutableArray *searchResultArray;

@end

@implementation WYCitySearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取总的城市数据
    NSArray *citiesPlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]  pathForResource:@"cities.plist" ofType:nil]];
    
    self.citiesArray = [NSArray yy_modelArrayWithClass:NSClassFromString(@"WYCityModel") json:citiesPlist];
    
    //初始化搜索结果的数组
    self.searchResultArray = [NSMutableArray array];
    
    
    
}

-(void)setSearchText:(NSString *)searchText
{
    //1. copy 内存管理属性
    _searchText = [searchText copy];
    //2. 将字符串转换为小写
    _searchText = _searchText.lowercaseString;
    //3. 清空搜索结果里面的数据
    [self.searchResultArray removeAllObjects];
    //4. 遍历
    for (WYCityModel *cityModel in self.citiesArray) {
        // 中文/ 拼音/拼音缩写 只要包含了, 就应该返回当前城市名
        if ([cityModel.name containsString:_searchText] || [cityModel.pinYin containsString:_searchText] || [cityModel.pinYinHead containsString:_searchText]) {
            
            [self.searchResultArray addObject:cityModel.name];
        }

    }
    //刷新数据
    [self.tableView reloadData];
    
    
}

#pragma mark -tabelview代理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [WYNotificationCenter postNotificationName:HMCityDidChangeNotifacation object:nil userInfo:@{HMCityNameKey:self.searchResultArray[indexPath.row]}];
    //取消模态
    
}

#pragma mark -数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResultArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.searchResultArray[indexPath.row];
    return  cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"共有%zd个搜索结果",self.searchResultArray.count];
}



@end
