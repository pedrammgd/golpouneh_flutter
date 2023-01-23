import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gol_pouneh/models/survey.dart';
import 'package:gol_pouneh/services/delivery.dart';
import 'package:gol_pouneh/services/survey.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/factor.dart';
import '../../models/product.dart';
import '../../models/result_operation.dart';
import '../../services/account.dart';
import '../../services/cart.dart';
import '../../services/factor.dart';
import '../../shared/bottom_nav.dart';
import '../../shared/color.dart';
import '../../shared/converter.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';
import '../../shared/toast.dart';
import '../../shared/url.dart';

class ShowDetailsFinalizeFactor extends StatefulWidget {
  final bool comeFromFinalize;
  final int factorModelId;
  final String homePayment;
  final bool bankButtonPressed;
  final double deliveryPrice;

  const ShowDetailsFinalizeFactor(this.comeFromFinalize, this.factorModelId,
      this.homePayment, this.bankButtonPressed,
      {super.key, required this.deliveryPrice});

  @override
  State<ShowDetailsFinalizeFactor> createState() =>
      _ShowDetailsFinalizeFactorState();
}

class _ShowDetailsFinalizeFactorState extends State<ShowDetailsFinalizeFactor> {
  List<String> questions = [];
  int selectedIndex = 0;
  List<FactorModel> factors = [];
  bool numberOfProductFactorLoading = true;
  bool wasPaying = false;
  bool showList = false;
  //late CompanyModel companyModel;
  int companyModelId = 1;
  SharedPreferences? prefs;
  late int factorId;
  int supplierId = 1;
  int? supplierId1;
  String? supplierName;
  String? supplierName1;
  String? supplierAddress;
  String? supplierAddress1;
  String factorDate = "";
  String factorNumber = "";
  bool showFactorDetails = false;
  bool isConfirm = false;
  bool purchaseMethod = false;
  bool comeFromFinalize = false;
  late ResultOperation result;
  bool loadFactorModel = false;
  bool loadProfileModel = false;
  int survey = 0;
  List<dynamic> numberOfProductFactorList = [];
  int numberOfProductFactor = 0;
  double totalPrice = 0;
  double myTotalPrice = 0;
  double payWithoutDiscount = 0;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;
  bool showSurvey = false;
  int question1 = 0;
  int question2 = 0;
  int question3 = 0;
  int question4 = 0;
  bool recError = false;
  SurveyQuestions? surveyQuestions;
  bool submitSurvey = false;
  List<ProductModel> cartProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    factorId = widget.factorModelId;
    firstNameController = TextEditingController(text: "");
    lastNameController = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    getUserInfoData();
    // loadFinalize();
    getLastFromFinalizeFactor();
    comeFromFinalize = widget.comeFromFinalize;
    getSurvey();
  }

  void delivery() async {
    Delivery result = await DeliveryService()
        .calculateDelivery(myTotalPrice.toString(), myTotalPrice.toString());
    if (result.httpStatusCode == '200') {
      print(result);
    }
  }

  void getSurvey() async {
    surveyQuestions = await SurveyService().questions();
    if (surveyQuestions!.questions != null) {
      questions.addAll(surveyQuestions!.questions!.toList());
    } else {
      recError = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: widget.bankButtonPressed
            ? appBar(
                "فاکتور",
                mainColor,
                null,
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BottomNav(selectedIndex: 0),
                          ));
                    },
                    icon: const Icon(Icons.home)))
            : appBar(
                "فاکتور",
                mainColor,
                null,
                IconButton(
                    onPressed: () {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 1);
                    },
                    icon: const Icon(Icons.arrow_back))),
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover),
            ),
            child: widgetFactor(),
          ),
          showSurvey ? surveyWidget() : Container(),
        ]),
      ),
    );
  }

  /////////////////////////////////////////
  Widget surveyWidget() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.black38, spreadRadius: 5.0, blurRadius: 5.0),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.question_answer_outlined),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "نظر سنجی",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(questions[0]),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemSurvey("😍", 1, question1, () {
                    setState(() {
                      question1 = 1;
                    });
                  }),
                  itemSurvey("😊", 2, question1, () {
                    setState(() {
                      question1 = 2;
                    });
                  }),
                  itemSurvey("😐", 3, question1, () {
                    setState(() {
                      question1 = 3;
                    });
                  }),
                  itemSurvey("🙁", 4, question1, () {
                    setState(() {
                      question1 = 4;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(questions[1]),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemSurvey("😍", 1, question2, () {
                    setState(() {
                      question2 = 1;
                    });
                  }),
                  itemSurvey("😊", 2, question2, () {
                    setState(() {
                      question2 = 2;
                    });
                  }),
                  itemSurvey("😐", 3, question2, () {
                    setState(() {
                      question2 = 3;
                    });
                  }),
                  itemSurvey("🙁", 4, question2, () {
                    setState(() {
                      question2 = 4;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(questions[2]),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemSurvey("😍", 1, question3, () {
                    setState(() {
                      question3 = 1;
                    });
                  }),
                  itemSurvey("😊", 2, question3, () {
                    setState(() {
                      question3 = 2;
                    });
                  }),
                  itemSurvey("😐", 3, question3, () {
                    setState(() {
                      question3 = 3;
                    });
                  }),
                  itemSurvey("🙁", 4, question3, () {
                    setState(() {
                      question3 = 4;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(questions[3]),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemSurvey("😍", 1, question4, () {
                    setState(() {
                      question4 = 1;
                    });
                  }),
                  itemSurvey("😊", 2, question4, () {
                    setState(() {
                      question4 = 2;
                    });
                  }),
                  itemSurvey("😐", 3, question4, () {
                    setState(() {
                      question4 = 3;
                    });
                  }),
                  itemSurvey("🙁", 4, question4, () {
                    setState(() {
                      question4 = 4;
                    });
                  }),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      bool answer = await SurveyService().sendAnswers(
                          surveyQuestions!,
                          [question1, question2, question3, question4]);
                      if (answer) {
                        doThing(() {
                          submitSurvey = true;
                          toastSuccess(
                              "موفقیت", "نظر شما با موفقیت ثبت شد", context);
                        });
                      } else {
                        doThing(() {
                          toastDanger(
                              "خطا", "متاسفانه دیدگاه شما ثبت نشد", context);
                        });
                      }
                      setState(() {
                        showSurvey = false;
                      });
                    },
                    child: const Text("اتمام نظر سنجی")),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  void doThing(Function() doThing) {
    doThing();
  }

  Widget itemSurvey(String emoji, int i, int question, Function doThing) {
    return GestureDetector(
      onTap: () {
        setState(() {
          doThing();
        });
      },
      child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == question ? Colors.green : Colors.white,
          ),
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 20.0),
          )),
    );
  }

  Future<bool> onWillPop() {
    if (widget.bankButtonPressed) {
      // Phoenix.rebirth(context)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    } else {
      Navigator.of(context).pop();
    }

    return Future.value(false);
  }

  Widget widgetFactor() {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const SizedBox(
          height: 15,
        ),
        widget.bankButtonPressed ? factorDetail() : Container(),
        Container(
          padding: const EdgeInsets.only(right: 10),
          child: const Text(
            "خلاصه فاکتور :",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              loadProfileModel
                  ? Loading.circular()
                  : rowFactorDetails("نام و نام خانوادگی",
                      "${DataMemory.profile!.firstName!} ${DataMemory.profile!.lastName!}"),
              bottomCardDivider(),
              loadProfileModel
                  ? Loading.circular()
                  : rowFactorDetails(
                      "شماره تماس", DataMemory.profile!.phoneNumber!),
              bottomCardDivider(),
              // loadFactorModel
              //     ? Loading.circular()
              //     : rowFactorDetails("تاریخ سفارش : ", factorDate),
              // bottomCardDivider(),
              // loadFactorModel
              //     ? Loading.circular()
              //     : rowFactorDetails("شماره سفارش :", factorNumber),
              // bottomCardDivider(),
              // numberOfProductFactorLoading
              //     ? Loading.circular()
              //     : rowFactorDetails("مجموع کل فاکتور :", toman(totalPrice)),
              bottomCardDivider(),
              numberOfProductFactorLoading
                  ? Loading.circular()
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: numberOfProductFactorList.length,
                      itemBuilder: (context, index) {
                        return factorProductItem(
                            numberOfProductFactorList[index]);
                      }),
              const SizedBox(
                height: 5,
              ),
              numberOfProductFactorLoading
                  ? Loading.circular()
                  : Column(
                      children: [
                        rowFactorDetails(
                            "تعداد کالا", numberOfProductFactor.toString()),
                        if (numberOfProductFactorList
                                .first.SaleFactorDiscountAmmount !=
                            null)
                          rowFactorDetails("تخفیف",
                              '${toman(numberOfProductFactorList.first.SaleFactorDiscountAmmount)} تومان'),
                        rowFactorDetails(
                            "قیمت کل", '${toman(myTotalPrice)} تومان'),
                        if (widget.deliveryPrice != 0)
                          rowFactorDetails("هزینه پیک",
                              '${toman(widget.deliveryPrice)} تومان'),
                      ],
                    ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        /*  const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: const Text(
            "مشخصات کاربر :",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
          ),
        )*/
        // loadProfileModel ? Loading.circular() : userInfo(),
        //  const SizedBox(
        //    height: 15,
        //  ),
        //factorProductDetails(),
        widget.bankButtonPressed
            ? Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 20),
                  height: 45,
                  child: submitSurvey
                      ? const Text("شما در نظر سنجی شرکت کرده اید")
                      : questions.isNotEmpty
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showSurvey = true;
                                });
                              },
                              child: const Text("شرکت در نظر سنجی"),
                            )
                          : !recError
                              ? const Text("در حال دریافت نظر سنجی...")
                              : const Text("خطا در دریافت نظر سنجی"),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget factorDetail() {
    return loadFactorModel
        ? Loading.circular()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.homePayment == "home"
                  ? Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image.asset(
                            'assets/images/check.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            alignment: Alignment.center,
                            child: const Text('پرداخت شما موفقیت امیز بود.',
                                style: TextStyle(fontSize: 17))),
                      ]),
                    )
                  : Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(children: [
                        isConfirm
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  'assets/images/check.png',
                                  width: 30,
                                  height: 30,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  'assets/images/fail.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                        isConfirm
                            ? Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                alignment: Alignment.center,
                                child: const Text('پرداخت شما موفقیت امیز بود.',
                                    style: TextStyle(fontSize: 17)))
                            : Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                alignment: Alignment.center,
                                child: const Text(
                                    'پرداخت شما موفقیت امیز نبود.',
                                    style: TextStyle(fontSize: 17)))
                      ]),
                    ),
            ],
          );
  }

  Widget bottomCardDivider() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        height: 1,
        color: Colors.white);
  }

