import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

//资讯快递
class HomeInformationExpressWidget extends StatelessWidget {
  Widget _pictureBannerBuilder(
      {String title, String message, String iconName, bool alignmentLeft}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new ExactAssetImage('images/' + iconName),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            left: fitPx(10),
            child: SizedBox(
              height: fitPx(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: fitFontSize(14),
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        fontSize: fitFontSize(12), color: Colors.white),
                  ),
                ],
              ),
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
          EdgeInsets.only(top: fitPx(20), left: fitPx(20), right: fitPx(20)),
      height: fitPx(230),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '资讯快递',
            style: TextStyle(
              fontSize: fitFontSize(20),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: fitPx(10),
          ),
          Expanded(
              child: Container(
            child: Row(
              children: <Widget>[
                //左边
                Container(
                  width: fitPx(100),
                  child: _pictureBannerBuilder(
                      title: '金九初开场',
                      message: '深圳人看房忙',
                      iconName: 'banner咨询速递竖.png',
                      alignmentLeft: false),
                ),

                //右边
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: fitPx(10)),
                    child: Column(
                      children: <Widget>[
                        //上
                        Expanded(
                          child: _pictureBannerBuilder(
                              title: '扎心了老铁',
                              message: '买房之后生活变了吗',
                              iconName: 'banner咨询速递横.png',
                              alignmentLeft: true),
                        ),

                        SizedBox(
                          height: fitPx(10),
                        ),
                        //下
                        Expanded(
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: _pictureBannerBuilder(
                                      title: '一周资讯',
                                      message: '深圳要建高中城',
                                      iconName: 'banner咨询速递方.png',
                                      alignmentLeft: false),
                                ),
                                SizedBox(
                                  width: fitPx(10),
                                ),
                                Expanded(
                                  child: _pictureBannerBuilder(
                                      title: '贝壳看好房',
                                      message: '带你看好房',
                                      iconName: 'banner咨询速递方1.png',
                                      alignmentLeft: false),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
