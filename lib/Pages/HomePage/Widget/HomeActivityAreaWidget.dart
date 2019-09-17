import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

//活动专区
class HomeActivityAreaWidget extends StatelessWidget {
  final List<String> icons = ['images/banner海外好房.png', 'images/banner无权代理.png'];

  @override
  Widget build(BuildContext context) {
    double edgeMargin = fitPx(20);
    double margin = fitPx(10);
    double eachItemWidth = (screenWidth - edgeMargin * 2 - margin) / 2.0 - 0.01;

    return Container(
      margin:
          EdgeInsets.only(left: edgeMargin, right: edgeMargin, top: fitPx(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '活动专区',
            style: TextStyle(fontSize: fitPx(20), fontWeight: FontWeight.w700),
          ),
          Container(
            height: fitPx(100),
            child: Row(
              children: List.generate(this.icons.length, (int index) {

                return Container(
                  width: eachItemWidth,
                  margin: EdgeInsets.only(right: index == 0 ? margin : 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new ExactAssetImage(this.icons[index]),

                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
