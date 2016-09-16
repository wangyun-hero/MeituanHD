//
//  WYCityViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/16.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYCityViewController.h"
#import "WYCityGroupModel.h"

@interface WYCityViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic, strong) NSArray *cityGroupArray;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property (weak, nonatomic) IBOutlet UIButton *coverButton;


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

#pragma mark -UISearchBar代理
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    //2. 更换搜索框背景图片
    searchBar.backgroundImage = [UIImage imageNamed:@"bg_login_textfield_hl"];
    //显示取消按钮
    [searchBar setShowsCancelButton:YES animated:YES];
    //显示遮盖
    self.coverButton.alpha = 0.5;
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    //1. 导航栏隐藏
    self.navigationController.navigationBarHidden = NO;
    
    //2. 更换搜索框背景图片
    searchBar.backgroundImage = [UIImage imageNamed:@"bg_login_textfield"];
    
    //3. 显示取消按钮
    [searchBar setShowsCancelButton:NO animated:YES];
    
    //4. 显示遮盖
    self.coverButton.alpha = 0;
    
//    //5. 文本框清空
//    searchBar.text = @"";
//    
//    //6. 隐藏搜索结果控制器
//    self.citySearchVC.view.hidden = YES;

}

//searchBar后面取消按钮的点击
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //放弃第一响应者,相当于end编辑,会走到searchBarTextDidEndEditing这个方法里面
    [searchBar resignFirstResponder];
}

//遮盖按钮的点击
- (IBAction)coverBtnClick:(id)sender
{
    [self.view endEditing:YES];
}


#pragma mark -UITabelView数据源
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

#pragma mark -UITabelView代理方法
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
