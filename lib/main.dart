import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gol_pouneh/pages/common/splash.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:latlong2/latlong.dart';

//
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(
    Phoenix(
      child: GetMaterialApp(
        title: 'گل پونه',
        color: mainColor,
        home: const Splash(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'IRANSans', primarySwatch: Colors.green),
        builder: (BuildContext context, Widget? child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Builder(
              builder: (BuildContext context) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child ?? Container(),
                );
              },
            ),
          );
        },
      ),
    ),
  );
}

double getDistance(LatLng start, LatLng end) {
  double dis = const Distance().as(
    LengthUnit.Kilometer,
    start,
    end,
  );
  return dis;
}
