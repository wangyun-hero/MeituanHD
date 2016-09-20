//
//  WYMapViewController.m
//  MeituanHD
//
//  Created by 王云 on 16/9/21.
//  Copyright © 2016年 王云. All rights reserved.
//

#import "WYMapViewController.h"
#import <MapKit/MapKit.h>
#import "DPAPI.h"

@interface WYMapViewController ()<MKMapViewDelegate,DPRequestDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic,strong) CLLocationManager *locationManager;


@end

@implementation WYMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //定位用户位置
    //1 需要授权
    //2 调用跟踪用户的方法
    
    //1 创建位置管理器
    self.locationManager = [CLLocationManager new];
    //2 授权(ios8 以后必须写)
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        //当用户使用的时候进行定位
        [self.locationManager requestWhenInUseAuthorization];
        
    }
    //3 跟踪用户的位置
    /**
     MKUserTrackingModeNone =       不跟随
     MKUserTrackingModeFollow       跟随用户位置
     MKUserTrackingModeFollowWithHeading  跟随用户位置及头部方向
     */
    self.mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    //设置地图代理
    self.mapView.delegate = self;
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    //region: 范围, 包括了经纬度及显示跨度
    /**
     typedef struct {
     CLLocationCoordinate2D center;  中心点经纬度 --> 坐标
     MKCoordinateSpan span;          显示跨度
     } MKCoordinateRegion;
     */
    
    //mapView.region.center.latitude;   纬度
    //mapView.region.center.longitude;  经度
    NSLog(@"%f %f",mapView.region.center.latitude,mapView.region.center.longitude);
    DPAPI *api = [DPAPI new];
    //参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //根据文档传参数
    params[@"latitude"] = @(mapView.region.center.latitude);
    params[@"longitude"] = @(mapView.region.center.longitude);
    // 按照距离最近, 显示40条数据
    params[@"sort"] = @(7);
    
    
    // 发送请求
    [api requestWithURL:@"v1/business/find_businesses" params:params delegate:self];
    
}

// 代理方法 请求成功
-(void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result
{
    NSLog(@"%@",request);
}

// 请求失败
-(void)request:(DPRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
