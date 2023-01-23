import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gol_pouneh/models/product.dart';
import 'package:gol_pouneh/models/result_operation.dart';
import 'package:gol_pouneh/services/cart.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/converter.dart';
import 'package:gol_pouneh/shared/toast.dart';
import 'package:share_plus/share_plus.dart';
import '../../shared/check_network.dart';
import '../../shared/loading.dart';
import '../../shared/url.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel model;
  final bool fromFactor;
  const ProductDetails(this.model, this.fromFactor, {Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductModel model;
  late bool fromFactor;
  bool isChanged = false;
  bool isLoading = false;
  bool checkedOnce=false;
  @override
  void initState() {
    model = widget.model;
    fromFactor = widget.fromFactor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: RefreshIndicator(
              child:  Container(
                padding: const EdgeInsets.only(top: 20),
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/banner.jpg"),
                      fit: BoxFit.cover),
                ),child:  SingleChildScrollView(
                  reverse: false,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Stack(children: [
                      topShape(), image(model)]),
                    title(),
                    intro(),
                    descriptionTitle(),
                    description()
                  ])),),
              onRefresh: ()async{
                setState(() {
                  checkedOnce=false;
                });
                checkNavigator(checkedOnce, context, () {
                  model = widget.model;
                  fromFactor = widget.fromFactor;
                });
              },
            ),
            bottomNavigationBar: bottomSummary()),
        onWillPop: () async {

          Navigator.pop(context, isChanged);
          return Future.value(false);
          // return Navigator.maybePop(context, isChanged);
        });
  }

  Widget bottomSummary() {
    if (fromFactor) {
      return Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ]),
          height: model.orderProductCount! > 0 ? 140 : 68,
          padding: const EdgeInsets.only(left: 27, right: 27, top: 10),
          child: Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.price == model.saleOrderProductFinalPrice? price(
                      'مجموع قیمت', toman(model.price!* model.orderProductCount!)):
                  price(' مجموع قیمت تخفیف خورده', toman(model.saleOrderProductFinalPrice!* model.orderProductCount!)),
                  SizedBox(
                      width: 100,
                      child: Text(model.orderProductCount.toString(),
                          style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)))
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 priceWithoutDiscount('قیمت واحد', toman(model.price!)),
                  model.price == model.saleOrderProductFinalPrice? const SizedBox(): priceWithoutDiscount(' قیمت واحد تخفیف خورده', toman(model.saleOrderProductFinalPrice!)),
                  isLoading
                      ? Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Loading.circular())
                      : addToCart()
                ])
          ]));
    } else {
      return Container(
          decoration: BoxDecoration(color: homeBackgroundColor, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ]),
          height: model.orderProductCount! > 0 ? 140 : 68,
          padding: const EdgeInsets.only(left: 27, right: 27, top: 10),
          child: model.orderProductCount! > 0
              ? Column(children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.price == model.saleOrderProductFinalPrice? price(
                      'مجموع قیمت', toman(model.price!* model.orderProductCount!)):
                  price(' مجموع قیمت تخفیف خورده', toman(model.saleOrderProductFinalPrice!* model.orderProductCount!)),
                  SizedBox(
                      width: 100,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            plusOne(),
                            Text(model.orderProductCount.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            minusOne()
                          ]))
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.price == model.saleOrderProductFinalPrice? price('قیمت واحد', toman(model.price!)):
                      price(' قیمت واحد تخفیف خورده', toman(model.saleOrderProductFinalPrice!)),
                  isLoading
                      ? Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Loading.circular())
                      : removeFromCart()
                ])
          ])
              : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    model.price == model.saleOrderProductFinalPrice?  Text('${toman(model.price!)} قیمت واحد',):
                    Text('${toman(model.price!)} قیمت واحد',
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough)),
                    model.price == model.saleOrderProductFinalPrice? const SizedBox():
                    Text('${toman(model.saleOrderProductFinalPrice!)}  قیمت واحد تخفیف خورده',)

                  ],
                ),
                // Container(
                //     width: MediaQuery.of(context).size.width,
                //     padding: const EdgeInsets.only(left: 3, top: 2),
                //     alignment: Alignment.centerLeft,
                //     child: model.price == model.saleOrderProductFinalPrice
                //         ? Text('${toman(model.price!)} تومان',
                //         style: const TextStyle(fontSize: 13))
                //         : Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         Text('${toman(model.price!)} تومان',
                //             style: const TextStyle(
                //                 fontSize: 13,
                //                 color: Colors.red,
                //                 decoration: TextDecoration.lineThrough)),
                //         Text('${toman(model.saleOrderProductFinalPrice!)} تومان',
                //             style: const TextStyle(fontSize: 13)),
                //       ],
                //     )),





                isLoading
                    ? Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Loading.circular())
                    : addToCart()
              ]));
    }
  }

  Widget minusOne() {
    return GestureDetector(
        child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(55))),
            child: const Icon(Icons.remove, size: 20, color: Colors.white)),
        onTap: () async {
          setState(() {
            model.orderProductCount = model.orderProductCount! - 1;
            isLoading = true;
          });
          ResultOperation result =
          await CartService().editCart(model.id!, model.orderProductCount!);
          if (!mounted) return;
          if (result.isSuccess == true) {
            // toastDanger(model.title!, 'از سبد خرید کسر گردید', context);
            // setState(() {
            //   totalPrice -= model.price!;
            // });
          } else {
            toastFail(model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
            model.orderProductCount = model.orderProductCount! + 1;
          }
          setState(() {
            isLoading = false;
          });
          if (model.orderProductCount! == 0) {
            // setState(() {
            //   cartProducts.remove(model);
            // });
          }
        });
  }

  Widget plusOne() {
    return GestureDetector(
        child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: mainColor, borderRadius: BorderRadius.all(Radius.circular(55))),
            child: const Icon(Icons.add, size: 20, color: Colors.white)),
        onTap: () async {
          setState(() {
            model.orderProductCount = model.orderProductCount! + 1;
            isLoading = true;
          });
          ResultOperation result =
          await CartService().editCart(model.id!, model.orderProductCount!);
          if (!mounted) return;
          if (result.isSuccess == true) {
            // toastSuccess(model.title!, 'به سبد خرید اضافه گردید', context);
            // setState(() {
            //   totalPrice += model.price!;
            // });
          } else {
            toastFail(model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
            model.orderProductCount = model.orderProductCount! - 1;
          }
          setState(() {
            isLoading = false;
          });
        });
  }

  Widget addToCart() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(120, 48),
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          ResultOperation result = await CartService().editCart(model.id!, 1);
          if (!mounted) return;
          if (result.isSuccess == true) {
            setState(() {
              model.orderProductCount = 1;
              isChanged = true;
            });
          } else {
            toastFail(model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Text(fromFactor ? 'سفارش مجدد' : 'افزودن به سبد',
            style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)));
  }

  Widget removeFromCart() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 48),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          ResultOperation result = await CartService().editCart(model.id!, 0);
          if (!mounted) return;
          if (result.isSuccess == true) {
            // toastSuccess(model.title!, 'از سبد خرید حذف گردید', context);
            setState(() {
              model.orderProductCount = 0;
              isChanged = true;
            });
          } else {
            toastFail(model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
          }
          setState(() {
            isLoading = false;
          });
        },
        child: const Text('حذف از سبد',
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)));
  }

  Widget price(String text, String value) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey)),
            Row(children: [
            const Text('تومان ', style: TextStyle(fontSize: 13, color: Colors.black54)),
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))
          ])
        ]);
  }
  Widget priceWithoutDiscount(String text, String value) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Colors.grey)),
            Row(children: [
            const Text('تومان ', style: TextStyle(fontSize: 13, color: Colors.black54)),
            Text(value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black))
          ])
        ]);
  }

  Widget description() {
    return Container(
        margin: const EdgeInsets.only(top: 8, right: 27, left: 30, bottom: 30),
        child: Html(
            data: model.description ?? '',
            style: {'p': Style(fontSize:  FontSize(13.5))}));
  }

  Widget descriptionTitle() {
    return Container(
        margin: const EdgeInsets.only(top: 30, right: 20),
        child: const Text('توضیحات',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
  }

  Widget intro() {
    return Padding(
        padding: const EdgeInsets.only(right: 28, top: 7),
        child: Html(
            data: model.intro ?? '', style: {'p': Style(fontSize:  FontSize(13))}));
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 28, right: 20),
        child: Text(model.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23)));
  }

  Widget image(ProductModel model) {
    return Container(
        margin: const EdgeInsets.only(top: 140),
        alignment: Alignment.topCenter,
        child:model.imgUrl==null?Image.asset("assets/images/icon.png"):CachedNetworkImage(
            width: 310,
            height: 200,
            imageUrl: newImageUrl + model.imgUrl!,
            imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider, fit: BoxFit.contain))),
            placeholder: (context, url) =>
                SizedBox(width: 310, height: 200, child: Loading.circular(mainColor)),
            errorWidget: (context, url, error) =>
            const SizedBox(width: 310, height: 200))
    );
  }

  Widget topShape() {
    return ClipPath(
        clipper: MyShape(),
        child: Container(
            height: 320,
            color: secondaryColor,
            child: Column(children: [
              const SizedBox(height: 33),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(20),
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: const Icon(AntIcons.arrowRightOutlined, color: mainColor)),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(20),
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: const Icon(AntIcons.shareAltOutlined, color: mainColor)),
                    onTap: () {
                      Share.share(
                          'این محصول رو در گل پونه ببین  \nhttp://golpouneh.com/Product/${model.id}/',
                          subject: model.title ?? 'گل پونه');
                    })
              ])
            ])));
  }
}

class MyShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 100);
    var control1 = Offset(size.width * 0.5, size.height);
    var endPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(control1.dx, control1.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
