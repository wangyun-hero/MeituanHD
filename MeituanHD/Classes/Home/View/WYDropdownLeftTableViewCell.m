//
//  WYDropdownLeftTableViewCell.m
//  MeituanHD
//
//  Created by 王云 on 16/9/15.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYDropdownLeftTableViewCell.h"

@implementation WYDropdownLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/** 提供类方法, 快速创建左边cell*/
+ (instancetype)dropdownLeftTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"leftCell";
    
    WYDropdownLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[WYDropdownLeftTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        //在创建cell的时候, 设置默认背景
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
        
        //设置选中背景
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
