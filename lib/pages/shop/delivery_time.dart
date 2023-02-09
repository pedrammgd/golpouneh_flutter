import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/converter.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/toast.dart';
import 'package:gol_pouneh/shared/url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({Key? key}) : super(key: key);

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  @override
  void initState() {
    changeTime("4:00:00 PM", firstTime: true);
    initPrefs();
    super.initState();
  }

  late SharedPreferences prefs;
  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  List daysOfWeekList = ['امروز', 'فردا'];
  var catIndex = 1;
  int deliveryPeriod = 2;
  @override
  Widget build(BuildContext context) {
    var tabWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      body: DefaultTabController(
        initialIndex: catIndex,
        length: daysOfWeekList.length,
        child: Builder(
          builder: (BuildContext context) {
            final TabController? tabController =
                DefaultTabController.of(context);
            tabController?.addListener(() async {});
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'انتخاب زمان تحویل',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w900),
                ),
                automaticallyImplyLeading: true,
                bottom: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: tabWidth),
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  controller: tabController,
                  onTap: (value) {
                    //TODO: do something
                  },
                  tabs: [for (final tab in daysOfWeekList) Tab(text: tab)],
                ),
              ),
              body: TabBarView(
                controller: tabController,
                children: [
                  chooseTime(0),
                  chooseTime(1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget chooseTime(int i) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: i == 0
              ? Container(
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "اکنون این قابلیت در دسترس نمی باشد",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('بازه زمانی تحویل را انتخاب کنید:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('۸ تا ۱۲',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Radio(
                                value: 1,
                                groupValue: deliveryPeriod,
                                onChanged: (int? i) {
                                  setState(() {
                                    deliveryPeriod = 1;
                                    changeTime("12:00:00 PM");
                                    prefs.setString(
                                        'delivery-time', ' 8 تا 12');
                                  });
                                },
                              ),
                            ],
                          ),
                          bottomCardDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('۱۲ تا ۱۶',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Radio(
                                value: 2,
                                groupValue: deliveryPeriod,
                                onChanged: (int? i) {
                                  setState(() {
                                    deliveryPeriod = 2;
                                    changeTime("4:00:00 PM");
                                    prefs.setString(
                                        'delivery-time', ' 12 تا 16');
                                  });
                                },
                              ),
                            ],
                          ),
                          bottomCardDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('۱۶ تا ۲۰',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Radio(
                                value: 3,
                                groupValue: deliveryPeriod,
                                onChanged: (int? i) {
                                  setState(() {
                                    deliveryPeriod = 3;
                                    changeTime("8:00:00 PM");
                                    prefs.setString(
                                        'delivery-time', ' 16 تا 20');
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void changeTime(String time, {bool firstTime = false}) async {
    DateTime dateTime = DateTime.now();
    final response = await http.post(
        Uri.parse("${apiUrl}Sale/SaleFactor/SetDeliveryDateForFactor"),
        body: {
          "saleFactorId": DataMemory.factorId.toString(),
          "deliveryDate":
              "${dateTime.year.toString()}/${dateTime.month.toString()}/${dateTime.day.toString()} $time",
        });
    final result =
        jsonDecode(utf8convert(response.body))["Result"]["result"]["Item2"];
    String message;
    if (jsonDecode(response.body)["HttpStatusCode"] == "200" &&
        result["IsSuccessed"] == true) {
      message = result["Message"];
      showToastMessages(() {
        if (firstTime == false) {
          toastSuccess("موفقیت", message, context);
          Future.delayed(const Duration(milliseconds: 1250), () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          });
        }
      });
    } else {
      message = "درخواست شما ناموفق بود";
      showToastMessages(() {
        toastFail("ناموفق", message, context);
      });
    }
  }

  showToastMessages(Function showToast) => showToast();

  Widget bottomCardDivider() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 5),
        height: 1,
        color: const Color(0xffe3e3e3));
  }
}
