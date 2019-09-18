import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

//widgets
import 'Widgets/TopPictureWidget.dart';

class HouseDetailPage extends StatefulWidget {
  @override
  _HouseDetailPageState createState() => _HouseDetailPageState();
}

class _HouseDetailPageState extends State<HouseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.transparent,
//        title: Text('详情'),
//      ),
      body: Stack(
        children: [
          Container(
            color: randomColor(),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: TopPictureWidget(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: SizedBox(
            height: fitPx(20),
            child: Container(
              color: randomColor(),
            ),
          ))
        ],
      ),
    );
  }
}
