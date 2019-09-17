import 'package:flutter/material.dart';

//widget
import 'Widget/HomeAppBarWidget.dart';
import 'Widget/HomeChooseItemWidget.dart';
import 'Widget/HomeBannerWidget.dart';
import 'Widget/HomeRecommendWidget.dart';
import 'Widget/HomeHotThemeWidget.dart';
import 'Widget/HomeInformationExpressWidget.dart';
import 'Widget/HomeActivityAreaWidget.dart';
import 'Widget/HomeSecondHandHouseWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBarWidget(),
//    appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            HomeChooseItemWidget(),
            HomeBannerWidget(),
            HomeRecommendWidget(),
            HomeHotThemeWidget(),
            HomeInformationExpressWidget(),
            HomeActivityAreaWidget(),
            HomeSecondHandHouseWidget(),
          ],
        ),
      )
    );
  }
}
