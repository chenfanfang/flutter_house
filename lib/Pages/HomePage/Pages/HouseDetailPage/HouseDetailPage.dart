import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

//widgets
import 'Widgets/TopPictureWidget.dart';
import 'Widgets/NavigationBarWidget.dart';
import 'Widgets/ChooseItemBarWidget.dart';
import 'Widgets/TitleMessageWidget.dart';
import 'Widgets/HouseDetailMessageWidget.dart';

class HouseDetailPage extends StatefulWidget {
  @override
  _HouseDetailPageState createState() => _HouseDetailPageState();
}

class _HouseDetailPageState extends State<HouseDetailPage> {
  ScrollController scrollController = ScrollController();
  int navBgColorAlpha = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.scrollController.addListener(() {
      double offsetY = this.scrollController.offset;
      int newAlpha = 255;

      if (offsetY < 30) {
        newAlpha = 0;
      } else if (offsetY >= 30 && offsetY <= 120) {
        double everageAlpha = 255 / (120 - 30);
        newAlpha = ((offsetY - 30) * everageAlpha).floor();
      }

      if (this.navBgColorAlpha != newAlpha) {
        setState(() {
          this.navBgColorAlpha = newAlpha;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.scrollController.dispose();
  }

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
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                controller: this.scrollController,
                children: <Widget>[
                  Container(
                    child: TopPictureWidget(),
                  ),
                  TitleMessageWidget(),
                  HouseDetailMessageWidget(),
                ],
              ),
            ),
          ),
          Positioned(
            //height: MediaQuery.of(context).padding.top + fitPx(44),
            child: NavigationBarWidget(this.navBgColorAlpha),
          ),
          Positioned(
            child: ChooseItemBarWidget(this.navBgColorAlpha),
          ),
        ],
      ),
    );
  }
}
