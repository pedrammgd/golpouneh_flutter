import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gol_pouneh/models/company_model.dart';
import 'package:gol_pouneh/models/factor.dart';
import 'package:gol_pouneh/models/product.dart';
import 'package:gol_pouneh/pages/factor/show_finalize_factor.dart';
import 'package:gol_pouneh/pages/shop/delivery_time.dart';
import 'package:gol_pouneh/services/cart.dart';
import 'package:gol_pouneh/services/delivery.dart';
import 'package:gol_pouneh/services/location.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/address.dart';
import '../../models/result_operation.dart';
import '../../services/address.dart';
import '../../services/factor.dart';
import '../../shared/appbar.dart';
import '../../shared/check_network.dart';
import '../../shared/color.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';
import '../../shared/toast.dart';
import '../supplier/location.dart';

class FinalizeOrderState extends State<FinalizeOrder>
    with WidgetsBindingObserver {
  int selectedIndex = 0;
  List<AddressModel> addresses = [];
  List<FactorModel> factors = [];
  bool isLoading = true;
  bool numberOfProductFactorLoading = true;
  bool wasPaying = false;
  bool showList = false;
  late CompanyModel companyModel;
  int companyModelId = 1;
  SharedPreferences? prefs;
  FactorModel? factorModel;
  int supplierId = 1;
  int? supplierId1;
  String? supplierName;
  String? supplierName1;
  String? supplierAddress;
  String? supplierAddress1;
  String factorDate = "";
  String factorNumber = "";
  bool showFactorDetails = false;
  bool purchaseMethod = false;
  late ResultOperation result;
  bool loadFactorModel = false;
  bool loadProfileModel = false;
  bool loadfactorDetails1 = false;
  List<dynamic> numberOfProductFactorList = [];
  int numberOfProductFactor = 0;
  double totalPrice = 0;
  double payWithoutDiscount = 0;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  bool showPay = false;
  bool checkedOnce = false;
  String? shopLatitude;
  String? shopLongitude;
  String? userLatitude;
  String? userLongitude;
  double deliveryPrice = 0;
  List<CompanyModel> companyList = [];
  late List<ProductModel> cartProducts;

  @override
  void initState() {
    super.initState();
    DataMemory.activePayBtn = false;
    WidgetsBinding.instance.addObserver(this);
    firstNameController = TextEditingController(text: "");
    lastNameController = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    getData();
    getPriceData();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        super.didChangeAppLifecycleState(state);
        break;
      case AppLifecycleState.resumed:
        if (wasPaying) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowDetailsFinalizeFactor(
                      true, DataMemory.factorId, "online", true,
                      deliveryPrice: deliveryPrice)));
        }
        super.didChangeAppLifecycleState(state);
        break;
      default:
        super.didChangeAppLifecycleState(state);
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void getData() async {
    WidgetsBinding.instance.addObserver(this);
    showPay = false;
    prefs = await SharedPreferences.getInstance();

    if (prefs!.getInt('supplierId1') == null) {
      supplierId = DataMemory.supplierId;
      supplierName = DataMemory.supplierName;
      supplierAddress = DataMemory.supplierAddress;
      shopLatitude = DataMemory.latitude;
      shopLongitude = DataMemory.longitude;

      addresses = await AddressService().myAddresses(supplierId);
    } else {
      supplierId1 = prefs!.getInt('supplierId1')!;
      supplierName1 = prefs!.getString('supplierName1')!;
      supplierAddress1 = prefs!.getString('supplierAddress1')!;
      addresses = await AddressService().myAddresses(supplierId1!);
      if (prefs?.getString('latAddress1') == null) {
        var response = await LocationService().setCompany(10, 1);
        DataMemory.companyModelDetails = response.reversed.elementAt(4);
        CompanyModel companyModel = DataMemory.companyModelDetails;
        shopLatitude = companyModel.Latitude;
        shopLongitude = companyModel.Longitude;
      } else {
        shopLatitude = prefs?.getString('latAddress1');
        shopLongitude = prefs?.getString('longAddress1');
      }
    }
    setState(() {
      DataMemory.addresses = addresses;
      isLoading = false;
    });
    // print(addresses.first.buyerAddress);

    if (addresses.isNotEmpty) {
      userLatitude = addresses[selectedIndex].latitude;
      userLongitude = addresses[selectedIndex].longitude;
    }

    distantDelivery();
    isInIndustrialTown();
    print(isInIndustrialTown());
    delivery();
    // getListOfCompany().then((value) {
    //   if (companyList.isNotEmpty) {
    //     changeCompanyAddressAutoByUser();
    //   }
    // });
  }

  void delivery() async {
    setState(() {});
    Delivery result = await DeliveryService()
        .calculateDelivery(totalPrice.toString(), distantDelivery().toString());
    if (result.httpStatusCode == '200') {
      deliveryPrice = result.result?.price ?? 0;
    }
  }

  int distantDelivery() {
    var distanceInMeters = Geolocator.distanceBetween(
      double.parse(shopLatitude ?? '0'),
      double.parse(shopLongitude ?? '0'),
      double.tryParse(userLatitude ?? '0') ?? 0,
      double.tryParse(userLongitude ?? '0') ?? 0,
    );
    // setState(() {});
    // print('1-${shopLatitude}');
    // print('2-${shopLongitude}');
    // print('3-${userLatitude}');
    // print('4-${userLongitude}');
    // print('distanceInMeters ${distanceInMeters}');
    if (distanceInMeters > 2000) {
      return 1;
    } else {
      return 0;
    }
  }

  bool isInIndustrialTown() {
    var distanceInMeters = Geolocator.distanceBetween(
      double.parse('29.486164826459035'),
      double.parse('52.5367067511202'),
      double.tryParse(userLatitude ?? '0') ?? 0,
      double.tryParse(userLongitude ?? '0') ?? 0,
    );
    if (distanceInMeters > 10000) {
      return false;
    } else {
      return true;
    }
  }

  void getPriceData() async {
    cartProducts = await CartService().cartProducts();
    for (var i in cartProducts) {
      if (i.price == i.saleOrderProductFinalPrice) {
        totalPrice += i.price! * i.orderProductCount!;
      } else {
        totalPrice += i.saleOrderProductFinalPrice! * i.orderProductCount!;
      }
      // payWithoutDiscount += i.price! * i.orderProductCount!;
      payWithoutDiscount = cartProducts.first.SaleFactorDiscountAmmount ?? 0;
    }
    setState(() {
      isLoading = false;
    });
  }

  void changeCompanyAddressAutoByUser() {
    for (var element in companyList) {
      var distanceInMeters = Geolocator.distanceBetween(
        double.tryParse(userLatitude ?? '0') ?? 0,
        double.tryParse(userLongitude ?? '0') ?? 0,
        double.parse(element.Latitude ?? '0'),
        double.parse(element.Longitude ?? '0'),
      );
      if (distanceInMeters < 10000) {
        print(element.companyName);
        print('first$distanceInMeters');
      } else {
        print('second$distanceInMeters');
      }
    }
  }

  Future<void> getListOfCompany() async {
    companyList = await LocationService().setCompany(10, 1);
    companyList.sort(
      (a, b) {
        return a.sortId!.compareTo(b.sortId!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('?????????? ????????'),
      body: RefreshIndicator(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/banner.jpg"),
                    fit: BoxFit.cover),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  isLoading
                      ? Loading.circular()
                      : Container(
                          height: 30,
                          margin: const EdgeInsets.only(right: 7, top: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                    '???????? ???? ???????????????? ???????? ?????? ???? ???????????? ????????:',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                GestureDetector(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: mainColor),
                                        height: 50,
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        margin: const EdgeInsets.only(left: 5),
                                        alignment: Alignment.center,
                                        child: const Text(
                                            "???????????? ???????? ???? ???????????????? ",
                                            style: TextStyle(
                                                color: titleColor,
                                                fontSize: 12))),
                                    onTap: () async {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SuppliersLocation(
                                                      true))).then((value) {
                                        setState(() {
                                          isLoading = true;
                                          DataMemory.addresses.clear();
                                          getData();
                                          isLoading = false;
                                        });
                                      });
                                    })
                              ])),
                  const SizedBox(
                    height: 10,
                  ),
                  supplierDetails(),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 30,
                      margin: const EdgeInsets.only(right: 7, top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('???????? ???????? ?????? ???? ???????????? ???????? :',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)),
                            GestureDetector(
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: mainColor),
                                    height: 50,
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    margin: const EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    child: const Text("???????????? ???????? ????????",
                                        style: TextStyle(
                                            color: titleColor, fontSize: 12))),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const BottomNav(
                                                selectedIndex: 12,
                                              ))).then((value) {
                                    setState(() {
                                      isLoading = true;
                                      DataMemory.addresses.clear();
                                      getData();
                                      isLoading = false;
                                    });
                                  });
                                })
                          ])),
                  selectAddress(),
                  const SizedBox(
                    height: 7.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      loadfactorDetails1
                          ? Loading.circular()
                          : InkWell(
                              child: UnconstrainedBox(
                                child: Container(
                                    padding: const EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 7.0,
                                            offset: Offset(3, 2)),
                                      ],
                                    ),
                                    margin: const EdgeInsets.only(
                                        bottom: 20, top: 15, right: 5, left: 5),
                                    alignment: Alignment.center,
                                    child: const Text("???????????? ????????????",
                                        style: TextStyle(color: Colors.black))),
                              ),
                              onTap: () async {
                                loadFinalize();
                              },
                            ),
                      InkWell(
                        child: UnconstrainedBox(
                          child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 7.0,
                                      offset: Offset(3, 2)),
                                ],
                              ),
                              margin: const EdgeInsets.only(
                                  bottom: 20, top: 15, right: 5, left: 5),
                              alignment: Alignment.center,
                              child: const Text("???????????? ???????? ??????????",
                                  style: TextStyle(color: Colors.black))),
                        ),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DeliveryTime()));
                        },
                      ),
                    ],
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 7.0,
                                  offset: Offset(3, 2)),
                            ],
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: const EdgeInsets.only(
                            bottom: 20, right: 10, left: 10),
                        alignment: Alignment.center,
                        child: const Text(" ???????????? ???????? ??????????",
                            style: TextStyle(color: Colors.black))),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNav(
                                    selectedIndex: 23,
                                  )));
                    },
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 7.0,
                                  offset: Offset(3, 2)),
                            ],
                            borderRadius: BorderRadius.circular(7),
                            color: mainColor),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: const EdgeInsets.only(
                            bottom: 20, right: 10, left: 10),
                        alignment: Alignment.center,
                        child: const Text("????????????",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    onTap: () async {
                      if (DataMemory.activePayBtn) {
                        if (DataMemory.addresses.isNotEmpty) {
                          if (userLatitude == null) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomNav(
                                            selectedIndex: 11,
                                            arg: addresses[selectedIndex])))
                                .then((value) {
                              setState(() {
                                isLoading = true;
                                getData();
                              });
                            });
                            toastFail(
                                "???????? ???????????? ???????? ?????? ???? ?????? ???????? ?????? ????????",
                                "",
                                context);
                          } else {
                            if (isInIndustrialTown()) {
                              setState(() {
                                DataMemory.supplierId = 32;
                                supplierName1 = '??????????????';
                                supplierAddress1 =
                                    '???????? ???????????? ?????????? ???????? ?????????? ???????????????????? ???????????? ?????????? ???????? 422?? ???????? ???? ????????';
                                shopLatitude = '29.50068053663338';
                                shopLongitude = '52.51208455581785';
                              });
                              prefs?.setInt('supplierId1', supplierId);
                              prefs?.setString(
                                  'supplierName1', supplierName1 ?? '??????????????');
                              prefs?.setString(
                                  'supplierAddress1',
                                  supplierAddress1 ??
                                      '???????? ???????????? ?????????? ???????? ?????????? ???????????????????? ???????????? ?????????? ???????? 422?? ???????? ???? ????????');
                              prefs?.setString(
                                  'latAddress1', shopLatitude ?? '');
                              prefs?.setString(
                                  'longAddress1', shopLongitude ?? '');
                              toastSuccess(
                                  "???? ???????? ???? ???????????? ?????? ??????????????  ???????????? ???? ???? ?????????????? ?????????? ??????????",
                                  "",
                                  context);
                              setState(() {
                                showPay = true;
                              });
                            } else {
                              if (supplierId1 == 32) {
                                toastSuccess(
                                    "???? ???????? ???? ???????????? ?????? ?????????????? ?????????? ???????????? ?????????? ???? ?????????????? ???? ????????????",
                                    "",
                                    context);
                                setState(() {
                                  showPay = false;
                                });
                              } else {
                                setState(() {
                                  showPay = true;
                                });
                              }
                            }
                          }
                        } else {
                          toastFail("???? ???????? ?????????? ?????? ????????????", "", context);
                        }
                      } else {
                        toastFail(
                            "????????  ???????? ?????????? ?????? ???? ???????? ????????", "", context);
                      }
                    },
                  ),
                  showPay
                      ? Column(children: [
                          finalizeFactorHome(),
                          finalizeFactorOnline()
                        ])
                      : Container(
                          alignment: Alignment.center, child: const SizedBox())
                ],
              )),
          onRefresh: () async {
            setState(() {
              checkedOnce = false;
            });
            checkNavigator(checkedOnce, context, () {
              WidgetsBinding.instance.addObserver(this);
              firstNameController = TextEditingController(text: "");
              lastNameController = TextEditingController(text: "");
              emailController = TextEditingController(text: "");
              getData();
            });
          }),
    );
  }

  void loadFinalize() async {
    if (purchaseMethod) {
      setState(() {
        loadfactorDetails1 = true;
      });
      var comeFromFinalize = true;
      //
      navigateTo(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowDetailsFinalizeFactor(
                      comeFromFinalize,
                      DataMemory.factorId,
                      "",
                      false,
                      deliveryPrice: deliveryPrice,
                    ))).then((value) => setState(() {
              loadfactorDetails1 = false;
            }));
      });
    } else {
      setState(() {
        loadfactorDetails1 = true;
        loadFactorModel = true;
      });
      //result = await FactorService().setAddress(DataMemory.addresses[selectedIndex].id!);
      if (DataMemory.getWithUrSelf) {
        if (prefs!.getInt('supplierId1') == null) {
          toastFail(
              "???????? ???????? ?? ???????????????? ???????? ?????? ?????? ???? ???????? ????????", "", context);
        } else {
          //result = await FactorService().finalizeCart(supplierId1!);
          setState(() {});
        }
      } else {
        if (prefs!.getInt('supplierId1') == null) {
          //result = await FactorService().finalizeCart(supplierId);
          setState(() {});
        } else {
          //result=await FactorService().finalizeCart(supplierId1!);
          setState(() {});
        }
      }

      setState(() {
        purchaseMethod = true;
        loadFactorModel = false;
      });
      if (loadFactorModel) {
      } else {
        setState(() {
          loadfactorDetails1 = false;
          purchaseMethod = true;
        });
        var comeFromFinalize = true;
        navigateTo(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowDetailsFinalizeFactor(
                      comeFromFinalize, DataMemory.factorId, "", false,
                      deliveryPrice: deliveryPrice)));
        });
      }
    }
  }

  void navigateTo(Function doThing) {
    doThing();
  }

  Widget bottomCardDivider() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        height: 1,
        color: const Color(0xffe3e3e3));
  }

  Widget supplierDetails() {
    return GestureDetector(
        child: isLoading
            ? Loading.circular()
            : Card(
                margin: const EdgeInsets.only(top: 5, right: 5, left: 5),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                        Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(top: 5, right: 10),
                            child: supplierName1 == null
                                ? Text('?????? ???????? ?????????? ??????????: $supplierName')
                                : Text('?????? ???????? ?????????? ??????????: $supplierName1')),
                        Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width - 60,
                            margin: const EdgeInsets.only(
                                top: 7, right: 10, left: 5, bottom: 5),
                            child: supplierAddress1 == null
                                ? Text('??????????: $supplierAddress',
                                    style: const TextStyle(fontSize: 13))
                                : Text('??????????: $supplierAddress1',
                                    style: const TextStyle(fontSize: 13)))
                      ])
                ])),
        onTap: () {
          setState(() {});
        });
  }

  Widget finalizeFactorHome() {
    return const SizedBox();
    /*  GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7), color: mainColor),
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
            alignment: Alignment.center,
            child: const Text("???????????? ?????? ????????",
                style: TextStyle(color: titleColor))),
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          if (purchaseMethod) {
            if (result.isSuccess == true) {
              ResultOperation result = await FactorService().homePay(DataMemory.factorId);
              if (result.isSuccess == true) {
                if (!mounted) return;
                */ /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNav(
                          selectedIndex: 20,
                          arg: const ["home", 0],
                        )));*/ /*
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                    ShowDetailsFinalizeFactor(true,DataMemory.factorId,"home",true)));

              } else {
                if (!mounted) return;
                toastFail('?????? ???? ????????????', '?????????? ?????? ??????', context);
              }
            } else {
              if (!mounted) return;
              toastFail('?????????? ???? ??????', result.message ?? '', context);
            }
          } else {
            ResultOperation result = await FactorService()
                .setAddress(DataMemory.addresses[selectedIndex].id!);
            if (result.isSuccess == true) {
              result = await FactorService().finalizeCart();
              if (result.isSuccess == true) {
                ResultOperation result = await FactorService().homePay(DataMemory.factorId);
                if (result.isSuccess == true) {
                  if (!mounted) return;
                  */ /*   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNav(
                            selectedIndex: 20,
                            arg: const ["home", 0],
                          )));*/ /*
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ShowDetailsFinalizeFactor(true,widget.factorModelId,"home",true)));

                } else {
                  if (!mounted) return;
                  toastFail('?????? ???? ????????????', '?????????? ?????? ??????', context);
                }
              } else {
                if (!mounted) return;
                toastFail('?????????? ???? ??????', result.message ?? '', context);
              }
            } else {
              if (!mounted) return;
              toastFail('?????????? ???? ??????', result.message ?? '', context);
            }
          }
          setState(() {
            isLoading = false;
          });
        });*/
  }

  Widget finalizeFactorOnline() {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7), color: Colors.white),
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(bottom: 20, right: 5, left: 5),
            alignment: Alignment.center,
            child: const Text(
                " ???????????? ???????????? (?????? ???? ?????????? ?????? ??????????  ?????? ???? ???????????? ????????)",
                style: TextStyle(color: Colors.black))),
        bankChoice(),
        const SizedBox(
          height: 30,
        ),
        /*   GestureDetector(
        child:
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: mainColor),
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(bottom: 20, right: 5, left: 5),
            alignment: Alignment.center,
            child: const Text("???????????? ????????????", style: TextStyle(color: titleColor))),
        onTap: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const FinalizeOrder()));

          setState(() {
            isLoading = true;
          });
          ResultOperation result = await FactorService().setAddress(DataMemory.addresses[selectedIndex].id!);
          if (result.isSuccess == true) {
            result = await FactorService().finalizeCart();
            if (!mounted) return;
            if (result.isSuccess == true) {
              setState(() {
                wasPaying = true;
              });
              String payUrl = await FactorService().onlinePay();
                await launchUrl(Uri.parse(payUrl));
            } else {
              toastFail('?????????? ???? ??????', result.message ?? '', context);
            }
          } else {
            if (!mounted) return;
            toastFail('?????????? ???? ??????', result.message ?? '', context);
          }
          setState(() {
            isLoading = false;
          });
        });*/
      ],
    );
  }

  Widget selectAddress() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: DataMemory.addresses.length,
        itemBuilder: (context, index) {
          return item(DataMemory.addresses[index], index);
        });
  }

  Widget item(AddressModel model, int indexSelected) {
    return GestureDetector(
        child: Card(
            margin: const EdgeInsets.only(top: 5, right: 5),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.only(right: 10),
                  child: indexSelected == selectedIndex
                      ? const Icon(Icons.radio_button_checked, color: mainColor)
                      : const Icon(Icons.circle_outlined)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 5, right: 10),
                        child: Text('???????????? ??????????: ${model.buyerName!}')),
                    Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width - 100,
                        margin: const EdgeInsets.only(
                            top: 7, right: 10, left: 5, bottom: 5),
                        child: Text('??????????: ${model.buyerAddress!}',
                            style: const TextStyle(fontSize: 13))),
                  ]),
              GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: Image.asset(
                      'assets/images/edit1.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  onTap: () async {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNav(selectedIndex: 11, arg: model)))
                        .then((value) {
                      setState(() {
                        isLoading = true;
                        getData();
                      });
                    });
                  })
            ])),
        onTap: () {
          setState(() {
            selectedIndex = indexSelected;

            isLoading = true;

            getData();
          });
        });
  }

  Widget bankChoice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  'assets/images/eghtesade_novin_bank_logo.png',
                  width: 100,
                  height: 120,
                ),
              ),
              const Text("???????? ???????????? ????????")
            ],
          ),
          onTap: () async {
            setState(() {
              isLoading = true;
            });
            if (purchaseMethod) {
              if (result.isSuccess == true) {
                setState(() {
                  wasPaying = true;
                });
                // String payUrl = await FactorService().onlinePayEghtesad();
                // await launchUrl(Uri.parse(payUrl));
                await launchUrl(
                    Uri.parse(
                        'https://golpouneh.com/Sale/SalePayment/Payment?saleFactorId=${DataMemory.factorId}&bankName=13'),
                    mode: LaunchMode.externalApplication);
              } else {
                toastFail('?????????? ???? ??????', result.message ?? '', context);
              }
            } else {
              ResultOperation result = await FactorService()
                  .setAddress(DataMemory.addresses[selectedIndex].id!);
              if (result.isSuccess == true) {
                if (DataMemory.getWithUrSelf) {
                  if (prefs!.getInt('supplierId1') == null) {
                    toastMessage(
                        "???????? ???????? ?? ???????????????? ???????? ?????? ?????? ???? ???????? ????????", "",
                        success: false);
                  } else {
                    result = await FactorService().finalizeCart(supplierId1!);
                    setState(() {});
                  }
                } else {
                  if (prefs!.getInt('supplierId1') == null) {
                    result = await FactorService().finalizeCart(supplierId);
                    setState(() {});
                  } else {
                    result = await FactorService().finalizeCart(supplierId1!);
                    setState(() {});
                  }
                }

                if (!mounted) return;
                if (result.isSuccess == true) {
                  setState(() {
                    wasPaying = true;
                  });
                  // String payUrl = await FactorService().onlinePayEghtesad();
                  // await launchUrl(Uri.parse(payUrl));
                  await launchUrl(
                      Uri.parse(
                          'https://golpouneh.com/Sale/SalePayment/Payment?saleFactorId=${DataMemory.factorId}&bankName=13'),
                      mode: LaunchMode.externalApplication);
                } else {
                  toastFail('?????????? ???? ??????', result.message ?? '', context);
                }
              } else {
                if (!mounted) return;
                toastFail('?????????? ???? ??????', result.message ?? '', context);
              }
            }
            setState(() {
              isLoading = false;
            });
          },
        ),
        GestureDetector(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  'assets/images/keshavarzi_bank_logo.png',
                  width: 100,
                  height: 120,
                ),
              ),
              const Text("???????? ??????????????")
            ],
          ),
          onTap: () async {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => const FinalizeOrder()));

            setState(() {
              isLoading = true;
            });
            if (!mounted) return;
            if (purchaseMethod) {
              if (result.isSuccess == true) {
                setState(() {
                  wasPaying = true;
                });
                ///////////////////////////////////////
                // String payUrl = await FactorService().onlinePayEghtesad();
                // await launchUrl(Uri.parse(payUrl));
                await launchUrl(
                    Uri.parse(
                        'https://golpouneh.com/Sale/SalePayment/Payment?saleFactorId=${DataMemory.factorId}&bankName=11'),
                    mode: LaunchMode.externalApplication);
              } else {
                toastFail('?????????? ???? ??????', result.message ?? '', context);
              }
            } else {
              ResultOperation result = await FactorService()
                  .setAddress(DataMemory.addresses[selectedIndex].id!);
              if (result.isSuccess == true) {
                if (DataMemory.getWithUrSelf) {
                  if (prefs!.getInt('supplierId1') == null) {
                    toastMessage(
                        "???????? ???????? ?? ???????????????? ???????? ?????? ?????? ???? ???????? ????????", "",
                        success: false);
                  } else {
                    result = await FactorService().finalizeCart(supplierId1!);
                    setState(() {});
                  }
                } else {
                  if (prefs!.getInt('supplierId1') == null) {
                    result = await FactorService().finalizeCart(supplierId);
                    setState(() {});
                  } else {
                    result = await FactorService().finalizeCart(supplierId1!);
                    setState(() {});
                  }
                }

                if (!mounted) return;
                if (result.isSuccess == true) {
                  setState(() {
                    wasPaying = true;
                  });
                  // String payUrl = await FactorService().onlinePayEghtesad();
                  // await launchUrl(Uri.parse(payUrl));

                  await launchUrl(
                      Uri.parse(
                          'https://golpouneh.com/Sale/SalePayment/Payment?saleFactorId=${DataMemory.factorId}&bankName=11'),
                      mode: LaunchMode.externalApplication);
                } else {
                  toastFail('?????????? ???? ??????', result.message ?? '', context);
                }
              } else {
                if (!mounted) return;
                toastFail('?????????? ???? ??????', result.message ?? '', context);
              }
            }
            setState(() {
              isLoading = false;
            });
          },
        ),
      ],
    );
  }

  void toastMessage(title, message, {bool success = true}) {
    if (success) {
      toastSuccess(title, message, context);
    } else {
      toastFail(title, message, context);
    }
  }
}

class FinalizeOrder extends StatefulWidget {
  const FinalizeOrder({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FinalizeOrderState();
}
