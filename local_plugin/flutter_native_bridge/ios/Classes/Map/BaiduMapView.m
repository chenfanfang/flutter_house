//
//  BaiduMapView.m
//  flutter_native_bridge
//
//  Created by chenfanfang on 2019/9/20.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <BaiduMapAPI_Cloud/BMKCloudSearchComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>
#import <BaiduMapAPI_Utils/BMKUtilsComponent.h>
#import <BMKLocationkit/BMKLocationComponent.h>

#define widthScale ([UIScreen mainScreen].bounds.size.width/375.0f)
#define heightScale ([UIScreen mainScreen].bounds.size.height/667.0f)
#define BMKMapVersion [NSString stringWithFormat:@"百度地图iOS SDK %@", BMKGetMapApiVersion()]
//屏幕宽度
#define KScreenWidth  ([UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define KScreenHeight ([UIScreen mainScreen].bounds.size.height)
//状态栏高度
#define KStatuesBarHeight  ([UIApplication sharedApplication].statusBarFrame.size.height)
//导航栏高度
#define KNavigationBarHeight 44.0
//导航栏高度+状态栏高度
#define kViewTopHeight (KStatuesBarHeight + KNavigationBarHeight)
//iphoneX适配差值
#define KiPhoneXSafeAreaDValue ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)

#define COLOR(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kHeight_SegMentBackgroud  60


#import "BaiduMapView.h"




@interface BaiduMapView ()<BMKMapViewDelegate,BMKLocationManagerDelegate, BMKPoiSearchDelegate>

@property (nonatomic, strong) BMKMapView *mapView;

@property (nonatomic, strong) BMKUserLocation *userLocation; //当前位置对象

@property (nonatomic, strong) BMKLocationManager *locationManager;

@property (nonatomic, strong) BMKPointAnnotation *annotation; //当前界面的标注

@end

@implementation BaiduMapView

- (void)showMapView {
    
    [self addSubview:self.mapView];
    [self.locationManager startUpdatingLocation];
}



//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [_mapView viewWillAppear];
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [_mapView viewWillDisappear];
//}

//=================================================================
//                           懒加载
//=================================================================
#pragma mark - 懒加载

- (BMKMapView *)mapView {
    if (_mapView == NULL) {
        _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
        _mapView.zoomLevel = 20;
        _mapView.delegate = self;
        //_mapView.showsUserLocation = YES;
    }
    return _mapView;
}

-(BMKLocationManager *)locationManager
{
    if (!_locationManager)
    {
        _locationManager = [[BMKLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        _locationManager.distanceFilter = kCLLocationAccuracyBestForNavigation;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        // YES的话是可以进行后台定位的，但需要项目配置，否则会报错，具体参考开发文档
        _locationManager.allowsBackgroundLocationUpdates = NO;
        _locationManager.locationTimeout = 10;
        _locationManager.reGeocodeTimeout = 10;
    }
    return _locationManager;
}


//=================================================================
//                           BMKMapViewDelegate
//=================================================================
#pragma mark - BMKMapViewDelegate

/**
 根据anntation生成对应的annotationView
 
 @param mapView 地图View
 @param annotation 指定的标注
 @return 生成的标注View
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    static NSString *const annotationViewIdentifier = @"annotationViewIdentifier";
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        /**
         根据指定标识查找一个可被复用的标注，用此方法来代替新创建一个标注，返回可被复用的标注
         */
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewIdentifier];
        if (!annotationView) {
            /**
             初始化并返回一个annotationView
             
             @param annotation 关联的annotation对象
             @param reuseIdentifier 如果要重用view，传入一个字符串，否则设为nil，建议重用view
             @return 初始化成功则返回annotationView，否则返回nil
             */
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewIdentifier];
            //annotationView显示的图片，默认是大头针
            //annotationView.image = nil;
            /**
             默认情况下annotationView的中心点位于annotation的坐标位置，可以设置centerOffset改变
             annotationView的位置，正的偏移使annotationView朝右下方移动，负的朝左上方，单位是像素
             */
            annotationView.centerOffset = CGPointMake(0, 0);
            /**
             默认情况下, 弹出的气泡位于annotationView正中上方，可以设置calloutOffset改变annotationView的
             位置，正的偏移使annotationView朝右下方移动，负的朝左上方，单位是像素
             */
            annotationView.calloutOffset = CGPointMake(0, 0);
            //是否显示3D效果，标注在地图旋转和俯视时跟随旋转、俯视，默认为NO
            annotationView.enabled3D = NO;
            //是否忽略触摸时间，默认为YES
            annotationView.enabled = YES;
            /**
             开发者不要直接设置这个属性，若设置，需要在设置后调用BMKMapView的-(void)mapForceRefresh;方法
             刷新地图，默认为NO，当annotationView被选中时为YES
             */
            annotationView.selected = NO;
            //annotationView被选中时，是否显示气泡（若显示，annotation必须设置了title），默认为YES
            annotationView.canShowCallout = YES;
            /**
             显示在气泡左侧的view(使用默认气泡时，view的width最大值为32，
             height最大值为41，大于则使用最大值）
             */
            annotationView.leftCalloutAccessoryView = nil;
            /**
             显示在气泡右侧的view(使用默认气泡时，view的width最大值为32，
             height最大值为41，大于则使用最大值）
             */
            annotationView.rightCalloutAccessoryView = nil;
            /**
             annotationView的颜色： BMKPinAnnotationColorRed，BMKPinAnnotationColorGreen，
             BMKPinAnnotationColorPurple
             */
            annotationView.pinColor = BMKPinAnnotationColorRed;
            //设置从天而降的动画效果
            annotationView.animatesDrop = YES;
            //当设为YES并实现了setCoordinate:方法时，支持将annotationView在地图上拖动
            annotationView.draggable = YES;
            //当前view的拖动状态
            //annotationView.dragState;
            
            annotationView.image = [UIImage imageNamed:@"美食"];
        }
        return annotationView;
    }
    return nil;
}


