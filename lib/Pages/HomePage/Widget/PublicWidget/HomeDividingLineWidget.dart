import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/all_tool.dart';

//分割线
class HomeDividingLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fitPx(1),
      child: Container(
        color: Colors.black.withAlpha(30),
      ),
    );
  }
}
