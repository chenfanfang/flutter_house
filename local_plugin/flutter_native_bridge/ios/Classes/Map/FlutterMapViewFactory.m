//
//  FlutterMapViewFactory.m
//  flutter_native_bridge
//
//  Created by chenfanfang on 2019/9/20.
//

#import "FlutterMapViewFactory.h"




#import "FlutterMapView.h"

@implementation FlutterMapViewFactory

- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    
    FlutterMapView *mapView = [[FlutterMapView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args];
    return mapView;
    
}

@end
