import 'package:flutter/material.dart';

//flutter_swiper
import 'package:flutter_swiper/flutter_swiper.dart';

//tool
import 'package:flutter_house/tools/AllTool.dart';

class HomeAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HomeAppBarWidgetState createState() => _HomeAppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  List<String> titleList = ['万象天地', '壹方城', '荔香公园', '南山公园'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        child: SizedBox(
          height: fitPx(80),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withAlpha(150),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: -1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(left: 16),
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: fitPx(80),
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                alignment: Alignment.centerLeft,
                                height: fitPx(80),
                                child: Text(
                                  this.titleList[index],
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              );
                            },
                            itemCount: this.titleList.length,
                            autoplay: true,
                            scrollDirection: Axis.vertical,
                            loop: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  label: Text('深圳'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
