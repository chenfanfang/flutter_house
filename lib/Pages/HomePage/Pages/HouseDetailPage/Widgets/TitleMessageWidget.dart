import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class TitleMessageWidget extends StatelessWidget {
  final List<String> flags = [
    '必看好房',
    '满两年',
    'VR房源',
    '房主活跃',
  ];

  //标签
  Widget _flagWidgetBuilder() {
    return Container(
      height: fitPx(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                children: List.generate(this.flags.length, (int index) {
                  return FlagWidget(
                    text: this.flags[index],
                    bgColor:
                        index == 0 ? Colors.blue : Colors.grey.withAlpha(60),
                    textColor: index == 0 ? Colors.white : Colors.grey,
                  );
                }),
              ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.public,
                  color: Colors.blue,
                  size: 20,
                ),
                SizedBox(
                  width: fitPx(5),
                ),
                Text(
                  '降价提醒',
                  style: TextStyle(fontSize: fitFontSize(12)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //标题
  Widget _titleWidgetBuilder() {
    return Container(
      margin: EdgeInsets.only(top: fitPx(10)),
      child: Text(
        '中海半山溪谷两房 朝南 高楼层 看房方便 诚心出售',
        style: TextStyle(fontSize: fitPx(18), fontWeight: FontWeight.bold),
      ),
    );
  }

  //优惠信息
  Widget _discountsMessageWidgetBuilder() {
    return Container(
      margin: EdgeInsets.only(top: fitPx(10)),
      height: fitPx(40),
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withAlpha(40),
        borderRadius: BorderRadius.all(Radius.circular(fitPx(2))),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: fitPx(25),
                  height: fitPx(25),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: fitPx(10), right: fitPx(10)),
                  decoration: BoxDecoration(color: Colors.pink),
                  child: Text(
                    '惠',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  '99好房季.抽最高5万购房津贴',
                  style: TextStyle(
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: fitPx(5)),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _houseMessageWidgetBuilder() {
    return Container(
      margin: EdgeInsets.only(top: fitPx(10)),
      child: Row(
        children: <Widget>[
          Expanded(
              child: MessageItemWidget(
            title: '售价',
            message: '260万',
          )),
          VerticalLineWidget(),
          Expanded(
            child: MessageItemWidget(
              title: '房型',
              message: '2室1厅',
            ),
          ),
          VerticalLineWidget(),
          Expanded(
            child: MessageItemWidget(
              title: '建筑面积',
              message: '74.52平方',
            ),
          ),
        ],
      ),
    );
  }

  //VR 入口

  Widget _vrEntranceWidgetBuilder() {
    return Container(
      margin: EdgeInsets.only(top: fitPx(10)),
      height: fitPx(40),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.book,
              color: Colors.blue,
              
              size: fitPx(15),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: fitPx(10)),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'VR语言带看',
                  style: TextStyle(
                    fontSize: fitPx(14),
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '   无需奔走，专人答疑',
                  style: TextStyle(
                    fontSize: fitPx(10),
                    color: Colors.black,
                  ),
                )
              ])),
            ),
          ),
          Container(
            child: OutlineButton(
              child: Text('立即带看'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: fitPx(10), left: fitPx(20), right: fitPx(20)),
      child: Column(
        children: <Widget>[
          _flagWidgetBuilder(),
          _titleWidgetBuilder(),
          _discountsMessageWidgetBuilder(),
          _houseMessageWidgetBuilder(),
          _vrEntranceWidgetBuilder(),
        ],
      ),
    );
  }
}

class FlagWidget extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  FlagWidget({
    this.text,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fitPx(17),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: this.bgColor,
        borderRadius: BorderRadius.all(Radius.circular(fitPx(2))),
      ),
      padding: EdgeInsets.only(left: fitPx(5), right: fitPx(5)),
      margin: EdgeInsets.only(right: fitPx(10)),
      child: Text(
        this.text,
        style: TextStyle(
          color: this.textColor,
          fontSize: fitFontSize(10),
        ),
      ),
    );
  }
}

//竖线（分割线）
class VerticalLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: fitPx(10)),
      height: fitPx(30),
      width: fitPx(1),
      alignment: Alignment.center,
      color: Colors.black.withAlpha(10),
    );
  }
}

//上下结构的信息 item

/*
* 260万
* 售价
* */

class MessageItemWidget extends StatelessWidget {
  final String title;
  final String message;

  MessageItemWidget({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.message,
            style: TextStyle(
              fontSize: fitFontSize(17),
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
          Text(
            this.title,
            style: TextStyle(
                fontSize: fitPx(12), color: Colors.grey.withAlpha(180)),
          ),
        ],
      ),
    );
  }
}
