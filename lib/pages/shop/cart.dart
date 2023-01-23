import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:gol_pouneh/controller/delivery_price_controller/delivery_price_controller.dart';
import 'package:gol_pouneh/pages/shop/discount_code.dart';
import 'package:gol_pouneh/services/cart.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import '../../models/product.dart';
import '../../models/result_operation.dart';
import '../../shared/check_network.dart';
import '../../shared/converter.dart';
import '../../shared/loading.dart';
import '../../shared/toast.dart';
import '../../shared/url.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final DeliveryPriceController deliveryPriceController =
      Get.put(DeliveryPriceController());
  late List<ProductModel> cartProducts;
  bool isLoading = true;
  bool isChanging = false;
  late double totalPrice;
  double? payWithoutDiscount;
  bool checkedOnce = false;
  bool hasDiscount = false;

  @override
  void initState() {
    totalPrice = 0;
    payWithoutDiscount = 0;
    getData();
    super.initState();
  }

  void getData() async {
    cartProducts = await CartService().cartProducts();
    for (var i in cartProducts) {
      if (i.price == i.saleOrderProductFinalPrice) {
        totalPrice += i.price! * i.orderProductCount!;
      } else {
        totalPrice += i.saleOrderProductFinalPrice! * i.orderProductCount!;
      }
      // payWithoutDiscount += i.price! * i.orderProductCount!;
      payWithoutDiscount = cartProducts.first.SaleFactorDiscountAmmount ?? 0;

      print(
          'payWithoutDiscount${cartProducts.first.SaleFactorDiscountAmmount}');
    }
    setState(() {
      isLoading = false;
    });
  }

  TextEditingController enterDiscountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          checkedOnce = false;
        });
        checkNavigator(checkedOnce, context, () {
          totalPrice = 0;
          payWithoutDiscount = 0;
          getData();
        });
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNav(
                        selectedIndex: 0,
                      )));
          return true;
        },
        child: Scaffold(
          appBar: appBar('سبد خرید'),
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/banner.jpg"),
                    fit: BoxFit.cover),
              ),
              child: isLoading
                  ? Loading.circular()
                  : cartProducts.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/images/cart_empty.png',
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: homeBackgroundColor,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Text(
                                  'سبد خرید شما خالی می باشد',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ])
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Expanded(child: products()),
                              // if(payWithoutDiscount ==0)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: textInput(
                                          'کد تخفیف',
                                          enterDiscountController,
                                          Icons.discount),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(140, 50),
                                              backgroundColor: mainColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8))),
                                          onPressed: () async {
                                            setState(() {
                                              if (enterDiscountController
                                                  .text.isEmpty) {
                                                toastFail(
                                                    "لطفا کد تخفیف را وارد کنید",
                                                    "",
                                                    context);
                                              } else {
                                                setDiscountCode();
                                              }
                                            });
                                          },
                                          child: const Text('اعمال کد تخفیف',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              // discountCodeBtn(),
                              summary()
                            ])),
        ),
      ),
    );
  }

  setDiscountCode() async {
    var setDiscountCode = await CartService()
        .setDiscountCode(enterDiscountController.text.toString());
    print(setDiscountCode.Type);
    if (setDiscountCode.Type == 0) {
      toastSuccess(setDiscountCode.message ?? '', "", context);
    } else {
      toastFail(setDiscountCode.message ?? '', "", context);

      // discountCodeResult=setDiscountCode.message;
    }
    setState(() {});
  }

  Widget discountCodeBtn() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width, 50),
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () async {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => const DiscountCode()))
                .then((value) {
              print(value);
              if (value != null) {
                totalPrice = 0;
                payWithoutDiscount = 0;
                getData();
              }
            });
          },
          child: const Text('دریافت کد تخفیف',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold))),
    );
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
        padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Loading.circular())
                  : price(),
              isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Loading.circular())
                  : selectAddress()
            ]));
  }

  Widget selectAddress() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(140, 48),
            backgroundColor: mainColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () async {
          String totalPrice1 = toman(totalPrice);
          print(totalPrice1);
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => BottomNav(
                      selectedIndex: 24,
                      arg: [DataMemory.factorId, totalPrice1])))
              .then((value) =>
                  {totalPrice = 0, payWithoutDiscount = 0, getData()});
        },
        child: const Text('ادامه فرآیند خرید',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold)));
  }

  Widget price() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('قیمت',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey)),
          Row(children: [
            if (payWithoutDiscount != 0) ...[
              const Text('تومان ',
                  style: TextStyle(fontSize: 13, color: Colors.black54)),
              Text(toman(totalPrice),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.redAccent,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 3))
            ],
          ]),
          Row(children: [
            const Text('تومان ',
                style: TextStyle(fontSize: 13, color: Colors.black54)),
            Text(toman(totalPrice - (payWithoutDiscount ?? 0)),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black))
          ]),
          const SizedBox(
            height: 10,
          )
        ]);
  }

  Widget removeFromCart(ProductModel model) {
    return GestureDetector(
        child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(55))),
            child: const Icon(Icons.remove, size: 20, color: Colors.white)),
        onTap: () async {
          setState(() {
            if (model.orderProductCount! <= 0) {
              toastDanger(model.title!, 'از سبد خرید کسر گردید', context);
            } else {
              model.orderProductCount = model.orderProductCount! - 1;
            }
            // isLoading=true;
            //isChanging = true;
          });
          ResultOperation result =
              await CartService().editCart(model.id!, model.orderProductCount!);

          if (!mounted) return;
          if (result.isSuccess == true) {
            //  toastDanger(model.title!, 'از سبد خرید کسر گردید', context);
            setState(() {
              if (model.price == model.saleOrderProductFinalPrice) {
                totalPrice -= model.price!;
                deliveryPriceController.totalPrice.value -= model.price!;
              } else {
                totalPrice -= model.saleOrderProductFinalPrice!;
              }
              // payWithoutDiscount -= model.price!;
            });
          } else {
            toastFail(
                model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
            model.orderProductCount = model.orderProductCount! + 1;
          }
          setState(() {
            //isChanging = false;
          });
          if (model.orderProductCount! == 0) {
            setState(() {
              cartProducts.remove(model);
            });
          }
        });
  }

  Widget addToCart(ProductModel model) {
    return GestureDetector(
        child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.all(Radius.circular(55))),
            child: const Icon(Icons.add, size: 20, color: Colors.white)),
        onTap: () async {
          setState(() {
            model.orderProductCount = model.orderProductCount! + 1;
            //isChanging = true;
          });
          ResultOperation result =
              await CartService().editCart(model.id!, model.orderProductCount!);
          if (!mounted) return;

          if (result.isSuccess == true) {
            //    toastSuccess(model.title!, 'به سبد خرید اضافه گردید', context);

            setState(() {
              if (model.price == model.saleOrderProductFinalPrice) {
                totalPrice += model.price!;
                deliveryPriceController.totalPrice.value += model.price!;
              } else {
                totalPrice += model.saleOrderProductFinalPrice!;
              }
              // payWithoutDiscount += 10;
            });
          } else {
            toastFail(
                model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
            model.orderProductCount = model.orderProductCount! - 1;
          }
          // setState(() {
          //   isChanging = false;
          // });
        });
  }

  Widget productItem(ProductModel model) {
    return GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            margin: const EdgeInsets.only(left: 5, top: 2, bottom: 8),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 4)],
                borderRadius: BorderRadius.all(Radius.circular(13))),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CachedNetworkImage(
                      imageUrl: newImageUrl + model.imgUrl!,
                      height: 110,
                      width: 110,
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
                      width: MediaQuery.of(context).size.width - 179,
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
                                child: model.price ==
                                        model.saleOrderProductFinalPrice
                                    ? Text(
                                        'قیمت: ${toman(model.price! * model.orderProductCount!)} تومان',
                                        style: const TextStyle(fontSize: 13))
                                    : Text(
                                        'قیمت تخفیف خورده: ${toman(model.saleOrderProductFinalPrice! * model.orderProductCount!)} تومان',
                                        style: const TextStyle(
                                            fontSize: 13, color: Colors.red)))
                          ])),
                  Container(
                      width: 40,
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.only(top: 6, bottom: 8),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addToCart(model),
                            Text(model.orderProductCount.toString()),
                            removeFromCart(model)
                          ]))
                ])),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNav(
                selectedIndex: 19,
                arg: [model, false],
              ),
            ),
          ).then(
              (value) => {totalPrice = 0, payWithoutDiscount = 0, getData()});
        });
  }

  Widget products() {
    return isLoading
        ? Loading.circular()
        : Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(right: 10, left: 4),
                itemCount: cartProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return productItem(cartProducts[index]);
                }));
  }

  Widget textInput(
      String title, TextEditingController controller, IconData icon,
      [TextInputType type = TextInputType.text]) {
    return Container(
        margin: const EdgeInsets.only(top: 25),
        height: 55,
        width: 320,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: homeBackgroundColor),
        child: TextFormField(
            controller: controller,
            textDirection: type == TextInputType.emailAddress
                ? TextDirection.ltr
                : TextDirection.rtl,
            keyboardType: type,
            onChanged: (text) {
              controller.text = convertNumberToEnglish(controller.text);
              controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: controller.text.length));
            },
            decoration: InputDecoration(
                labelText: title,
                labelStyle: const TextStyle(color: Colors.black87),
                fillColor: mainColor,
                prefixIcon: Icon(icon),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColor, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColor, width: 2),
                    borderRadius: BorderRadius.circular(15)))));
  }
}
