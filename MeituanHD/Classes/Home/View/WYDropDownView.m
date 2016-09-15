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
    return self.categoryModelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    //取到对应位置的模型
    WYCategoryModel *model = self.categoryModelArray[indexPath.row];
    //设置内容
    cell.textLabel.text = model.name;
    return cell;
}


@end
