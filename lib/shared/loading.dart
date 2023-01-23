import 'package:flutter/material.dart';
import 'color.dart';

class Loading {
  static Widget circular([Color color = mainColor]) {
    return Center(
        child:
            CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(color)));
  }

  static Widget circularPosition([Color color = mainColor]) {
    return CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(color));
  }

  static Widget circularSmall([Color color = mainColor]) {
    return Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color), strokeWidth: 3));
  }

  static Widget linear([Color color = mainColor]) {
    return LinearProgressIndicator(
        backgroundColor: color,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white));
  }

  static Widget linearSmall([Color color = mainColor]) {
    return Container(
        width: 100,
        margin: const EdgeInsets.only(top: 20),
        height: 3,
        child: LinearProgressIndicator(
            backgroundColor: color,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white)));
  }
}
