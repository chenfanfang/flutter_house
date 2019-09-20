//
//  FlutterMapView.m
//  flutter_native_bridge
//
//  Created by chenfanfang on 2019/9/20.
//

#import "FlutterMapView.h"

@interface FlutterMapView ()

@property (nonatomic, assign) CGRect frame;

@property (nonatomic, assign) int64_t viewId;

@property (nonatomic, strong) id args;

@property (nonatomic, strong) UIView *mapView;

@end

@implementation FlutterMapView


- (NSObject<FlutterPlatformView> *)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    
    if (self = [super init]) {
        _frame = frame;
        _viewId = viewId;
        _args = args;
        
        _mapView = [[UIView alloc] init];
        _mapView.backgroundColor = [UIColor purpleColor];
        _mapView.frame = CGRectMake(0, 0, 100, 100);
    }
    return self;
}

- (UIView *)view {
    
    return _mapView;
}

@end
