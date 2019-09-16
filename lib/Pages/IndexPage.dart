import 'package:flutter/material.dart';

//pages
import 'HomePage/HomePage.dart';
import 'MessagePage/MessagePage.dart';
import 'SeePage/SeePage.dart';
import 'MyPage/MyPage.dart';

//tools
import 'package:flutter_house/tools/all_tool.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.filter_center_focus),
      title: Text('看点'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      title: Text('消息'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的'),
    ),
  ];

  final List<Widget> pages = [
    HomePage(),
    SeePage(),
    MessagePage(),
    MyPage(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    initScreen(context: context);
    ToolShowLoding.init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: this.bottomNavBarItems,
        currentIndex: this.currentPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            this.currentPageIndex = index;
          });
        },

      ),
      body: IndexedStack(
        index: this.currentPageIndex,
        children: this.pages,
      ),
    );
  }
}
