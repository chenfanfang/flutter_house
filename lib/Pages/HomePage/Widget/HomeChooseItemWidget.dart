import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class HomeChooseItemWidget extends StatefulWidget {
  @override
  _HomeChooseItemWidgetState createState() => _HomeChooseItemWidgetState();
}

class _HomeChooseItemWidgetState extends State<HomeChooseItemWidget> {
  double itemWidth;
  double itemHeight;
  final List<Map> itemsData = [
    {'title': '二手房', 'icon': '二手房.png'},
    {'title': '新房', 'icon': '新房.png'},
    {'title': '租房', 'icon': '租房.png'},
    {'title': '卖房', 'icon': '二手房.png'},
    {'title': '海外', 'icon': '海外.png'},
    {'title': '必看好房', 'icon': '必看好房.png'},
    {'title': '装修', 'icon': '装修.png'},
    {'title': '找小区', 'icon': '海外.png'},
    {'title': '查成交', 'icon': '新房.png'},
    {'title': '本周热盘', 'icon': '二手房.png'},
    {'title': '买卖流程', 'icon': '买卖流程.png'},
    {'title': '房贷计算', 'icon': '新房.png'},
    {'title': '房屋估价', 'icon': '房屋估价.png'},
    {'title': '地图找房', 'icon': '装修.png'},
    {'title': '海区好房', 'icon': '必看好房.png'},
  ];

  List<Widget> _itemsBuilder(BuildContext context, List<Map> itemsData) {
    return List.generate(itemsData.length, (int index) {
      return Container(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/' + itemsData[index]['icon'],
//                width: 50,
                height: 50,
              ),
              Text(itemsData[index]['title']),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.itemWidth = screenWidth / 5.0;
    this.itemHeight = this.itemWidth;
  }

  @override
  Widget build(BuildContext context) {
    int rows = (this.itemsData.length / 5).ceil();

    return Container(
      height: this.itemHeight * rows,
      child: GridView.extent(
        physics: NeverScrollableScrollPhysics(),
        maxCrossAxisExtent: this.itemWidth,
        children: _itemsBuilder(context, itemsData),
      ),
    );
  }



}
