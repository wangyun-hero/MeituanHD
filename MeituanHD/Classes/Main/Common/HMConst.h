//
//  HMConst.h
//  HMMeiTuanHD19
//
//  Created by heima on 16/9/16.
//  Copyright © 2016年 heima. All rights reserved.
//

// 这里只是对字符串进行定义

//EXTERN : 代表外面的类可以访问
//UIKIT_EXTERN : 用于适配C++语言的 , 建议使用这种写法
//定义字符串, 先写类型, 后面跟 *const. 如果是基本类型, 先写const, 后跟类型
//UIKIT_EXTERN const CGSize



//UIKIT_EXTERN: 自动区分C语言和C++
UIKIT_EXTERN NSString *const HMCityDidChangeNotifacation;
UIKIT_EXTERN NSString *const HMCityNameKey;

// 分类通知
UIKIT_EXTERN NSString *const HMCategoryDidChangeNotifacation;
UIKIT_EXTERN NSString *const HMCategoryModelKey;
UIKIT_EXTERN NSString *const HMCategorySubtitleKey;

// 区域通知
UIKIT_EXTERN NSString *const HMDistrictDidChangeNotifacation;
UIKIT_EXTERN NSString *const HMDistrictModelKey;
UIKIT_EXTERN NSString *const HMDistrictSubtitleKey;

// 排序通知
UIKIT_EXTERN NSString *const HMSortDidChangeNotifacation;
UIKIT_EXTERN NSString *const HMSortModelKey;


