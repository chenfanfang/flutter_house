import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

class HomeBannerWidget extends StatelessWidget {
  Widget pictureBannerWidget = Container(
    padding: EdgeInsets.all(fitPx(20)),
    child: Image.asset('images/99banner.png'),
  );

  //指数信息
  Widget IndexMessageWidget = Container(
    height: fitPx(200),
    child: Container(
      color: Colors.orange,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: fitPx(20)),
            height: fitPx(120),
            alignment: Alignment.topLeft,
            color: Colors.blue,
            child: SizedBox(
              height: fitPx(50),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: fitPx(30)),
                    child: Text(
                      '贝壳\n指数',
                      style: TextStyle(
                        fontSize: fitFontSize(17),
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: fitPx(20)),
                    child: IndexDetailMessageWidget(
                      messageList: [
                        {'title': '城市', 'message': '  深圳.57368/平，昨日成交92套'},
                        {'title': '附近', 'message': '  80306/平，向南瑞丰花园，你24套....'}
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: fitPx(40),
            right: fitPx(40),
            bottom: fitPx(0),
            height: fitPx(115),
            child: Container(
              color: Colors.purple,
              child: Column(

              ),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        pictureBannerWidget,
        IndexMessageWidget,
      ],
    );
  }
}

class IndexDetailMessageWidget extends StatelessWidget {
  final List<Map> messageList;

  IndexDetailMessageWidget({this.messageList});

  Widget _messageWidgetBuilder(String title, String message) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style:
                TextStyle(backgroundColor: Colors.black, color: Colors.white)),
        TextSpan(
          text: message,
          style: TextStyle(color: Colors.white),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _messageWidgetBuilder(
            this.messageList.first['title'], this.messageList.first['message']),
        _messageWidgetBuilder(
            this.messageList.last['title'], this.messageList.last['message']),
      ],
    );
  }
}
