//
//  WYDropDownView.m
//  MeituanHD
//
//  Created by 王云 on 16/9/15.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYDropDownView.h"

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

@end
