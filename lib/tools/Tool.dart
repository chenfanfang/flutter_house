import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';

import 'ToolScreen.dart';

class DeviceInfo {
  String system;
}

//获取随机色
Color randomColor() {
  int red = Random().nextInt(255);
  int green = Random().nextInt(255);
  int blue = Random().nextInt(255);
  Color color = Color.fromARGB(255, red, green, blue);
  return color;
}

bool isAndroid() {
  return Platform.isAndroid;
}

bool isIos() {
  return Platform.isIOS;
}

bool isIphoneX() {
  if (isAndroid()) return false;

  if ((screenWidth == 375 && screenHeight == 812) ||
      (screenWidth == 812 && screenHeight == 375) ||
      (screenWidth == 414 && screenHeight == 896) ||
      (screenWidth == 896 && screenHeight == 414)) {
    return true;
  }
  return false;
}

//设备信息

//device_info : ^0.2.0
