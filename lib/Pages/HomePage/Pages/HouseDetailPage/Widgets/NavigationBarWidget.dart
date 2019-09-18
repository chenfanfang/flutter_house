import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class NavigationBarWidget extends StatefulWidget {
  final int bgAlpha;

  @override
  _NavigationBarWidgetState createState() => _NavigationBarWidgetState();

  NavigationBarWidget(this.bgAlpha);
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  Color color = Colors.white;

  List<IconData> rightIconsDataList = [
    Icons.swap_vertical_circle,
    Icons.check_circle_outline,
    Icons.message,
    Icons.send
  ];

  int selectedIndex = 0;

  List<String> itemTitleList = ['房源', '详情', '动态', '小区', '推荐'];

  Widget _customIconButtonBuilder(
      {IconData iconData, void Function() onPress}) {
    return Container(
      child: IconButton(
        icon: Icon(
          iconData,
          color: this.widget.bgAlpha == 0 ? Colors.white : Colors.black,
        ),
        onPressed: onPress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double marginTop = MediaQuery.of(context).padding.top;
    double navigationBarHeight = 44;
    double chooseBarHeight = 44;
    return Container(
      alignment: Alignment.topCenter,
      height: marginTop + navigationBarHeight + chooseBarHeight,
      color: this.widget.bgAlpha == 0
          ? Colors.transparent
          : Colors.white.withAlpha(this.widget.bgAlpha),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: marginTop),
            height: navigationBarHeight,
            child: Row(
              children: <Widget>[
                _customIconButtonBuilder(
                  iconData: Icons.arrow_back,
                  onPress: () {
                    pop(context);
                  },
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        this.rightIconsDataList.length,
                        (int index) {
                          return _customIconButtonBuilder(
                            iconData: this.rightIconsDataList[index],
                            onPress: () {
                              print('index: $index');
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //分割线
          SizedBox(
            height: fitPx(1),
            child: Container(
              color: Color.fromARGB(255, 230, 230, 230).withAlpha(this.widget.bgAlpha),
            ),
          ),

          Expanded(
            child: Container(
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
                                  : Color.fromARGB(255, 120, 120, 120).withAlpha(this.widget.bgAlpha)),
                        )),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
