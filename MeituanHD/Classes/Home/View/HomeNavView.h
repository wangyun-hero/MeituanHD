//
//  HomeNavView.h
//  MeituanHD
//
//  Created by 王云 on 16/9/14.
//  Copyright © 2016年 王云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeNavView : UIControl

/** 提供类方法, 快速创建View*/
+ (instancetype)homeNavView;

/**
 1. .h中提供按钮属性, 供外界调用
 2. .h中提供方法, 让外界写好方法, 传到本类
 3. 自定义控件写法: 将View改成UIControl
 */


@end
