//
//  WYDropdownRightTableViewCell.m
//  MeituanHD
//
//  Created by 王云 on 16/9/15.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYDropdownRightTableViewCell.h"

@implementation WYDropdownRightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/** 提供类方法, 快速创建右边cell*/
+ (instancetype)dropdownRightTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"rightCell";
    
    WYDropdownRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[WYDropdownRightTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        //在创建cell的时候, 设置默认背景
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
        
        //设置选中背景
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
    }
    
    return cell;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
