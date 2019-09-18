import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

//widget
import 'HomeDividingLineWidget.dart';

//房子
class HomeHouseItemWidget extends StatelessWidget {
  /*
  * data 的数据格式为
  * {'icon' : '图片地址', 'title':'标题', 'subTitle':'子标题', 'flags':['地铁沿线','公交直达'], 'price':'价格','area':'面积' }
  * */

  final Map data;

  HomeHouseItemWidget({this.data});

  final Widget marginWidget = SizedBox(
    height: fitPx(5),
  );

  @override
  Widget build(BuildContext context) {
    double iconHeight = fitPx(80);
    double iconWidth = iconHeight * 1.5;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: fitPx(20), bottom: fitPx(20)),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: iconWidth,
                height: iconHeight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(fitPx(2))),
                  ),
                  child: Image.asset(this.data['icon']),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: fitPx(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.data['title'],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                      marginWidget,
                      Text(
                        this.data['subTitle'],
                        style: TextStyle(fontSize: fitPx(11)),
                      ),
                      marginWidget,
                      Container(
                        height: fitPx(15),
                        child: Row(
                          children: List.generate(this.data['flags'].length,
                              (int index) {
                            String flag = this.data['flags'][index];

                            return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  left: fitPx(5), right: fitPx(5)),
                              margin: EdgeInsets.only(right: fitPx(5)),
                              decoration: BoxDecoration(
                                  color: index == 0
                                      ? Colors.blue
                                      : Colors.grey.withAlpha(50),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(fitPx(2)))),
                              child: Text(
                                flag,
                                style: TextStyle(
                                  fontSize: fitPx(10),
                                  color:
                                      index == 0 ? Colors.white : Colors.grey,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      marginWidget,
                      
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              this.data['price'],
                              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: fitPx(10),),
                            Text(
                              this.data['area'],
                              style: TextStyle(color: Colors.grey,fontSize: fitPx(10)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        HomeDividingLineWidget(),
      ],
    );
  }
}
