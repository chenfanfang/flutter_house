import 'package:flutter/material.dart';
import 'Pages/IndexPage.dart';

import 'package:flutter_native_bridge/flutter_native_bridge.dart';

void main () {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterNativeBridge.platformVersion.then((String result){

      print('version:$result');
    });

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: IndexPage(),
    );
  }
}