/*
  Widget factorProductDetails() {
    return numberOfProductFactorLoading
        ? Loading.circular()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: const Text(
                  " جزییات سفارش:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: numberOfProductFactorList.length,
                      itemBuilder: (context, index) {
                        return factorProductItem(numberOfProductFactorList[index]);
                      }))
            ],
          );
  }*/

  Widget factorProductItem(ProductModel model) {
    return GestureDetector(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* Container(
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black38, width: 1),
                        borderRadius:  BorderRadius.circular(10)),
                    child: removeFromCart(model) ,
                  )*/

              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 23,
                        child: Text(model.title ?? '',
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w900))),
                    Html(
                        data: model.intro ?? '',
                        style: {'p': Style(fontSize: FontSize(13))}),
                    SizedBox(
                        height: 35,
                        // margin: const EdgeInsets.only(right: 7.5),
                        // margin: EdgeInsets.only(bottom: 5, top: 10),
                        child: Text('قیمت واحد: ${toman(model.price!)} تومان',
                            style: const TextStyle(fontSize: 13))),
                    model.price! == model.saleOrderProductFinalPrice
                        ? Container()
                        :
                        // if(model.SaleFactorDiscountAmmount !=null)
                        SizedBox(
                            height: 35,
                            // margin: const EdgeInsets.only(right: 7.5),
                            // margin: EdgeInsets.only(bottom: 5, top: 10),
                            child: Text(
                                'قیمت کل بدون تخفیف: ${toman(model.price! * model.orderProductCount!)} تومان',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2))),
                    model.price! == model.saleOrderProductFinalPrice
                        ? SizedBox(
                            height: 35,
                            // margin: const EdgeInsets.only(right: 7.5),
                            // margin: EdgeInsets.only(bottom: 5, top: 10),
                            child: Text(
                                'قیمت کل : ${toman((model.price! * model.orderProductCount!))} تومان',
                                style: const TextStyle(
                                  fontSize: 13,
                                )))
                        : SizedBox(
                            height: 35,
                            // margin: const EdgeInsets.only(right: 7.5),
                            // margin: EdgeInsets.only(bottom: 5, top: 10),
                            child: Text(
                                'قیمت کل: ${toman(model.saleOrderProductFinalPrice! * model.orderProductCount!)} تومان',
                                style: const TextStyle(fontSize: 13))),
                    Text(' تعداد : ${model.orderProductCount!.toString()}',
                        style: const TextStyle(fontSize: 13)),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
              CachedNetworkImage(
                  imageUrl: newImageUrl + model.imgUrl!,
                  height: 120,
                  width: 100,
                  imageBuilder: (context, imageProvider) => Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ))),
                  placeholder: (context, url) => SizedBox(
                      height: 110,
                      width: 110,
                      child: Loading.circular(mainColor)),
                  errorWidget: (context, url, error) => const SizedBox()),
            ]),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BottomNav(selectedIndex: 19, arg: [model, true])));
        });
  }

  Widget plusOne(ProductModel model) {
    return GestureDetector(
        child: Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.all(Radius.circular(55))),
            child: const Icon(Icons.add, size: 20, color: Colors.white)),
        onTap: () async {
          setState(() {
            model.orderProductCount = model.orderProductCount! + 1;
            //isLoading = true;
          });
          ResultOperation result =
              await CartService().editCart(model.id!, model.orderProductCount!);
          if (!mounted) return;
          if (result.isSuccess == true) {
            setState(() {
              totalPrice = 0;
            });
            getNumberOfProductFromFactor();

            //  toastSuccess(model.title!, 'به سبد خرید اضافه گردید', context);
            // setState(() {
            //   totalPrice += model.price!;
            // });
          } else {
            toastFail(
                model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
            model.orderProductCount = model.orderProductCount! - 1;
          }
          setState(() {
            //isLoading = false;
          });
        });
  }

  Widget minusOne(ProductModel model) {
    return GestureDetector(
        child: Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(55))),
            child: const Icon(Icons.remove, size: 20, color: Colors.white)),
        onTap: () async {
          if (model.orderProductCount! == 1) {
            toastFail(model.title ?? '',
                'برای حذف محصول دکمه ضربدر را فشار دهید', context);

            // setState(() {
            //   cartProducts.remove(model);
            // });
          } else {
            debugPrint(model.orderProductCount.toString());
            ResultOperation result = await CartService()
                .editCart(model.id!, model.orderProductCount!);
            if (!mounted) return;
            if (result.isSuccess == true) {
              //    toastDanger(model.title!, 'از سبد خرید کسر گردید', context);
              // setState(() {
              //   totalPrice -= model.price!;
              // });
              getNumberOfProductFromFactor();
              setState(() {
                model.orderProductCount = model.orderProductCount! - 1;
                // isLoading = true;
              });
            } else {
              toastFail(
                  model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
              model.orderProductCount = model.orderProductCount! + 1;
            }
            setState(() {
              //  isLoading = false;
            });
          }
        });
  }

  void getLastFromFinalizeFactor() async {
    setState(() {
      loadFactorModel = true;
    });
    cartProducts = await CartService().cartProducts();
    for (var i in cartProducts) {
      if (i.price == i.saleOrderProductFinalPrice) {
        totalPrice += i.price! * i.orderProductCount!;
      } else {
        totalPrice += i.saleOrderProductFinalPrice! * i.orderProductCount!;
      }
      payWithoutDiscount += i.price! * i.orderProductCount!;
      setState(() {
        loadFactorModel = false;
      });
      if (loadFactorModel) {
      } else {
        getNumberOfProductFromFactor();
      }
    }

    setState(() {
      loadFactorModel = true;
    });

    // List response = await FactorService().factorHistory();
    // factors = response[0];
    // for (factorModel in factors) {
    //   if (widget.factorModelId != 0) {
    //     if (widget.factorModelId == factorModel.id) {
    //       factorNumber = factorModel.invoiceSellNo.toString();
    //       var factorDate1 = factorModel.orderDate.toString();
    //       final jalaliDate = Jalali.fromDateTime(DateTime.parse(factorDate1));
    //       factorDate =
    //           "${jalaliDate.hour}:${jalaliDate.minute} ${jalaliDate.year}/${jalaliDate.month}/${jalaliDate.day}";
    //       var isConfirm1 = factorModel.isConfirm!;
    //       setState(() {
    //         loadFactorModel = false;
    //         isConfirm = isConfirm1;
    //       });
    //       if (loadFactorModel) {
    //       } else {
    //         getNumberOfProductFromFactor();
    //       }
    //     }
    //   }
    // }
  }

  void getNumberOfProductFromFactor() async {
    setState(() {
      numberOfProductFactorLoading = true;
    });

    List response = await FactorService().factorProducts(factorId);
    numberOfProductFactorList = response;
    var numberOfProductFactor1 = numberOfProductFactorList.length;
    for (var i in numberOfProductFactorList) {
      if (i.price == i.saleOrderProductFinalPrice) {
        myTotalPrice += i.price! * i.orderProductCount!;

        payWithoutDiscount += i.price! * i.orderProductCount!;
      } else {
        myTotalPrice += i.saleOrderProductFinalPrice! * i.orderProductCount!;
      }
    }
    setState(() {
      numberOfProductFactor = numberOfProductFactor1;
      numberOfProductFactorLoading = false;
    });
  }

  Widget rowFactorDetails(subject, details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(subject), Text(details)],
    );
  }

  Widget removeFromCart(ProductModel model) {
    return InkWell(
        onTap: () async {
          setState(() {
            //isLoading = true;
          });
          ResultOperation result = await CartService().editCart(model.id!, 0);
          if (!mounted) return;
          if (result.isSuccess == true) {
            toastSuccess(model.title!, 'از سبد خرید حذف گردید', context);
            setState(() {
              model.orderProductCount = 0;
              totalPrice = 0;
            });
            getNumberOfProductFromFactor();
            numberOfProductFactorList.remove(model);
            totalPrice = 0;
          } else {
            toastFail(
                model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
          }
          setState(() {
            //isLoading = false;
          });
        },
        child: const Icon(Icons.close));
  }

/*  Widget userInfo() {
    return loadProfileModel
        ? Loading.circular()
        : Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              const SizedBox(width: double.infinity),/
              rowFactorDetails("نام و نام خانوادگی",
                  "${DataMemory.profile!.firstName!} ${DataMemory.profile!.lastName!}"),
              const Divider(),
              rowFactorDetails("شماره تماس", DataMemory.profile!.phoneNumber!),
            ]),
          );
  }*/

  void toastMessage(title, message) {
    toastSuccess(title, message, context);
  }

  void getUserInfoData() async {
    setState(() {
      loadProfileModel = true;
    });
    DataMemory.profile =
        await AccountService().getProfileInfo(DataMemory.userId);
    setState(() {
      loadProfileModel = false;
      firstNameController =
          TextEditingController(text: DataMemory.profile!.firstName);
      lastNameController =
          TextEditingController(text: DataMemory.profile!.lastName);
      emailController = TextEditingController(text: DataMemory.profile!.email);
    });
  }
}
