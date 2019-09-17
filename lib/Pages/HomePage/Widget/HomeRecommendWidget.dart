import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

//降价急售、笋盘特惠、低价严选、今日必看
class HomeRecommendWidget extends StatefulWidget {
  @override
  _HomeRecommendWidgetState createState() => _HomeRecommendWidgetState();
}

class _HomeRecommendWidgetState extends State<HomeRecommendWidget> {
  List<Map> dataList = [
    {
      'title': '降价急售',
      'list': [
        {'message1': '特价房源', 'message2': '仅剩4套', 'message3': '最高省25万'},
        {'message1': '限时特价', 'message2': '疯降10万', 'message3': '可领5万红包'},
        {'message1': '超值好房', 'message2': '劲省45万', 'message3': '省下一辆车'},
      ]
    },
    {
      'title': '笋盘特惠',
      'list': [
        {'message1': '劲爆三房', 'message2': '均价3字头', 'message3': '买房一步到位'},
        {'message1': '改善好房', 'message2': '大阳台三房', 'message3': '全家住一起'},
        {'message1': '超值好房', 'message2': '劲省45万', 'message3': '省下一辆车'},
      ]
    },
    {
      'title': '低价严选',
      'list': [
        {'message1': '好便宜', 'message2': '住4号线旁', 'message3': '2-4房任选'},
        {'message1': '普通3房', 'message2': '壹方城上盖', 'message3': '450万起'},
        {'message1': '抢枪枪', 'message2': '99好房季', 'message3': '立省69万'},
      ]
    },
    {
      'title': '今日必看',
      'list': [
        {'message1': '特价房源', 'message2': '仅剩4套', 'message3': '最高省25万'},
        {'message1': '限时特价', 'message2': '疯降10万', 'message3': '可领5万红包'},
        {'message1': '超值好房', 'message2': '劲省45万', 'message3': '省下一辆车'},
      ]
    },
  ];
  int selectedIndex = 0;

  List<Widget> _chooseItemsBuilder() {
    return List.generate(this.dataList.length, (int index) {
      String title = this.dataList[index]['title'];
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                this.selectedIndex = index;
              });
            },
            child: Container(
              height: fitPx(30),
              width: fitPx(70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(fitPx(2))),
                border: Border.all(
                    color:
                        this.selectedIndex == index ? Colors.red : Colors.grey),
                color: this.selectedIndex == index ? Colors.red : Colors.white,
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: fitPx(10)),
              child: Text(
                title,
                style: TextStyle(
                  color:
                      this.selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

//  List<Widget> _messageItemsBuilder() {
//    Map messageMap = this.dataList[this.selectedIndex];
//    return List.generate(3, (int index){
//
//      return
//    });
//  }

  Widget _sliverGridbuilder(double containerWidth, double margin) {
    List<Map> dataList = this.dataList[this.selectedIndex]['list'];
    double eachWidth = (containerWidth - margin * 2.0) / 3.0 - 0.01;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(dataList.length, (int index) {
        Map itemData = dataList[index];
        return Container(
          padding: EdgeInsets.only(left: fitPx(10)),
          margin:
              EdgeInsets.only(right: index != dataList.length - 1 ? margin : 0),
          color: Colors.grey.withAlpha(20),
          width: eachWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                itemData['message1'],
                style: TextStyle(color: Colors.red, fontSize: fitFontSize(10)),
              ),
              Text(
                itemData['message2'],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),
              ),
              Text(itemData['message3'],style: TextStyle(fontSize: fitFontSize(10)),),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: fitPx(10)),
      padding: EdgeInsets.only(left: fitPx(20), right: fitPx(20)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: fitPx(40),
            child: Row(
              children: _chooseItemsBuilder(),
            ),
          ),
          Container(
            height: fitPx(60),
            margin: EdgeInsets.only(top: fitPx(0)),
            child: _sliverGridbuilder(screenWidth - fitPx(40), fitPx(5)),
          )
        ],
      ),
    );
  }
}
