import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

//widget
import 'PublicWidget/HomeDividingLineWidget.dart';
import 'PublicWidget/HomeHouseItemWidget.dart';

//二手房
class HomeSecondHandHouseWidget extends StatelessWidget {
  final List<Map> dataList = [
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

  Widget _titleWidgetBuilder(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: fitFontSize(20)),
    );
  }

  //专属二手房

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: fitPx(20), right: fitPx(20), top: fitPx(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _titleWidgetBuilder('专属二手房源'),
          SizedBox(
            height: fitPx(10),
          ),
          ExclusiveSecondHandHouseWidget(),
          SizedBox(
            height: fitPx(20),
          ),
          _titleWidgetBuilder('为你推荐二手房'),
          SizedBox(
            height: fitPx(20),
          ),
          RecommendSecondHandHouseWidget(),
          SizedBox(
            height: fitPx(20),
          ),
          HomeDividingLineWidget(),
          Column(
            children: List.generate(
              this.dataList.length,
              (int index) {
                return HomeHouseItemWidget(
                  data: this.dataList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

//专属二手房
class ExclusiveSecondHandHouseWidget extends StatelessWidget {
  Widget _houseItemBuilder(
      {String message, String icon1Name, String icon2Name}) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(fitPx(4)),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Image.asset(icon1Name),
                  ),
                ),
                SizedBox(
                  width: fitPx(3),
                ),
                Expanded(
                  child: Container(
                    child: Image.asset(icon2Name),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: fitPx(10),
          ),
          Text(
            message,
            style: TextStyle(
                fontSize: fitFontSize(14), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: _houseItemBuilder(
                message: '三代同堂,华强南优选房',
                icon1Name: 'images/banner专属二手房1.png',
                icon2Name: 'images/banner专属二手房2.png'),
          ),
          SizedBox(
            width: fitPx(10),
          ),
          Expanded(
            child: _houseItemBuilder(
                message: '三代同堂,华强南优选房',
                icon1Name: 'images/banner专属二手房3.png',
                icon2Name: 'images/banner专属二手房4.png'),
          ),
        ],
      ),
    );
  }
}

//为你推荐二手房

class RecommendSecondHandHouseWidget extends StatelessWidget {
  final List<Map> dataList = [
    {'title': '捡漏地铁房', 'subTitle': '最高降15万'},
    {'title': '温馨三房', 'subTitle': '近学校近地铁'},
    {'title': '高带看笋盘', 'subTitle': '300万内'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: List.generate(this.dataList.length, (int index) {
          double margin = fitPx(10);
          Map dataMap = this.dataList[index];
          String title = dataMap['title'];
          String subTitle = dataMap['subTitle'];
          Color color;
          if (index == 0) {
            color = Colors.red;
          } else if (index == 1) {
            color = Colors.yellow;
          } else {
            color = Colors.orange;
          }

          return Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  right: index != this.dataList.length - 1 ? margin : 0),
              padding: EdgeInsets.only(top: fitPx(10), bottom: fitPx(10)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(fitPx(4))),
                color: color,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: fitFontSize(13),
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: fitFontSize(11),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
