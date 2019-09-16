import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HomeAppBarWidgetState createState() => _HomeAppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: SafeArea(
        child: SizedBox(
          height: 80,
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
                  ),
                  margin: EdgeInsets.only(left: 16),
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Text(
                        '万象天地',
                        style: TextStyle(
                          color: Colors.black54,
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
