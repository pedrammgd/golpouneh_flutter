import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gol_pouneh/pages/supplier/location_on_map.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/geo_location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/category.dart';
import '../../models/company_model.dart';
import '../../services/location.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';

class SuppliersLocation extends StatefulWidget {
  final bool fromFinalize;
  const SuppliersLocation(this.fromFinalize, {Key? key}) : super(key: key);

  @override
  State<SuppliersLocation> createState() => _SuppliersLocationState();
}

class _SuppliersLocationState extends State<SuppliersLocation>
    with TickerProviderStateMixin {
  dynamic row1;
  dynamic shopName;
  dynamic code;
  dynamic phoneNumber;
  dynamic address;
  late CompanyModel model;
  late List<CompanyModel> listDetails;
  dynamic locationDetail;
  dynamic listOfLenght;
  var isLoading = true;
  dynamic object;
  bool isLoading1 = true;
  List tabs = [];
  List tabs2 = [];
  List lastList = [];
  List<CompanyModel> response = [];
  CategoryModel? categoryModel1;
  int catIndex = 0;
  TabController? tabController;
  int orderProductCount = 0;
  int orderProductCount1 = 0;
  List<bool> isChanging = [];
  List<CompanyModel> products = [];
  var pageNumber = 0;
  List uniquelist = [];
  bool shoab = false;
  bool namayandegi = false;
  List<CompanyModel> repList = [];
  List<CompanyModel> branchList = [];
  int left2 = 0;
  int top2 = 0;
  int left1 = 0;
  int top1 = 0;
  int notFoundScale = 0;

  @override
  void initState() {
    super.initState();
    getListOfCompany();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading1
            ? Loading.circular()
            : DefaultTabController(
                initialIndex: catIndex,
                length: uniquelist.length,
                child: Builder(builder: (BuildContext context) {
                  final TabController? tabController =
                      DefaultTabController.of(context);
                  tabController?.addListener(() async {});
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text("شعب ونمایندگی",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      backgroundColor: mainColor,
                      elevation: 0,
                      centerTitle: false,
                      actions: [
                        GestureDetector(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: GestureDetector(
                                    onTap: () {
                                      DataMemory.geoLocation = null;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LocationOnMAp()));
                                    },
                                    child: Row(children: const [
                                      Icon(Icons.location_on_outlined,
                                          color: Colors.white, size: 23),
                                      Text('مکان یابی ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ]))),
                            onTap: () {
                              DataMemory.geoLocation = null;
                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  LocationOnMAp()));

                              //toastFail('مکان یابی', 'خطا در یافتن نزدیک ترین شعبه', context);
                            })
                      ],
                      automaticallyImplyLeading: true,
                      bottom: TabBar(
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 40),
                        isScrollable: true,
                        controller: tabController,
                        tabs: [for (final tab in uniquelist) Tab(text: tab)],
                      ),
                    ),
                    body: isLoading
                        ? Loading.circular()
                        : TabBarView(
                            controller: tabController,
                            children: [
                              for (final tab in uniquelist)
                                isLoading
                                    ? Container()
                                    : Container(
                                        padding: const EdgeInsets.only(
                                            right: 5, top: 5),
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/banner.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // const Padding(
                                              //   padding: EdgeInsets.all(8.0),
                                              //   child: Text(
                                              //     "شعب",
                                              //     style: TextStyle(
                                              //         color: Colors.black,
                                              //         fontWeight: FontWeight.bold,
                                              //         fontSize: 17),
                                              //   ),
                                              // ),
                                              isLoading
                                                  ? Loading.circular()
                                                  : list1(tab),
                                              isLoading
                                                  ? Loading.circular()
                                                  : list2(tab),
                                              const SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ))
                            ],
                          ),
                  );
                })));
  }

  Widget list1(tab) {
    List<CompanyModel> l1 = [];
    List<CompanyModel> l2 = [];

    for (int index = 0; index < listDetails.length; index++) {
      CompanyModel itemDetails = listDetails.elementAt(index);
      var cityState = itemDetails.city!.state;
      if (cityState["Title"] == tab) {
        for (var value in geoLocations) {
          if (value["id"] == listDetails[index].id) {
            listDetails[index].setGeo = value["geoLoc"];
          }
        }
        if (itemDetails.companyName!.contains("شعب")) {
          l1.add(listDetails[index]);
        } else {
          l2.add(listDetails[index]);
        }
      }
    }

    if (top1 != 100) {
      if (l1.isEmpty) {
        if (top1 == 0) {
          // doSomething1();
        }
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      l1.isEmpty
          ? const SizedBox()
          : const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "شعب",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
      for (int index = 0; index < l1.length; index++) row(l1[index], index)
    ]);
  }

  Widget list2(tab) {
    List<CompanyModel> l1 = [];
    List<CompanyModel> l2 = [];

    for (int index = 0; index < listDetails.length; index++) {
      CompanyModel itemDetails = listDetails.elementAt(index);
      var cityState = itemDetails.city!.state;
      if (cityState["Title"] == tab) {
        for (var value in geoLocations) {
          if (value["id"] == listDetails[index].id) {
            listDetails[index].setGeo = value["geoLoc"];
          }
        }
        if (itemDetails.companyName!.contains("شعب")) {
          l1.add(listDetails[index]);
        } else {
          l2.add(listDetails[index]);
        }
      }
    }

    if (top2 != 100) {
      if (l2.isEmpty) {
        if (top2 == 0) {
          //  doSomething2();
        }
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      l2.isEmpty
          ? const SizedBox()
          : const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "نمایندگی",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
      for (int index = 0; index < l2.length; index++) row(l2[index], index)
    ]);
  }

  void doSomething1() {
    Stream stream = Stream.periodic(const Duration(milliseconds: 500));
    stream.listen((event) {
      if (top1 != 100) {
        if (top1 == 30) {
          setState(() {
            top1 = 0;
          });
        } else {
          setState(() {
            top1 = 30;
          });
        }
      }
    });
    Timer(const Duration(seconds: 7), () {
      setState(() {
        top1 = 100;
      });
      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          notFoundScale = 1;
        });
      });
    });
  }

  void doSomething2() {
    Stream stream = Stream.periodic(const Duration(milliseconds: 500));
    stream.listen((event) {
      if (top2 != 100) {
        if (top2 == 25) {
          setState(() {
            top2 = 5;
          });
        } else {
          setState(() {
            top2 = 25;
          });
        }
      }
    });
    Timer(const Duration(seconds: 7), () {
      setState(() {
        top2 = 100;
      });
      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          notFoundScale = 1;
        });
      });
    });
  }

  Widget row(CompanyModel model, int index) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: const BoxDecoration(
          color: homeBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // detailsRow("ردیف :",index.toString() ),
            detailsRow(model, "نام شعب و نمایندگی ها :", model.companyName,
                Icons.factory),
            const SizedBox(
              height: 8,
            ),
            //detailsRow("کد :", model.supplierCode),
            detailsRow(model, "تلفن تماس :", model.phoneNumber, Icons.phone),
            const SizedBox(
              height: 8,
            ),
            detailsRow(model, "آدرس :", model.address, Icons.location_city),

            model.geoLocation != null
                ? Center(
                    child: IconButton(
                      onPressed: () {
                        DataMemory.geoLocation = model.geoLocation;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LocationOnMAp()));
                      },
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 35,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget detailsRow(CompanyModel model, String title, details, icon) {
    return InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon == Icons.phone
                    ? InkWell(
                        child: Container(
                          padding: const EdgeInsets.only(top: 3),
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Icon(
                            icon,
                            color: mainColor,
                          ),
                        ),
                        onTap: () {
                          dialNumber(phoneNumber: details, context: context);
                        },
                      )
                    : Icon(
                        icon,
                        color: mainColor,
                      ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text(
              details ?? '',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            )),
          ],
        ),
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int supplierId = model.id!.toInt();
          String supplierName = model.companyName!;
          String supplierAddress = model.address!;
          var supLatitudeAddress = model.Latitude;
          var supLongitudeAddress = model.Longitude;
          prefs.setInt('supplierId1', supplierId);
          prefs.setString('supplierName1', supplierName);
          prefs.setString('supplierAddress1', supplierAddress);
          prefs.setString('latAddress1', supLatitudeAddress ?? '');
          prefs.setString('longAddress1', supLongitudeAddress ?? '');
          DataMemory.companyModelDetails = model;
          setState(() {
            DataMemory.supplierId = prefs.getInt('supplierId1')!;
            DataMemory.supplierName = prefs.getString('supplierName1')!;
            DataMemory.supplierAddress = prefs.getString('supplierAddress1')!;
            DataMemory.latitude = prefs.getString('latAddress1')!;
            DataMemory.longitude = prefs.getString('longAddress1')!;
            var supId = prefs.getInt('supplierId1')!;
            DataMemory.supplierId = supId;
            var supName = prefs.getString('supplierName1');
            DataMemory.supplierName = supName!;
            var supAddress = prefs.getString('supplierAddress1')!;
            DataMemory.supplierAddress = supAddress;
          });
          int count = 0;
          if (widget.fromFinalize) {
            navigateTo(() {
              Navigator.of(context).popUntil((_) => count++ >= 1);
            });
          }
        });
  }

  navigateTo(Function doThing) {
    doThing();
  }

  Future<void> dialNumber(
      {required String phoneNumber, required BuildContext context}) async {
    final url = "tel:$phoneNumber";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      //
    }

    return;
  }

  getListOfCompany() async {
    response = await LocationService().setCompany(10, 1);
    response.sort(
      (a, b) {
        return a.sortId!.compareTo(b.sortId!);
      },
    );
    tabs = response.where((x) => x.cityId != null).toList();

    if (tabs.isNotEmpty) {
      for (var i in tabs) {
        CompanyModel company = i;
        var cityState1 = company.city?.state;
        var obj3 = cityState1["Title"].toString();
        tabs2.add(obj3);
      }
      uniquelist = tabs2.toSet().toList();
    }
    List temp = [
      uniquelist[0],
      uniquelist[1],
      uniquelist[2],
    ];
    uniquelist.clear();
    uniquelist = temp;
    tabController = TabController(vsync: this, length: tabs.length);
    // getData1(pageNumber,  tabs[catIndex]);
    setState(() {
      isLoading1 = false;
    });

    //OLD
    listDetails = response;
    listOfLenght = listDetails.length;
    setState(() {
      isLoading = false;
    });
  }
}
