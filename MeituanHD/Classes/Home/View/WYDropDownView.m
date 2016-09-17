//
//  WYDropDownView.m
//  MeituanHD
//
//  Created by 王云 on 16/9/15.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYDropDownView.h"
#import "WYCategoryModel.h"
#import "WYDistrictModel.h"
#import "WYDropdownLeftTableViewCell.h"
#import "WYDropdownRightTableViewCell.h"

@interface WYDropDownView() <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *leftTabelView;
@property (weak, nonatomic) IBOutlet UITableView *rightTabelView;
//当选中左边cell的时候,记录对应位置的模型
@property(nonatomic,strong) WYCategoryModel *selectLeftModel;
//区域的左边选中模型
@property (nonatomic, strong) WYDistrictModel *selectDistrictLeftModel;

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
    if (self.categoryModelArray) {
        if (tableView == self.leftTabelView) {
            return self.categoryModelArray.count;
        }else{
            return self.selectLeftModel.subcategories.count;
        }
    }else{
        
        //区域数据有值
        
        if (tableView == self.leftTabelView) {
            return self.districtArray.count;
        } else {
            
            //为了显示右边数据 --> 需要先知道左边选中了谁 --> 实现表格的选中方法, 记录左边的数据
            return  self.selectDistrictLeftModel.subdistricts.count;
        }

    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = nil;
    if (self.categoryModelArray) {
        
        if (tableView == self.leftTabelView) {
            
            //左边表格
            WYDropdownLeftTableViewCell *cell = [WYDropdownLeftTableViewCell dropdownLeftTableViewCellWithTableView:tableView];
            
            //取到对应位置的模型
            WYCategoryModel *model = self.categoryModelArray[indexPath.row];
            
            //设置label
            cell.textLabel.text = model.name;
            //设置image
            cell.imageView.image = [UIImage imageNamed:model.icon];
            cell.imageView.highlightedImage = [UIImage imageNamed:model.highlighted_icon];
            //设置cell的附属视图(小箭头)
            //当是左边第一个cell的时候,我们不需要箭头
            if (model.subcategories.count == 0) {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }else{
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
            }
            
            return cell;
            
        }else{
            
            //左边表格
            WYDropdownRightTableViewCell *cell = [WYDropdownRightTableViewCell dropdownRightTableViewCellWithTableView:tableView];
            
            //我们需要知道哪个cell被点击了,右边tabelview的数据就一个array
            
            NSArray *rightArray = self.selectLeftModel.subcategories;
            
            //设置内容
            cell.textLabel.text = rightArray[indexPath.row];
            
            return cell;
        }
    }else{
        
        if (tableView == self.leftTabelView) {
            
            //左边表格
            WYDropdownLeftTableViewCell *cell = [WYDropdownLeftTableViewCell dropdownLeftTableViewCellWithTableView:tableView];
            
            //1. 显示Label数据
            WYDistrictModel *districtModel = self.districtArray[indexPath.row];
            cell.textLabel.text = districtModel.name;
            
            
            //2. 设置cell的附属视图
            if (districtModel.subdistricts.count == 0) {
                cell.accessoryType = UITableViewCellAccessoryNone;
            } else {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            
            return cell;
            
        } else {
            
            //右边表格
            WYDropdownRightTableViewCell *cell = [WYDropdownRightTableViewCell dropdownRightTableViewCellWithTableView:tableView];
            
            // 为了显示右边的数据  --> 需要知道左边选中了谁 --> tableView的选中方法中记录
            NSArray *districtArray = self.selectDistrictLeftModel.subdistricts;
            
            cell.textLabel.text = districtArray[indexPath.row];
            
            return cell;
        }

        
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.categoryModelArray) {
        //判断当选中的是左边的tabelview的cell的时候,记录对应的模型,让右边tabelview刷新数据
        if (tableView == self.leftTabelView) {
            self.selectLeftModel = self.categoryModelArray[indexPath.row];
        }
    }else{
        
        if (tableView == self.leftTabelView) {
            
            //1. 记录左边选中的模型
            self.selectDistrictLeftModel = self.districtArray[indexPath.row];
            
        }

    }
    //右边tabelview刷新数据
    [self.rightTabelView reloadData];

}


@end
