import 'dart:async';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:gol_pouneh/controller/delivery_price_controller/delivery_price_controller.dart';
import 'package:gol_pouneh/models/address.dart';
import 'package:gol_pouneh/models/blog_article.dart';
import 'package:gol_pouneh/models/category.dart';
import 'package:gol_pouneh/models/factor.dart';
import 'package:gol_pouneh/pages/address/create.dart';
import 'package:gol_pouneh/pages/address/edit.dart';
import 'package:gol_pouneh/pages/blog/details.dart';
import 'package:gol_pouneh/pages/blog/index.dart';
import 'package:gol_pouneh/pages/common/contact_us.dart';
import 'package:gol_pouneh/pages/factor/factor_products.dart';
import 'package:gol_pouneh/pages/factor/my_factors.dart';
import 'package:gol_pouneh/pages/home/home.dart';
import 'package:gol_pouneh/pages/identity/profile_info.dart';
import 'package:gol_pouneh/pages/product/details.dart';
import 'package:gol_pouneh/pages/product/index.dart';
import 'package:gol_pouneh/pages/product/search.dart';
import 'package:gol_pouneh/pages/product_category/index.dart';
import 'package:gol_pouneh/pages/profile/bug_report.dart';
import 'package:gol_pouneh/pages/profile/profile.dart';
import 'package:gol_pouneh/pages/profile/score.dart';
import 'package:gol_pouneh/pages/profile/update.dart';
import 'package:gol_pouneh/pages/shop/cart.dart';
import 'package:gol_pouneh/pages/shop/choose_how_to_send.dart';
import 'package:gol_pouneh/pages/shop/discount_list.dart';
import 'package:gol_pouneh/pages/shop/finalize_order.dart';
import 'package:gol_pouneh/pages/shop/success_payment.dart';
import 'package:gol_pouneh/pages/supplier/location.dart';
import 'package:gol_pouneh/pages/terms/terms.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/loading.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../models/product.dart';
import '../pages/address/index.dart';
import '../services/cart.dart';
import 'package:get/get.dart';

class BottomNav extends StatefulWidget {
  final int selectedIndex;
  final dynamic arg;
  const BottomNav({Key? key, this.selectedIndex = 0, this.arg})
      : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final DeliveryPriceController deliveryPriceController =
      Get.put(DeliveryPriceController());

  late int selectedIndex;
  late bool isLoading = true;
  late int numberOfCart;

  late final String result;
  late final FactorModel factorModel;
  late final bool fromFactor;

  late List<ProductModel> numberOfOrders;
  List<Widget> widgetOptions = [];

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    getPrice();
    widgetOptions = [
      const Home(), //0
      const ProductCategory(null), //1
      const Cart(), //2
      const Profile(), //3
      const MyFactors(), //4
      const AddressIndex(), //5
      const SuppliersLocation(false), //6
      const Score(), //7
      const Update(), //8
      const BlogArticleIndex(), //9
      const BugReport(), //10
      EditAddress(widget.arg != null && selectedIndex == 11
          ? widget.arg as AddressModel
          : AddressModel()), //11
      const CreateAddress(), //12
      BlogArticleDetails(widget.arg != null && selectedIndex == 13
          ? widget.arg
          : BlogArticleModel()), //13
      const BlogArticleIndex(), //14
      FactorProducts(widget.arg != null && selectedIndex == 15
          ? widget.arg
          : FactorModel()), //15
      const ProfileInfo(), //16
      Search(widget.arg != null && selectedIndex == 17 ? widget.arg : ""), //17
      widget.arg != null && selectedIndex == 18
          ? ProductIndex(widget.arg[0], widget.arg[1], widget.arg[2])
          : ProductIndex(null, CategoryModel(), 0), //18
      widget.arg != null && selectedIndex == 19
          ? ProductDetails(widget.arg[0], widget.arg[1])
          : ProductDetails(ProductModel(), false), //19
      widget.arg != null && selectedIndex == 20
          ? SuccessPayment(widget.arg[0], widget.arg[1])
          : const SuccessPayment("", 0), // 20
      const Terms(), //21
      const ContactUs(), //22
      const ChooseHowToSend(), //23
      widget.arg != null && selectedIndex == 24
          ? const FinalizeOrder()
          : const FinalizeOrder(), // 24
      const DiscountPage() // 25
    ];
    super.initState();
    getData();
  }

  void getData() async {
    numberOfOrders = await CartService().cartProducts();
    setState(() {
      numberOfCart = numberOfOrders.length;
      isLoading = false;
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
      Future.delayed(const Duration(seconds: 3), () {
        getData();
      });
    }
  }

/*  @override
  void setState(VoidCallback fn) {
    if(mounted) {
      super.setState(fn);
      getData();
    }
  }*/
  late List<ProductModel> cartProducts;
  double totalPrice = 0;

  void getPrice() async {
    cartProducts = await CartService().cartProducts();
    for (var i in cartProducts) {
      if (i.price == i.saleOrderProductFinalPrice) {
        setState(() {
          totalPrice += i.price! * i.orderProductCount!;
        });
      } else {
        setState(() {
          totalPrice += i.saleOrderProductFinalPrice! * i.orderProductCount!;
        });
      }
      // payWithoutDiscount += i.price! * i.orderProductCount!;
      // payWithoutDiscount = cartProducts.first.SaleFactorDiscountAmmount ?? 0;
      deliveryPriceController.totalPrice.value = totalPrice;
      print('totalPrice${totalPrice}');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: isLoading
            // ? BottomNav(
            //     selectedIndex: 0,
            //   )
            ? SizedBox()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (deliveryPriceController.totalPrice.value < 300000)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        // height: 100,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${deliveryPriceController.totalPrice.value}  ارسال رایگان با خرید بیش از 300 هزار تومان',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: LinearProgressIndicator(
                                value: .5,
                                minHeight: 5,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  Container(
                      color: backgroundColor,
                      child: SafeArea(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: GNav(
                                  rippleColor: Colors.grey[300]!,
                                  hoverColor: Colors.grey[100]!,
                                  gap: 8,
                                  activeColor: Colors.black,
                                  iconSize: 24,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  duration: const Duration(milliseconds: 400),
                                  tabBackgroundColor: Colors.grey[100]!,
                                  color: Colors.black,
                                  tabs: [
                                    const GButton(
                                        icon: AntIcons.homeOutlined,
                                        text: 'خانه'),
                                    const GButton(
                                        icon: AntIcons.shopOutlined,
                                        text: 'محصولات'),
                                    GButton(
                                        text: 'سبد خرید',
                                        icon: AntIcons.shoppingCartOutlined,
                                        leading: badge.Badge(
                                          badgeColor: selectedIndex == 2
                                              ? Colors.black
                                              : Colors.red,
                                          elevation: 0,
                                          position:
                                              badge.BadgePosition.topStart(
                                                  top: -16),
                                          badgeContent: Text(
                                            numberOfCart.toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          child: Icon(
                                            AntIcons.shoppingCartOutlined,
                                            color: selectedIndex == 2
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        )),
                                    //      GButton(icon: AntIcons.shoppingCartOutlined, text: 'سبد خرید'),
                                    const GButton(
                                        icon: AntIcons.profileOutlined,
                                        text: 'کاربری')
                                  ],
                                  selectedIndex: selectedIndex,
                                  onTabChange: (index) async {
                                    numberOfOrders =
                                        await CartService().cartProducts();

                                    setState(() {
                                      selectedIndex = index;
                                      numberOfCart = numberOfOrders.length;
                                      isLoading = false;
                                    });
                                  })))),
                ],
              ));
  }
}
