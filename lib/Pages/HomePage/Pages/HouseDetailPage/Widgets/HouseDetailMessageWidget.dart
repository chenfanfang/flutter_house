import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class HouseDetailMessageWidget extends StatelessWidget {
  final List dataList = [
    [
      {'title': '单价', 'message': '34890元/平'},
      {'title': '挂牌', 'message': '2018.07.07'}
    ],
    [
      {'title': '朝向', 'message': '东南'},
      {'title': '楼层', 'message': '中楼层(共9层)'}
    ],
    [
      {'title': '楼型', 'message': '板塔结合'},
      {'title': '电梯', 'message': '有'}
    ],
    [
      {'title': '装修', 'message': '简装'},
      {'title': '年代', 'message': '2017年建成'}
    ],
    [
      {'title': '用途', 'message': '普通住宅'},
      {'title': '权属', 'message': '商品房'}
    ],
    [
      {'title': '房协编码', 'message': 'U174892843084'}
    ],
    [
      {'title': '小区', 'message': '中海半山溪谷花园(盐田区)'}
    ],
    [
      {'title': '其他', 'message': '产权年限'}
    ],
    [
      {'title': '首付预算', 'message': '咨询经纪人首付,税费...'}
    ],
  ];

  List<Widget> _messageWidgetBuilder() {
    return List.generate(this.dataList.length, (int index) {
      Color messageColor =
          index == this.dataList.length - 1 ? Colors.blue : null;
      List rowDataList = this.dataList[index];

      if (index < this.dataList.length - 3)
        return EachRowMessageWidget(rowDataList, messageColor);

      return InkWell(
        onTap: () {
          print('tap');
        },
        child: Row(
          children: [
            Expanded(
              child: EachRowMessageWidget(rowDataList, messageColor),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Color.fromARGB(255, 150, 150, 150),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: fitPx(10), left: fitPx(20), right: fitPx(20)),
      child: Column(
        children: _messageWidgetBuilder(),
      ),
    );
  }
}

//每行的信息
class EachRowMessageWidget extends StatelessWidget {
  final List dataList;
  final Color messageColor;

  EachRowMessageWidget(this.dataList, this.messageColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: fitPx(5)),
      height: fitPx(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(this.dataList.length, (int index) {
          Map data = dataList[index];
          return Expanded(
            child: MessageItemWidget(
              title: data['title'],
              message: data['message'],
              messageColor: messageColor,
            ),
          );
        }),
      ),
    );
  }
}

class MessageItemWidget extends StatelessWidget {
  final String title;
  final String message;
  final Color messageColor;

  MessageItemWidget({this.title, this.message, this.messageColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            '$title：',
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            '$message',
            style: TextStyle(
                color: this.messageColor != null
                    ? this.messageColor
                    : Colors.black),
          ),
        ],
      ),
    );
  }
}
