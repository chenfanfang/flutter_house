#import "FlutterNativeBridgePlugin.h"

#import "FlutterMapView.h"
#import "FlutterMapViewFactory.h"

@implementation FlutterNativeBridgePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_native_bridge"
            binaryMessenger:[registrar messenger]];
  FlutterNativeBridgePlugin* instance = [[FlutterNativeBridgePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    
    FlutterMapViewFactory *mapViewFactory = [[FlutterMapViewFactory alloc] init];
    [registrar registerViewFactory:mapViewFactory withId:@"FlutterMapView"];
    
    NSString *message = [NSString stringWithFormat:@"%@",mapViewFactory];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"FlutterMapView" message:message delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    
    [alertView show];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