//=================================================================
//                           BMKLocationManagerDelegate
//=================================================================
#pragma mark - BMKLocationManagerDelegate


//由于以下代理方法中分别且仅只返回heading或location信息，请开发者务必将该对象定义为全局类型，避免在以下回调用使用局部的BMKUserLocation对象，导致出现定位显示错误位置的情况。
// 定位SDK中，方向变更的回调
- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateHeading:(CLHeading *)heading {
    if (!heading) {
        return;
    }
    if (!self.userLocation) {
        self.userLocation = [[BMKUserLocation alloc] init];
    }
    self.userLocation.heading = heading;
    [self.mapView updateLocationData:self.userLocation];
}

// 定位SDK中，位置变更的回调
- (void)BMKLocationManager:(BMKLocationManager *)manager didUpdateLocation:(BMKLocation *)location orError:(NSError *)error {
    if (error) {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
    }
    if (!location) {
        return;
    }
    if (!self.userLocation) {
        self.userLocation = [[BMKUserLocation alloc] init];
    }
    self.userLocation.location = location.location;
    [self.mapView updateLocationData:self.userLocation];
    [self.mapView setCenterCoordinate:self.userLocation.location.coordinate animated:YES];
    
    
}

//=================================================================
//                           BMKPoiSearchDelegate
//=================================================================
#pragma mark - BMKPoiSearchDelegate
/**
 *返回POI搜索结果
 *@param searcher 搜索对象
 *@param poiResult 搜索结果列表
 *@param errorCode 错误码，@see BMKSearchErrorCode
 */
- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPOISearchResult*)poiResult errorCode:(BMKSearchErrorCode)errorCode{
    //BMKSearchErrorCode错误码，BMK_SEARCH_NO_ERROR：检索结果正常返回
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        //在此处理正常结果
        //        NSLog(@"检索结果返回成功：%@",poiResult.poiInfoList);
        for (BMKPoiInfo *info in poiResult.poiInfoList) {
            
            
            BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
            annotation.coordinate = info.pt;
            //设置标注的标题
            annotation.title = info.name;
            
            [_mapView addAnnotation:annotation];
        }
    }
    else if (errorCode == BMK_SEARCH_AMBIGUOUS_KEYWORD) {
        NSLog(@"检索词有歧义");
    } else {
        NSLog(@"其他检索结果错误码");
    }
}



//=================================================================
//                           事件处理
//=================================================================
#pragma mark - 事件处理

- (void)btnClick {
    
    BMKPoiSearch *poiSearch = [[BMKPoiSearch alloc] init];
    
    poiSearch.delegate = self;
    
    //初始化请求参数类BMKNearbySearchOption的实例
    BMKPOINearbySearchOption *nearbyOption = [[BMKPOINearbySearchOption alloc] init];
    //检索关键字，必选
    nearbyOption.keywords = @[@"小吃"];
    //检索中心点的经纬度，必选
    nearbyOption.location = self.userLocation.location.coordinate;
    //检索半径，单位是米。
    nearbyOption.radius = 1000;
    //检索分类，可选。
    nearbyOption.tags = @[@"美食"];
    //是否严格限定召回结果在设置检索半径范围内。默认值为false。
    nearbyOption.isRadiusLimit = NO;
    //POI检索结果详细程度
    //nearbyOption.scope = BMK_POI_SCOPE_BASIC_INFORMATION;
    //检索过滤条件，scope字段为BMK_POI_SCOPE_DETAIL_INFORMATION时，filter字段才有效
    //nearbyOption.filter = filter;
    //分页页码，默认为0，0代表第一页，1代表第二页，以此类推
    nearbyOption.pageIndex = 0;
    //单次召回POI数量，默认为10条记录，最大返回20条。
    nearbyOption.pageSize = 20;
    
    
    BOOL flag = [poiSearch poiSearchNearBy:nearbyOption];
    if (flag) {
        NSLog(@"POI周边检索成功");
    } else {
        NSLog(@"POI周边检索失败");
    }
}

@end
