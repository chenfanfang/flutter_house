import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class ChooseItemBarWidget extends StatefulWidget {
  final int bgAlpha;

  @override
  _ChooseItemBarWidgetState createState() => _ChooseItemBarWidgetState();

  ChooseItemBarWidget(this.bgAlpha);
}

class _ChooseItemBarWidgetState extends State<ChooseItemBarWidget> {
  int selectedIndex = 0;

  List<String> itemTitleList = ['房源', '详情', '动态', '小区', '推荐'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double chooseBarHeight = 44;

    Color  havingLineColor =
        Color.fromARGB(255, 230, 230, 230).withAlpha(this.widget.bgAlpha);

    return Offstage(
      offstage: this.widget.bgAlpha < 10 ? true : false,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: havingLineColor,
            ),
            bottom: BorderSide(color: havingLineColor,),

          ),
          color: Colors.white.withAlpha(this.widget.bgAlpha),
        ),

        margin: EdgeInsets.only(top: 44 + MediaQuery.of(context).padding.top),
        height: chooseBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(this.itemTitleList.length, (int index) {
            return Container(
              width: screenWidth / this.itemTitleList.length - 0.01,
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      this.selectedIndex = index;
                    });
                  },
                  child: Text(
                    this.itemTitleList[index],
                    style: TextStyle(
                        color: index == this.selectedIndex
                            ? Colors.blue.withAlpha(this.widget.bgAlpha)
                            : Color.fromARGB(255, 120, 120, 120)
                                .withAlpha(this.widget.bgAlpha)),
                  )),
            );
          }),
        ),
      ),
    );
  }
}
