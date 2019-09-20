//
//  FlutterMapView.h
//  flutter_native_bridge
//
//  Created by chenfanfang on 2019/9/20.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


@interface FlutterMapView : NSObject <FlutterPlatformView>

- (NSObject <FlutterPlatformView> *)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args;

@end


