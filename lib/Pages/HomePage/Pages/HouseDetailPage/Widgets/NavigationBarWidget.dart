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

    return Container(
      alignment: Alignment.topCenter,
      height: marginTop + navigationBarHeight,
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
        ],
      ),
    );
  }
}
