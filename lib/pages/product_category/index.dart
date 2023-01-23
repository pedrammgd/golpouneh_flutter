import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/models/category.dart';
import 'package:gol_pouneh/pages/home/home.dart';
import 'package:gol_pouneh/services/category.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/check_network.dart';
import 'package:gol_pouneh/shared/color.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';
import '../../shared/url.dart';

class ProductCategory extends StatefulWidget {
  final int? parentId;

  const ProductCategory(this.parentId, {Key? key}) : super(key: key);

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  bool isLoading = true;
  bool checkedOnce = false;
  @override
  void initState() {
    if (DataMemory.categories.isEmpty) {
      getData();
    } else {
      isLoading = false;
    }
    super.initState();
  }

  void getData() async {
    DataMemory.categories = await CategoryService().index();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
        appBar: appBar('محصولات'),
        backgroundColor: backgroundColor,
        body: RefreshIndicator(
          child: Container(
            alignment: Alignment.topRight,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 15, top: 15, bottom: 10),
                  child: Text("دسته بندی ها",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                isLoading
                    ? Container(
                        padding: const EdgeInsets.only(top: 200),
                        child: Loading.circular(),
                      )
                    : Expanded(
                        child: GridView.count(
                          padding: const EdgeInsets.only(right: 15),
                          crossAxisCount: 3,
                          physics: const ScrollPhysics(),
                          children: List.generate(
                              DataMemory.categories
                                  .where((x) => x.parentId != null)
                                  .toList()
                                  .length, (index) {
                            var obj1 = DataMemory.categories
                                .where((x) => x.parentId != null)
                                .toList()[index];
                            return subItem(obj1, index);
                          }),
                        ),
                      )
              ],
            ),
          ),
          onRefresh: () async {
            setState(() {
              checkedOnce = false;
            });
            checkNavigator(checkedOnce, context, () {
              if (DataMemory.categories.isEmpty) {
                getData();
              } else {
                isLoading = false;
              }
            });
          },
        ),
      ),
    );
  }

  Widget subItem(CategoryModel model, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BottomNav(selectedIndex: 18, arg: [null, model, index])));
        },
        child: Container(
          width: 115,
          margin: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        //   borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:  Radius.circular(15)),

                        ),
                    child: CachedNetworkImage(
                        imageUrl:
                            '$productCategoryImageUrl${model.id}/${model.imageUrl ?? ''}',
                        width: 114,
                        height: 75,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const SizedBox(height: 75, width: 100),
                        errorWidget: (context, url, error) => SizedBox(
                                child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                            )))),
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 115,
                    height: 20,
                    alignment: Alignment.center,
                    child: Text(model.title ?? '',
                        style: const TextStyle(
                            fontSize: 7,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)))
              ]),
        ));
  }
}

/*
OLD1
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/models/category.dart';
import 'package:gol_pouneh/services/category.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/color.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';
import '../../shared/url.dart';
import '../product/index.dart';

class ProductCategory extends StatefulWidget {
  final int? parentId;

  const ProductCategory(this.parentId, {Key? key}) : super(key: key);

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  bool isLoading = true;

  @override
  void initState() {
    if (DataMemory.categories.isEmpty) {
      getData();
    } else {
      isLoading = false;
    }
    super.initState();
  }

  void getData() async {
    DataMemory.categories = await CategoryService().index();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('دسته بندی ها'),
        backgroundColor: backgroundColor,
        body: isLoading
            ? Loading.circular()
            : ListView.builder(
                itemCount: DataMemory.categories.where((x) => x.parentId == null).length,
                itemBuilder: (BuildContext context, int index) {
                  return item(DataMemory.categories
                      .where((x) => x.parentId == null)
                      .toList()[index]);
                }));
  }

  Widget item(CategoryModel model) {
    return SizedBox(
        height: 240,
        child: Column(children: [
          Container(
              margin: const EdgeInsets.only(right: 12, left: 6, top: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(model.title!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProductIndex(model)));
                    },
                    child: const Text('مشاهده همه', style: TextStyle(fontSize: 12)))
              ])),
          SizedBox(
              height: 180,
              child: ListView.builder(
                  padding: const EdgeInsets.only(right: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      DataMemory.categories.where((x) => x.parentId == model.id).length,
                  itemBuilder: (BuildContext context, int index) {
                    return subItem(DataMemory.categories
                        .where((x) => x.parentId == model.id)
                        .toList()[index]);
                  }))
        ]));
  }

  Widget subItem(CategoryModel model) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductIndex(model)));
        },
        child: Column(children: [
          Container(
              width: 120,
              height: 120,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10, bottom: 10, top: 4),
              decoration: const BoxDecoration(
                  color: homeBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: CachedNetworkImage(
                  imageUrl: imageUrl + (model.imageUrl ?? ''),
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const SizedBox(height: 70, width: 70),
                  errorWidget: (context, url, error) => SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset('assets/images/logo.png')))),
          Container(
              padding: const EdgeInsets.only(left: 10),
              width: 115,
              alignment: Alignment.center,
              child: Text(model.title ?? '',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)))
        ]));
  }
}
*/
