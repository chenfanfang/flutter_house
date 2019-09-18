import 'package:flutter/material.dart';
import 'dart:async';

//widget
import 'Widget/HomeAppBarWidget.dart';
import 'Widget/HomeChooseItemWidget.dart';
import 'Widget/HomeBannerWidget.dart';
import 'Widget/HomeRecommendWidget.dart';
import 'Widget/HomeHotThemeWidget.dart';
import 'Widget/HomeInformationExpressWidget.dart';
import 'Widget/HomeActivityAreaWidget.dart';
import 'Widget/HomeSecondHandHouseWidget.dart';

import 'Widget/PublicWidget/HomeHouseItemWidget.dart';

//easy_refresh
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> dataList = [
    {
      'icon': 'images/banner为您推荐用图1.png',
      'title': '宝安壹方城 2室2厅 北',
      'subTitle': '宝安中心 壹方城 | 33层',
      'flags': ['必看好房', '地铁沿线', '公交直达'],
      'price': '242万',
      'area': '70000元/平'
    },
    {
      'icon': 'images/banner为您推荐用图1.png',
      'title': '宝安壹方城 2室2厅 北',
      'subTitle': '宝安中心 壹方城 | 33层',
      'flags': ['必看好房', '地铁沿线', '公交直达'],
      'price': '242万',
      'area': '70000元/平'
    },
    {
      'icon': 'images/banner为您推荐用图1.png',
      'title': '宝安壹方城 2室2厅 北',
      'subTitle': '宝安中心 壹方城 | 33层',
      'flags': ['必看好房', '地铁沿线', '公交直达'],
      'price': '242万',
      'area': '70000元/平'
    }
  ];

  void addMoreData() {

    for(int i = 0; i < 10; i++) {
      Map data = {
        'icon': 'images/banner为您推荐用图1.png',
        'title': '宝安壹方城 2室2厅 北',
        'subTitle': '宝安中心 壹方城 | 33层',
        'flags': ['必看好房', '地铁沿线', '公交直达'],
        'price': '242万',
        'area': '70000元/平'
      };
      this.dataList.add(data);
    }
  }

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  List<Widget> _fixWidges = [
    HomeChooseItemWidget(),
    HomeBannerWidget(),
    HomeRecommendWidget(),
    HomeHotThemeWidget(),
    HomeInformationExpressWidget(),
    HomeActivityAreaWidget(),
    HomeSecondHandHouseWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBarWidget(),
      body: EasyRefresh(
        key: _easyRefreshKey,
        limitScroll: true,
        refreshHeader: MaterialHeader(key: _headerKey),
        refreshFooter: MaterialFooter(key: _footerKey),
        onRefresh: () async {
          //await loadAllHomeData();
        },
        loadMore: () async {
          //await loadHotData();
          setState(() {
            addMoreData();
          });
        },
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index <= 6) {
              return _fixWidges[index];
            }

            return Container(
              padding: EdgeInsets.only(left: fitPx(20), right: fitPx(20)),
              child: HomeHouseItemWidget(
                data: this.dataList[index - this._fixWidges.length],
              ),
            );
          },
          itemCount: this._fixWidges.length + this.dataList.length,
        ),
      ),
    );
  }
}
