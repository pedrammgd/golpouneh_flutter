import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gol_pouneh/models/factor.dart';
import 'package:gol_pouneh/models/payment_way.dart';
import 'package:gol_pouneh/pages/factor/show_finalize_factor.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/loading.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/product.dart';
import '../../services/factor.dart';
import '../../shared/appbar.dart';
import '../../shared/color.dart';
import '../../shared/converter.dart';
import '../../shared/url.dart';

class FactorProductsState extends State<FactorProducts>
    with WidgetsBindingObserver {
  List<ProductModel> productList = [];
  bool isLoading = true;
  late FactorModel model;
  double totalPrice = 0;
  bool visibility = false;
  bool wasPaying = false;
  String kindOfPaying = "";
  PaymentWay paymentWay = PaymentWay();
  String bankName = "";
  String? registerDateTime;

  @override
  void initState() {
    model = widget.model;
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getData();
    getPaymentWay();
    setState(() {
      visibility = false;
    });
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
                        false,
                        model.id!,
                        "online",
                        true,
                        deliveryPrice: 0,
                      )));
        }
        super.didChangeAppLifecycleState(state);
        break;
      default:
        super.didChangeAppLifecycleState(state);
        break;
    }
  }

  void getPaymentWay() async {
    paymentWay = await FactorService().factorDetails(model.id!);
    //  print(paymentWay[0].bankNames.toString());
    if (paymentWay.id != null) {
      var bankName1 = paymentWay.bankNames;
      bankName = bankName1.toString();
      setState(() {
        bankName = bankName.toString();
      });
      Jalali jalali =
          Jalali.fromDateTime(DateTime.parse(paymentWay.registerDate!));
      registerDateTime =
          "${jalali.year}/${jalali.month}/${jalali.day} ${jalali.hour}:${jalali.minute}";
    } else {
      bankName = "";
      setState(() {
        bankName == "0";
      });
    }
  }

  void getData() async {
    var response = await FactorService().factorProducts(model.id!);
    for (var i in response) {
      totalPrice += i.price! * i.orderProductCount!;
    }
    setState(() {
      productList = response;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(model.isConfirm!.toString());
    return Scaffold(
        appBar: appBar('جزئیات فاکتور'),
        body: Container(
            padding: const EdgeInsets.only(top: 20),
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isLoading
                      ? Loading.circular()
                      : SizedBox(
                          height: visibility ? 300 : 400,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                return productItem(productList[index]);
                              }),
                        ),

                  Container(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 1,
                          color: Colors.black87,
                        ),
                        Column(children: [
                          paymentWay.isConfirm != null && paymentWay.isConfirm!
                              ? Container()
                              : Column(
                                  children: [
                                    paymentWay.isConfirm != null &&
                                            paymentWay.isConfirm!
                                        ? Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: const Text(
                                              "امکان پرداخت برای این فاکتور وجود ندارد",
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                        : Column(
                                            children: [
                                              bankName == "33"
                                                  ? Container()
                                                  : finalizeFactorHome(),
                                              finalizeFactorOnline(),
                                            ],
                                          ),
                                  ],
                                ),
                          // Factor Details
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  paymentWay.isPayment != null &&
                                          paymentWay.isPayment!
                                      ? Text(
                                          "پرداخت انجام شده است",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(color: Colors.green),
                                        )
                                      : Text(
                                          "پرداخت انجام نشده است",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!
                                              .copyWith(color: Colors.red),
                                        ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("نام خریدار"),
                                      Text(paymentWay.buyerName ??
                                          "نام خریدار ثبت نشده است"),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("نشانی خریدار"),
                                      Text(paymentWay.buyerAddress ??
                                          "نشانی خریدار ثبت نشده است"),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("شماره همراه"),
                                      Flexible(
                                          child: Text(paymentWay.mobile ??
                                              "شماره همراه خریدار ثبت نشده است")),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("شماره پستی"),
                                      Text(paymentWay.postalCode ??
                                          "شماره پستی ثبت نشده است"),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("تاریخ ثبت سفارش"),
                                      Text(registerDateTime ??
                                          "تاریخ ثبت نشده است"),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("شماره سفارش"),
                                      Text(model.invoiceSellNo ??
                                          "خطا در دریافت"),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("مبلغ نهایی بدون تخفیف"),
                                      Text(paymentWay
                                                  .payableAmountWithoutDiscount ==
                                              null
                                          ? "خطا"
                                          : "${paymentWay.payableAmountWithoutDiscount!.substring(0, paymentWay.payableAmountWithoutDiscount!.length - 2)}تومان"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // End Factor Details
                        ]),
                        bankChoice(),
                        const SizedBox(
                          height: 10,
                        ),
                        summary(),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                  //     summary(),
                ],
              ),
            )));
  }

  Widget finalizeFactorHome() {
    return const SizedBox();
    /*GestureDetector(
        child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(7), color: mainColor),
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
            alignment: Alignment.center,
           child: const Text("پرداخت درب منزل", style: TextStyle(color: titleColor))),
        onTap: () async {
          ResultOperation result = await FactorService().homePay(0);
          if (result.isSuccess == true) {
            if (!mounted) return;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                ShowDetailsFinalizeFactor(false,model.id!,"home",true)));

          } else {
            if (!mounted) return;
            toastFail('خطا در پرداخت', 'درگاه باز نشد', context);
          }
        });*/
  }

  Widget finalizeFactorOnline() {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: mainColor),
          width: MediaQuery.of(context).size.width,
          height: 50,
          margin: const EdgeInsets.only(bottom: 20, right: 5, left: 5),
          alignment: Alignment.center,
          child: const Text(" پرداخت آنلاین",
              style: TextStyle(color: titleColor))),
      onTap: () {
        setState(() {
          wasPaying = true;
          visibility = true;
        });
      },
    );
  }

  Widget bankChoice() {
    return visibility
        ? Row(
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
                    const Text("بانک اقتصاد نوین")
                  ],
                ),
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://golpouneh.com/Sale/SalePayment/Payment?saleFactorId=${model.id}&bankName=11'));
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
                    const Text("بانک کشاورزی")
                  ],
                ),
                onTap: () async {
                  await launchUrl(Uri.parse(
                      'https://golpouneh.com/Sale/SalePayment/Payment?saleFactorId=${model.id}&bankName=13'));
                },
              ),
            ],
          )
        : Container();
  }

  Widget summary() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, right: 15, left: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(11)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3))
          ]),
      height: 68,
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
      child: price(),
    );
  }

  Widget selectAddress() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(140, 48),
            backgroundColor: mainColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () async {
          /* for (var i in productList) {
            ResultOperation result =
            await CartService().editCart(i.id!, i.orderProductCount!);
            print("zzzzzzzzzzzzzzzzzzzzzzzzzzz");
            print(model.id);
            print(i.id);
            if (!mounted) return;
            if (result.isSuccess == true) {
              print("به سبد خرید اضافه گردید");
             // toastSuccess(model.title!, 'به سبد خرید اضافه گردید', context);
            }
          }*/
          String totalPrice1 = toman(totalPrice);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BottomNav(
                  selectedIndex: 24, arg: [DataMemory.factorId, totalPrice1])));
        },
        child: const Text('ادامه فرآیند خرید',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold)));
  }

  Widget price() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          model.isConfirm!
              ? const Text(' پرداخت شده با قیمت نهایی :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey))
              : const Text('  قیمت نهایی :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey)),
          const Text('تومان ',
              style: TextStyle(fontSize: 13, color: Colors.black54)),
          Text(toman(totalPrice),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black))
        ]);
  }

  Widget productItem(ProductModel model) {
    return GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            margin: const EdgeInsets.only(left: 8, top: 2, bottom: 8, right: 8),
            decoration: const BoxDecoration(
                color: homeBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CachedNetworkImage(
                      imageUrl: newImageUrl + model.imgUrl!,
                      height: 100,
                      width: 100,
                      imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.contain))),
                      placeholder: (context, url) => SizedBox(
                          height: 110,
                          width: 110,
                          child: Loading.circular(mainColor)),
                      errorWidget: (context, url, error) =>
                          const SizedBox(height: 110, width: 110)),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 150,
                      height: 110,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 23,
                                margin: const EdgeInsets.only(right: 9),
                                child: Text(model.title ?? '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900))),
                            Html(
                                data: model.intro ?? '',
                                style: {'p': Style(fontSize: FontSize(13))}),
                            Container(
                                height: 35,
                                margin: const EdgeInsets.only(right: 7.5),
                                // margin: EdgeInsets.only(bottom: 5, top: 10),
                                child: Text(
                                    'قیمت: ${toman(model.price! * model.orderProductCount!)} تومان',
                                    style: const TextStyle(fontSize: 13)))
                          ])),
                  Text(
                    model.orderProductCount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[Colors.black, Colors.blue],
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 30.0, 10.0)),
                    ),
                  ),
                ])),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BottomNav(selectedIndex: 19, arg: [model, true])));
        });
  }
}

class FactorProducts extends StatefulWidget {
  final FactorModel model;

  const FactorProducts(this.model, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FactorProductsState();
}
