import 'package:flutter/material.dart';

Widget button(String title, Color color, Function() onTap, {double marginTop = 25}) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
          margin: EdgeInsets.only(top: marginTop),
          height: 55,
          width: 320,
          alignment: Alignment.center,
          child: Text(title, style: const TextStyle(fontSize: 16, color: Colors.white))));
}
