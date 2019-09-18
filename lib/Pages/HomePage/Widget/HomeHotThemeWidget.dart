import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class HomeHotThemeWidget extends StatelessWidget {
  final List<Map> dataList = [
    {'message1': '大空港利好', 'message2': '宝安学城笋盘', 'icon': '新房.png'},
    {'message1': '300万内', 'message2': '降价两房', 'icon': '海外.png'},
    {'message1': '地铁精装修', 'message2': '450万内', 'icon': '装修.png'}
  ];

  @override
  Widget build(BuildContext context) {
    double mainContainerMarginLeft = fitFontSize(20);
    double mainContainerMarginRight = fitFontSize(20);
    return Container(
      margin: EdgeInsets.only(
          left: mainContainerMarginLeft,
          right: mainContainerMarginRight,
          top: fitPx(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '热门主题',
            style: TextStyle(
              fontSize: fitFontSize(20),
              fontWeight: FontWeight.w700,
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: fitPx(10)),
            height: fitPx(60),
            child: Row(
              children: List.generate(this.dataList.length, (int index) {
                Map itemData = this.dataList[index];
                double marginRight = fitFontSize(10);
                double eachWidth = (screenWidth -
                        mainContainerMarginRight -
                        mainContainerMarginLeft -
                        marginRight * (this.dataList.length - 1)) /
                    this.dataList.length;
                return Container(
                  width: eachWidth,
                  margin: EdgeInsets.only(
                      right:
                          index != this.dataList.length - 1 ? marginRight : 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withAlpha(50)),
                    borderRadius: BorderRadius.all(Radius.circular(fitPx(4))),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: fitPx(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              itemData['message1'],
                              style: TextStyle(
                                  fontSize: fitFontSize(14),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              itemData['message2'],
                              style: TextStyle(fontSize: fitFontSize(12)),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'images/' + itemData['icon'],
                          height: fitPx(30),
                        ),
                      )
                    ],
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
