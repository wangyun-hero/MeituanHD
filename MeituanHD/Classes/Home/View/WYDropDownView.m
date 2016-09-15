//
//  WYDropDownView.m
//  MeituanHD
//
//  Created by 王云 on 16/9/15.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYDropDownView.h"
#import "WYCategoryModel.h"
@interface WYDropDownView() <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *leftTabelView;
@property (weak, nonatomic) IBOutlet UITableView *rightTabelView;
//当选中左边cell的时候,记录对应位置的模型
@property(nonatomic,strong) WYCategoryModel *selectLeftModel;

@end

@implementation WYDropDownView

+ (instancetype)dropdownView{
    //方式一
//    UINib *nib = [UINib nibWithNibName:@"HMDropdownView" bundle:nil];
//    return [nib instantiateWithOwner:nil options:nil][0];

    //方法二
    return [[NSBundle mainBundle] loadNibNamed:@"WYDropDownView" owner:nil options:nil].firstObject;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
}

#pragma mark -数据源
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTabelView) {
        return self.categoryModelArray.count;
    }else{
        return self.selectLeftModel.subcategories.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (tableView == self.leftTabelView) {
        
        static NSString *cellID = @"cellID";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
            //设置cell的背景
            cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
            //选中的背景
            cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
        }
        //取到对应位置的模型
        WYCategoryModel *model = self.categoryModelArray[indexPath.row];
        
        //设置内容
        cell.textLabel.text = model.name;
        
    }else{
        
        static NSString *cellID = @"cellID";
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
            //在创建cell的时候, 设置默认背景
            cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];

            //设置选中背景
            cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];

            
        }
        //我们需要知道哪个cell被点击了,右边tabelview的数据就一个array
        
        NSArray *rightArray = self.selectLeftModel.subcategories;
        
        //设置内容
        cell.textLabel.text = rightArray[indexPath.row];
    }
    return cell;
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断当选中的是左边的tabelview的cell的时候,记录对应的模型,让右边tabelview刷新数据
    if (tableView == self.leftTabelView) {
        self.selectLeftModel = self.categoryModelArray[indexPath.row];
    }
    //右边tabelview刷新数据
    [self.rightTabelView reloadData];

}


@end
