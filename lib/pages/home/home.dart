import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gol_pouneh/models/blog_article.dart';
import 'package:gol_pouneh/models/product.dart';
import 'package:gol_pouneh/pages/supplier/location_on_map.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import '../../services/blog.dart';
import '../../services/product.dart';
import '../../shared/check_network.dart';
import '../../shared/converter.dart';
import '../../shared/exit.dart';
import '../../shared/loading.dart';
import '../../shared/url.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  CarouselController sliderController = CarouselController();
  bool isLoadingBlog = true;
  bool isLoadingList = true;
  int currentSlider1 = 0;
  int currentSlider2 = 0;
  bool checkedOnce = false;
  static List<ProductModel> newProducts = [];
  List<ProductModel> bestSellingProducts = [];

  @override
  void initState() {
    getData1();
    if (DataMemory.blogArticles.isEmpty) {
      getData();
    } else {
      setState(() {
        isLoadingBlog = false;
      });
    }
    super.initState();
  }

  void getData() async {
    DataMemory.blogArticles = await BlogService().index();
    setState(() {
      isLoadingBlog = false;
    });
  }

  void getData1() async {
    newProducts = await ProductService().newestProducts(1, 10);
    bestSellingProducts = await ProductService().bestSellerProducts(1, 10);
    setState(() {
      isLoadingList = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: appBar(),
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
                  ),
                  child: SingleChildScrollView(
                      primary: true,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 17, top: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.rtl,
                              children: [
                                search(),
                                isLoadingBlog ? Loading.circular() : slider(1),
                                title('تازه ترین ها'),
                                isLoadingList
                                    ? Loading.circular()
                                    : products(newProducts),
                                // DataMemory.adverts.any((x) => x.advertLocationId == 4)
                                //     ? banner()
                                //     : const SizedBox(),
                                // title('پرفروش ترین ها'),
                                // isLoadingList?Loading.circular():products(bestSellingProducts),
                                isLoadingBlog ? Loading.circular() : slider(4),
                                title('خبرنامه'),
                                articles()
                              ]))),
                ),
              ],
            ))),
        onRefresh: ()async{
      setState(() {
        checkedOnce=false;
      });
          checkNavigator(checkedOnce,context,(){
            getData1();
            if (DataMemory.blogArticles.isEmpty) {
              getData();

            } else {
              setState(() {
                isLoadingBlog = false;
              });
            }
          });

        });
  }



  Widget slider(int adId) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.fromLTRB(13, 25, 0, 0),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2))
          ]),
          child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      if (adId == 1) {
                        currentSlider1 = index;
                      } else {
                        currentSlider2 = index;
                      }
                    });
                  }),
              carouselController: sliderController,
              items: DataMemory.adverts.where((x) => x.advertLocationId == adId).map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                              imageUrl: imageUrl +
                                  i.imageURL!
                                      .replaceAll('\\', '/')
                                      .replaceAll('{ViewDirectoryName}', 'golpouneh'),
                              imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover))),
                              placeholder: (context, url) => SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Loading.circular(mainColor)),
                              errorWidget: (context, url, error) {
                                debugPrint(error.toString());
                                return const SizedBox(height: 110, width: 110);
                              })));
                });
              }).toList())),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: DataMemory.adverts
              .where((x) => x.advertLocationId == adId)
              .toList()
              .asMap()
              .entries
              .map((entry) {
            return GestureDetector(
              onTap: () => sliderController.animateToPage(entry.key),
              child: Container(
                width: 8.5,
                height: 8.5,
                margin: const EdgeInsets.only(top: 10, right: 3, left: 3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(
                            (adId == 1 ? currentSlider1 : currentSlider2) == entry.key
                                ? 0.9
                                : 0.4)),
              ),
            );
          }).toList())
    ]);
  }

  Widget banner() {
    return Container(
        height: 100,
        margin: const EdgeInsets.fromLTRB(18, 20, 0, 0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2))
        ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
                imageUrl: imageUrl +
                    DataMemory.adverts
                        .lastWhere((x) => x.advertLocationId == 4)
                        .imageURL!
                        .replaceAll('\\', '/')
                        .replaceAll('{ViewDirectoryName}', 'golpouneh'),
                imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
                placeholder: (context, url) => SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Loading.circular(mainColor)),
                errorWidget: (context, url, error) {
                  debugPrint(error.toString());
                  return const SizedBox(height: 110, width: 110);
                })));
  }

  Widget title(String text) {
    return Container(
        margin: const EdgeInsets.only(top: 25, bottom: 4),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21)));
  }

  Widget search() {
    return Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Icon(Icons.search, color: Colors.white, size: 30)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNav(
                                selectedIndex: 17, arg: searchController.text)));
                  })),
          Flexible(
              child: TextField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNav(
                                selectedIndex: 17, arg: searchController.text)));
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "جست و جو ...",
                      contentPadding: const EdgeInsets.all(14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black38, width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 247, 247, 247), width: 2),
                          borderRadius: BorderRadius.circular(12)),
                      labelStyle: const TextStyle(fontSize: 15, color: Colors.black38),
                      hintStyle: const TextStyle(fontSize: 15, color: Colors.black38))))
        ]));
  }

  Widget productItem(ProductModel model) {
    return GestureDetector(
        child: Container(
            alignment: Alignment.center,
            width: 210,
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
            margin: const EdgeInsets.only(left: 5, right: 6, top: 7, bottom: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Stack(
              children: [
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 13, left: 13, top: 10),
                      child: CachedNetworkImage(
                          imageUrl: newImageUrl + model.imgUrl!,
                          height: 100,
                          width: 164,
                          imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.contain))),
                          placeholder: (context, url) => SizedBox(
                              height: 100,
                              width: 164,
                              child: Loading.circular(mainColor)),
                          errorWidget: (context, url, error) =>
                              const SizedBox(height: 100, width: 164))),
                  Container(
                      alignment: Alignment.center,
                      child: Text(model.title ?? '',
                          style: const TextStyle(
                              fontSize: 15.5, fontWeight: FontWeight.w900))),
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Html(
                          data: model.intro ?? '',
                          style: {'p': Style(fontSize: FontSize(12))})),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 3, top: 2),
                      alignment: Alignment.centerLeft,
                      child: model.price == model.saleOrderProductFinalPrice
                          ? Text('${toman(model.price!)} تومان',
                              style: const TextStyle(fontSize: 13))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('${toman(model.price!)} تومان',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough)),
                                Text('${toman(model.saleOrderProductFinalPrice!)} تومان',
                                    style: const TextStyle(fontSize: 13)),
                              ],
                            ))
                ]),
                model.price != model.saleOrderProductFinalPrice ? Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset("assets/images/discnt.png", width: 80, height: 80,),
                ) : Container(),
              ],
            )),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BottomNav(selectedIndex: 19, arg: [model, false])));
        });
  }

  Widget products(List<ProductModel> products) {
    return SizedBox(
        height: 215,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: products.length > 10 ? 10 : products.length,
            itemBuilder: (BuildContext context, int index) {
              return productItem(products[index]);
            }));
  }

  Widget articleItem(BlogArticleModel model) {
    return GestureDetector(
        child: Container(
            alignment: Alignment.center,
            width: 190,
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
            margin: const EdgeInsets.only(left: 5, right: 6, top: 7, bottom: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 2)],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10, right: 13, left: 13),
                      child: CachedNetworkImage(
                          imageUrl:
                              '${imageUrl}blog/upload/${model.id}/${model.imageURL ?? ''}',
                          height: 100,
                          width: 164,
                          imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.contain))),
                          placeholder: (context, url) => SizedBox(
                              height: 100,
                              width: 164,
                              child: Loading.circular(mainColor)),
                          errorWidget: (context, url, error) =>
                              const SizedBox(height: 100, width: 164))),
                  Container(
                      margin: const EdgeInsets.only(top: 10, right: 6),
                      height: 21,
                      child: Text(model.title ?? '',
                          style: const TextStyle(
                              fontSize: 15.5, fontWeight: FontWeight.w900))),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: Html(
                          data: model.intro ?? '',
                          style: {'p': Style(fontSize: FontSize(12))}))
                ])),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNav(selectedIndex: 13, arg: model)));
        });
  }

  Widget articles() {
    return SizedBox(
        height: 220,
        child: isLoadingBlog
            ? Loading.circular()
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: DataMemory.blogArticles.length > 10
                    ? 10
                    : DataMemory.blogArticles.length,
                itemBuilder: (BuildContext context, int index) {
                  return articleItem(DataMemory.blogArticles[index]);
                }));
  }

  PreferredSizeWidget appBar() {
    return AppBar(
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Image.asset(
            'assets/images/logo.png',
            height: 50,
          ),
        ), // you can put Icon as well, it accepts any widget.
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        iconTheme: const IconThemeData(color: Colors.black),
        /*  title: const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Text('گل پونه',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21))
        ),*/
        actions: [
          GestureDetector(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(children: const [
                    Text('مکان یابی ',
                        style:
                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Icon(Icons.location_on_outlined, color: Colors.white, size: 23),
                  ])),
              onTap: () {
                DataMemory.geoLocation = null;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LocationOnMAp()));
              })
        ]);
  }
}
