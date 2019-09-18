import 'dart:math';
import 'package:flutter/material.dart';

Color randomColor() {

  int red = Random().nextInt(255);
  int green = Random().nextInt(255);
  int blue = Random().nextInt(255);
  Color color = Color.fromARGB(255, red, green, blue);
  return color;
}