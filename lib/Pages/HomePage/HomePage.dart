import 'package:flutter/material.dart';

//widget
import 'Widget/HomeAppBarWidget.dart';
import 'Widget/HomeChooseItemWidget.dart';
import 'Widget/HomeBannerWidget.dart';
import 'Widget/HomeRecommendWidget.dart';

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
          ],
        ),
      )
    );
  }
}
