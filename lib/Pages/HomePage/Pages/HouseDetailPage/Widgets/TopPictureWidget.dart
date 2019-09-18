import 'package:flutter/material.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

//third
import 'package:flutter_swiper/flutter_swiper.dart';

//房子详情页面   头部的图片
class TopPictureWidget extends StatelessWidget {



  final List<String> iconNameList = [
    'images/banner咨询速递横.png',
    'images/banner咨询速递横.png',
    'images/banner咨询速递横.png',
  ];

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: fitPx(240),
      child: Container(

        child: Swiper(
          onTap: (int index) {
            print('index:$index');
          },
          itemCount: this.iconNameList.length,
          loop: true,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Image.asset(this.iconNameList[index],fit: BoxFit.cover,),
            );
          },
        ),
      ),
    );
  }
}
