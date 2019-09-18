import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

//房子详情页面   头部的图片
class TopPictureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fitPx(150),
      child: Container(
        color: randomColor(),
      ),
    );
  }
}
