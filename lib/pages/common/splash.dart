import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/pages/common/introduction.dart';
import 'package:gol_pouneh/services/advert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import '../../models/company_model.dart';
import '../../services/location.dart';
import '../../shared/bottom_nav.dart';
import '../../shared/color.dart';
import '../../shared/data_memory.dart';
import '../identity/login.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  late Widget navigateToScreen;
  bool checkedOnce = false;
  double uploadPercent = 0.0;
  late VideoPlayerController controller;

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('assets/videos/splash_video1.mp4')
      ..initialize().then((value) => {setState(() {})});
    controller.play();
  }

  startTimeError() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, checkNavigator);
  }

  checkNavigator() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      List<InternetAddress>? result = [];
      if (kIsWeb == false) {
        result = await InternetAddress.lookup('golpouneh.com');
      }
      if (kIsWeb || (result.isNotEmpty && result[0].rawAddress.isNotEmpty)) {
        if (prefs.getString('userId') != null) {
          if (prefs.getBool('isFirstTime') != false) {
            DataMemory.isFirstTime = true;
            prefs.setBool('isFirstTime', false);
          } else {
            DataMemory.isFirstTime = false;
          }
          DataMemory.userId = prefs.getString('userId')!;
          debugPrint(DataMemory.userId);
          DataMemory.adverts = await AdvertService().index([3, 4]);

          var response = await LocationService().setCompany(10, 1);

          prefs = await SharedPreferences.getInstance();

          if (prefs.getInt('supplierId1') == null) {
            DataMemory.companyModelDetails = response.reversed.elementAt(4);
            CompanyModel companyModel = DataMemory.companyModelDetails;

            DataMemory.supplierId = companyModel.id!.toInt();
            DataMemory.supplierName = companyModel.companyName!;
            DataMemory.latitude = companyModel.Latitude;
            DataMemory.longitude = companyModel.Longitude;
            DataMemory.supplierAddress = companyModel.address!;

            var supId = DataMemory.supplierId.toInt();
            var supName = DataMemory.supplierName;
            var supAddress = DataMemory.supplierAddress;
            var supLatitudeAddress = DataMemory.latitude;
            var supLongitudeAddress = DataMemory.longitude;
            prefs.setInt('supplierId1', supId);
            prefs.setString('supplierName1', supName);
            prefs.setString('supplierAddress1', supAddress);
            prefs.setString('latAddress1', supLatitudeAddress!);
            prefs.setString('longAddress1', supLongitudeAddress!);
          }
          // else {
          //     print('DataMemory.supplierAddress1${DataMemory.supplierName}');
          //   }

          // DataMemory.newProducts = await ProductService().newestProducts(1, 10);
          //   DataMemory.bestSellingProducts =
          //   await ProductService().bestSellerProducts(1, 10);
          if (!mounted) return;
          if (DataMemory.isFirstTime == true) {
            Timer(const Duration(seconds: 3), () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CarouselWithIndicatorDemo()));
            });
          } else {
            Timer(const Duration(seconds: 3), () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BottomNav()));
            });
          }
        } else {
          if (!mounted) return;
          Timer(const Duration(seconds: 3), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Login()));
          });
        }
      }
    } on SocketException catch (_) {
      if (!checkedOnce) {
        if (!mounted) return;
        settingModalBottomSheet(context);
      }
      startTimeError();
    }
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb == false) loadVideoPlayer();
    checkNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        kIsWeb
            ? Image.asset('assets/images/logo.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.scaleDown)
            : SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
        //FURTHER IMPLEMENTATION
      ],
    );
  }

  void settingModalBottomSheet(context) {
    setState(() {
      checkedOnce = true;
    });
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  height: 50,
                  color: mainColor,
                  child: const Center(
                      child: Text('اتصال اینترنت خود را بررسی نمایید',
                          textScaleFactor: 1,
                          style:
                              TextStyle(fontSize: 15, color: Colors.white)))));
        });
  }

  @override
  void dispose() {
    super.dispose();
    if (kIsWeb == false) controller.dispose();
  }
}
//OLD
/*  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 0,
        child: Stack(children: [
          Image.asset('assets/images/splash.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 150),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 15,
                            blurRadius: 20,
                            offset: Offset(0, 3))
                      ]),
                      child: Image.asset('assets/images/logo.png', width: 220)),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 100,
                      height: 20,
                      child: Loading.linearSmall())
                ]),
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: const Text('نسخه 1.0.9',
                        style: TextStyle(fontSize: 13, color: Colors.white)))
              ])
        ]));
  } */
