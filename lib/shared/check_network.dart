import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'color.dart';

checkNavigator(bool checkedOnce, context, Function() check) async {
  try {
    List<InternetAddress>? result = [];
    if (kIsWeb == false) {
      result = await InternetAddress.lookup('golpouneh.com');
    }
    if (kIsWeb || (result.isNotEmpty && result[0].rawAddress.isNotEmpty)) {}
    check();
    const snackBar = SnackBar(
      content: Text('اطلاعات شما به روز است',
          textScaleFactor: 1, style: TextStyle(fontSize: 15, color: Colors.white)),
      backgroundColor: mainColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } on SocketException catch (_) {
    if (!checkedOnce) {
      const snackBar = SnackBar(
        content: Text('اتصال اینترنت خود را بررسی نمایید',
            textScaleFactor: 1, style: TextStyle(fontSize: 15, color: Colors.white)),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // startTimeError();
  }
}
