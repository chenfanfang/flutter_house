import 'dart:async';

import 'package:flutter/services.dart';

class FlutterNativeBridge {
//  static const MethodChannel _channel =
//      const MethodChannel('flutter_native_bridge');

  static MethodChannel _channel = const MethodChannel('flutter_native_bridge')
    ..setMethodCallHandler(platformCallHandler);

  static Future<dynamic> platformCallHandler(MethodCall call) async {
    print('method name:${call.method}');
  }
  

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}
