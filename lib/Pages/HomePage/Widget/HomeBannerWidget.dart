import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

class HomeBannerWidget extends StatefulWidget {
  @override
  _HomeBannerWidgetState createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  Widget pictureBannerWidget = Container(
    padding: EdgeInsets.all(fitPx(20)),
    child: Image.asset('images/99banner.png'),
  );

  //指数信息
  Widget IndexMessageWidget = Container(
    height: fitPx(220),
    child: Container(
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
            //height: fitPx(130),
            child: Container(
              color: Colors.transparent,
              child: HelpFindHouseAndMyHouseWidget(),
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

//指数详细信息    比如:城市   深圳57368/平........
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

//帮我找房、我的房子
class HelpFindHouseAndMyHouseWidget extends StatefulWidget {
  @override
  _HelpFindHouseAndMyHouseWidgetState createState() =>
      _HelpFindHouseAndMyHouseWidgetState();
}

class _HelpFindHouseAndMyHouseWidgetState
    extends State<HelpFindHouseAndMyHouseWidget> {
  int selectedIndex = 0;
  List<Map> messages = [
    {'title': '全城经纪人为您线上找房', 'subTitle': '定制推荐/极速相应/专属推荐'},
    {'title': '查看房屋估值走势', 'subTitle': '随时掌握小区均价与邻里动态'}
  ];

  String getTitle() {
    return this.messages[this.selectedIndex]['title'];
  }

  String getSubTitle() {
    return this.messages[this.selectedIndex]['subTitle'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(fitPx(6))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: fitPx(5),
          ),
          SizedBox(
            height: fitPx(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    if (this.selectedIndex == 0) return;

                    setState(() {
                      this.selectedIndex = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: this.selectedIndex == 0
                                  ? Colors.grey
                                  : Colors.transparent)),
                    ),
                    margin: EdgeInsets.only(left: fitPx(20)),
                    height: fitPx(40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '帮我找房',
                      style: TextStyle(
                          color: this.selectedIndex == 0
                              ? Colors.black
                              : Colors.grey,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (this.selectedIndex == 1) return;

                    setState(() {
                      this.selectedIndex = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: this.selectedIndex == 1
                                  ? Colors.grey
                                  : Colors.transparent)),
                    ),
                    margin: EdgeInsets.only(left: fitPx(20)),
                    height: fitPx(40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '我的房子',
                      style: TextStyle(
                          color: this.selectedIndex == 1
                              ? Colors.black
                              : Colors.grey,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: fitPx(2),
            child: Container(
              color: Colors.grey.withAlpha(30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: fitPx(20), top: fitPx(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.getTitle(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: fitFontSize(15)),
                ),
                Text(
                  this.getSubTitle(),
                  style: TextStyle(fontSize: fitFontSize(11)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: fitPx(10)),
            height: fitPx(2),
            color: Colors.grey.withAlpha(30),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                this.selectedIndex == 0 ? '立即找房' : '立即查看',
                style: TextStyle(color: Colors.blue, fontSize: fitPx(15)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
