import 'package:flutter/material.dart';
import 'Pages/IndexPage.dart';

void main () {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: IndexPage(),
    );
  }
}
