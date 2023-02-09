import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gol_pouneh/controller/delivery_price_controller/delivery_price_controller.dart';
import 'package:gol_pouneh/models/category.dart';
import 'package:gol_pouneh/services/category.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../models/product.dart';
import '../../models/result_operation.dart';
import '../../services/cart.dart';
import '../../services/product.dart';
import '../../shared/check_network.dart';
import '../../shared/color.dart';
import '../../shared/converter.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';
import '../../shared/toast.dart';
import '../../shared/url.dart';

class ProductIndex extends StatefulWidget {
  final int? parentId;
  final CategoryModel? model;
  final int? index;
  const ProductIndex(this.parentId, this.model, this.index, {Key? key})
      : super(key: key);
  @override
  State<ProductIndex> createState() => _ProductIndexState();
}

class _ProductIndexState extends State<ProductIndex>
    with SingleTickerProviderStateMixin {
  final DeliveryPriceController deliveryPriceController =
      Get.put(DeliveryPriceController());
  int? index;
  CategoryModel? model;
  List tabs = [];
  List tabs2 = [];
  List lastList = [];
  CategoryModel? categoryModel1;
  int catIndex = 0;
  TabController? tabController;
  bool isLoading = false;
  int orderProductCount = 0;
  int orderProductCount1 = 0;
  List<bool> isChanging = [];
  List<ProductModel> products = [];
  var pageNumber = 0;
  final PagingController<int, ProductModel> pagingController =
      PagingController(firstPageKey: 1);
  bool checkedOnce = false;

  @override
  void initState() {
    index = widget.index;
    model = widget.model;
    catIndex = widget.index!;
    getData();
    super.initState();
  }

  void getData() async {
    DataMemory.categories = await CategoryService().index();
    tabs = DataMemory.categories.where((x) => x.parentId != null).toList();

    if (DataMemory.categories.isNotEmpty) {
      for (var i in tabs) {
        // tabs.add(i.title.toString());
        var obj3 = await i.title;
        // print(i.title.toString());
        tabs2.add(obj3);
      }
    }
    tabController = TabController(
        vsync: this,
        length: tabs
            .length); // myTabs.length change it with number of tabs you have
    await getData1(pageNumber, tabs[catIndex]);
    pagingController.addPageRequestListener((pageNumber) {
      this.pageNumber = pageNumber;
      getData1(pageNumber, categoryModel1!);
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    tabController?.dispose();
    super.dispose();
  }

  Future<void> getData1(int pageNumber, CategoryModel model) async {
    setState(() {
      isLoading = true;
    });
    try {
      products.clear();
      if (model.id == null) {
        products = await ProductService().newestProducts(pageNumber, 100);
      } else {
        products =
            await ProductService().byCategory(model.id!, pageNumber, 100);
      }
      products.sort(
        (a, b) => a.title!.compareTo(b.title!),
      );

      final isLastPage = products.length <= 100;
      if (isLastPage) {
        pagingController.appendLastPage(products);
      } else {
        final nextPageKey = pageNumber + products.length;
        pagingController.appendPage(products, nextPageKey);
      }
      for (int i = 0; i < products.length; i++) {
        isChanging.add(false);
      }
    } catch (error) {
      // if (mounted) toastFail('خطا در دریافت اطلاعات', error.toString(), context);
      pagingController.error = error;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            initialIndex: catIndex,
            length: tabs.length,
            child: Builder(builder: (BuildContext context) {
              final TabController? tabController =
                  DefaultTabController.of(context);
              tabController?.addListener(() async {
                if (isLoading) {
                } else {
                  categoryModel1 = tabs[tabController.index];
                  getData1(pageNumber, categoryModel1!);
                }
              });
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: mainColor,
                  title: const Text(
                    'محصولات',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  //automaticallyImplyLeading: false,
                  bottom: TabBar(
                    isScrollable: true,
                    controller: tabController,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    labelColor: Colors.black,
                    tabs: [for (final tab in tabs2) Tab(text: tab)],
                  ),
                ),
                body: TabBarView(
                  controller: tabController,
                  children: [
                    for (final tab in tabs)
                      isLoading
                          ? Loading.circular()
                          : Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/banner.jpg"),
                                    fit: BoxFit.cover),
                              ),
                              child: isLoading
                                  ? Loading.circular()
                                  : ListView(
                                      padding: const EdgeInsets.all(5),
                                      shrinkWrap: true,
                                      primary: true,
                                      children: [
                                          // tab.id == null
                                          //     ? const SizedBox(height: 0)
                                          //     : DataMemory.categories.where((x) => x.parentId == tab.id).isEmpty ? const SizedBox(height: 0,) : cats(),
                                          isLoading
                                              ? Loading.circular()
                                              : SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  // height: MediaQuery.of(context)
                                                  //         .size
                                                  //         .height -
                                                  //     100,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height -
                                                      (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2) -
                                                      (tab.id != null &&
                                                              DataMemory
                                                                  .categories
                                                                  .where((x) =>
                                                                      x.parentId ==
                                                                      tab.id)
                                                                  .isNotEmpty
                                                          ? 0
                                                          : 0),
                                                  child: products.isEmpty
                                                      ? Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          alignment:
                                                              Alignment.center,
                                                          child: const Text(
                                                              "لیست شما خالی است"),
                                                        )
                                                      : RefreshIndicator(
                                                          child: PagedListView<
                                                                  int,
                                                                  ProductModel>(
                                                              padding:
                                                                  // Space between product list bottom navigation
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          130.0),
                                                              pagingController:
                                                                  pagingController,
                                                              builderDelegate: PagedChildBuilderDelegate<
                                                                      ProductModel>(
                                                                  itemBuilder:
                                                                      (context,
                                                                          item,
                                                                          index) {
                                                                while (index <=
                                                                    products.length -
                                                                        1) {
                                                                  var p =
                                                                      products[
                                                                          index];
                                                                  return productItem(
                                                                      p, index);
                                                                }
                                                                return const SizedBox();
                                                              })),
                                                          onRefresh: () async {
                                                            setState(() {
                                                              checkedOnce =
                                                                  false;
                                                            });
                                                            checkNavigator(
                                                                checkedOnce,
                                                                context, () {
                                                              index =
                                                                  widget.index;
                                                              model =
                                                                  widget.model;
                                                              catIndex =
                                                                  widget.index!;
                                                              getData();
                                                            });
                                                          },
                                                        ))
                                        ])),
                  ],
                ),
              );
            })));
  }

  Widget productItem(ProductModel model, int index) {
    return isChanging[index]
        ? Loading.circular()
        : GestureDetector(
            child: Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 1.5),
                          blurRadius: 2.5,
                          spreadRadius: 0)
                    ]),
                child: Stack(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 1, right: 1),
                              // height: MediaQuery.of(context).size.width / 3,
                              child: CachedNetworkImage(
                                  // width: MediaQuery.of(context).size.width / 4,
                                  width: 120,
                                  height: 100,
                                  imageUrl: newImageUrl + model.imgUrl!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.contain))),
                                  placeholder: (context, url) => SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Loading.circular(mainColor)),
                                  errorWidget: (context, url, error) =>
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  // width: MediaQuery.of(context).size.width,
                                  // height: MediaQuery.of(context).size.width / 18,
                                  width: MediaQuery.of(context).size.width / 2,
                                  alignment: Alignment.topRight,
                                  child: Text(model.title ?? '',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13))),
                              Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width:
                                      MediaQuery.of(context).size.width / 4.5,
                                  // height: MediaQuery.of(context).size.width / 20,
                                  alignment: Alignment.topRight,
                                  child: model.price !=
                                          model.saleOrderProductFinalPrice
                                      ? Text('${toman(model.price!)}  تومان',
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 13,
                                              decoration:
                                                  TextDecoration.lineThrough))
                                      : const SizedBox(
                                          height: 30,
                                        )),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.53,
                                  alignment: Alignment.bottomLeft,
                                  child: model.orderProductCount != 0
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                              Padding(
                                                  padding: const EdgeInsets
                                                          .only(
                                                      right: 12,
                                                      bottom: 7,
                                                      top: 5),
                                                  child: model
                                                              .price !=
                                                          model
                                                              .saleOrderProductFinalPrice
                                                      ? Text(
                                                          ' ${toman(model.saleOrderProductFinalPrice! * model.orderProductCount!)} تومان ',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12))
                                                      : Text(
                                                          ' ${toman(model.price! * model.orderProductCount!)} تومان',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      12))),
                                              Container(
                                                  height: 35,
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black38,
                                                          width: 1),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        plusOne(model),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          child: Text(
                                                              model
                                                                  .orderProductCount
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      16)),
                                                        ),
                                                        minusOne(model)
                                                      ]))
                                            ])
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 12, bottom: 7),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        model.price !=
                                                                model
                                                                    .saleOrderProductFinalPrice
                                                            ? Text(
                                                                ' ${toman(model.saleOrderProductFinalPrice!)} تومان ',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12))
                                                            : Text(
                                                                ' ${toman(model.price!)} تومان ',
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12))
                                                      ])),
                                              Container(
                                                  width: 35,
                                                  height: 33,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  decoration: const BoxDecoration(
                                                      color: mainColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                  child: IconButton(
                                                      icon: Icon(
                                                          model.orderProductCount! >
                                                                  0
                                                              ? Icons
                                                                  .add_shopping_cart_outlined
                                                              : Icons
                                                                  .shopping_cart_outlined,
                                                          size: 20,
                                                          color: Colors.white),
                                                      onPressed: () async {
                                                        setState(() {
                                                          isChanging[index] =
                                                              true;
                                                        });
                                                        if (model
                                                                .orderProductCount! >
                                                            0) {
                                                          ResultOperation
                                                              result =
                                                              await CartService()
                                                                  .editCart(
                                                                      model.id!,
                                                                      0);
                                                          if (!mounted) return;
                                                          if (result
                                                                  .isSuccess ==
                                                              true) {
                                                            toastDanger(
                                                                model.title!,
                                                                'از سبد خرید حذف گردید',
                                                                context);
                                                            setState(() {
                                                              model.orderProductCount =
                                                                  0;
                                                            });
                                                          } else {
                                                            toastFail(
                                                                model.title ??
                                                                    '',
                                                                'خطا در ارسال اطلاعات به سرور',
                                                                context);
                                                          }
                                                        } else {
                                                          ResultOperation
                                                              result =
                                                              await CartService()
                                                                  .editCart(
                                                                      model.id!,
                                                                      1);
                                                          if (!mounted) return;
                                                          if (result
                                                                  .isSuccess ==
                                                              true) {
                                                            toastSuccess(
                                                                model.title!,
                                                                'به سبد خرید اضافه گردید',
                                                                context);
                                                            setState(() {
                                                              model.orderProductCount =
                                                                  1;
                                                              deliveryPriceController
                                                                      .totalPrice
                                                                      .value +=
                                                                  model.price!;
                                                            });
                                                          } else {
                                                            toastFail(
                                                                model.title ??
                                                                    '',
                                                                'خطا در ارسال اطلاعات به سرور',
                                                                context);
                                                          }
                                                        }
                                                        setState(() {
                                                          isChanging[index] =
                                                              false;
                                                        });
                                                      }))
                                            ])),
                            ],
                          ),
                        ]),
                    model.price != model.saleOrderProductFinalPrice
                        ? Positioned(
                            top: 0,
                            right: 0,
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Image.asset(
                                "assets/images/discnt.png",
                                width: 70,
                                height: 70,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                )),
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute<bool>(
                      builder: (context) =>
                          BottomNav(selectedIndex: 19, arg: [model, false])));
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
          setState(() {
            model.orderProductCount = model.orderProductCount! - 1;

            // isLoading = true;
          });
          debugPrint(model.orderProductCount.toString());
          ResultOperation result =
              await CartService().editCart(model.id!, model.orderProductCount!);
          if (!mounted) return;
          if (result.isSuccess == true) {
            //    toastDanger(model.title!, 'از سبد خرید کسر گردید', context);
            // setState(() {
            //   totalPrice -= model.price!;
            // });
            deliveryPriceController.totalPrice.value -= model.price!;
          } else {
            toastFail(
                model.title ?? '', 'خطا در ارسال اطلاعات به سرور', context);
            model.orderProductCount = model.orderProductCount! + 1;
          }
          setState(() {
            //  isLoading = false;
          });
          if (model.orderProductCount! == 0) {
            // setState(() {
            //   cartProducts.remove(model);
            // });
          }
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
            deliveryPriceController.totalPrice.value += model.price!;
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

  Widget categoryItem(CategoryModel model) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
            padding: const EdgeInsets.only(right: 5),
            margin: const EdgeInsets.fromLTRB(1, 8, 6, 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: mainColor, width: 1.5),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3))],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Text(model.title!,
                style: const TextStyle(fontWeight: FontWeight.bold))),
        onTap: () {
          setState(() {
            index = catIndex;
            model = model;
          });
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) =>
          //             BottomNav(selectedIndex: 18, arg: [null, model, catIndex])));
        });
  }

  Widget cats() {
    List<CategoryModel> catModels = DataMemory.categories
        .where((x) => x.parentId == categoryModel1?.id)
        .toList();
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 58,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: catModels.length,
            itemBuilder: (context, index) {
              return categoryItem(catModels[index]);
            }));
  }
}
