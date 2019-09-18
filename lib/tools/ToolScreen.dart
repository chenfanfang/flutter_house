import 'package:flutter/material.dart';



const double uiWidth = 375.0;
const double uiHeight = 667.0;
double screenWidth;
double screenHeight;
double pxRatio;
MediaQueryData mediaQuery;

// 初始化UI设计师基于怎样的屏幕尺寸来设计的
// 一定在MaterialApp的home中的页面设置(即入口文件，只需设置一次),以保证在每次使用之前设置好了适配尺寸:
void initScreen(
    {@required BuildContext context}) {

  if(mediaQuery == null) {
    mediaQuery = MediaQuery.of(context);
    pxRatio = mediaQuery.size.width / uiWidth;
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    print('screenWidth:$screenWidth  screenHeight:$screenHeight');
  }
}

//适配像素，基于屏幕宽度
double fitPx(double px) {

  return pxRatio * px;
}


double fitFontSize(double fontSize) {
  return pxRatio * fontSize;
}
