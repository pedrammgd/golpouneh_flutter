import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gol_pouneh/models/product.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import '../../services/product.dart';
import '../../shared/color.dart';
import '../../shared/converter.dart';
import '../../shared/loading.dart';
import '../../shared/url.dart';

class Search extends StatefulWidget {
  final String? query;

  const Search(this.query, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  List<ProductModel> searchedProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.query != null) {
      searchController.text = widget.query ?? '';
      getData();
    } else {
      isLoading = false;
    }
  }

  getData() async {
    var response = await ProductService().search(searchController.text, 1, 100);
    setState(() {
      searchedProducts = response;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarNoShadow('جست و جو'),
        body:
        Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover),
            ),child:   Column(children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              color: mainColor,
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: search()),
          Expanded(
              child: isLoading
                  ? Loading.circular()
                  : ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.only(top: 5),
                  shrinkWrap: true,
                  itemCount: searchedProducts.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: Key(index.toString()),
                        child: GestureDetector(
                            child: productItem(searchedProducts[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BottomNav(selectedIndex: 19, arg: [searchedProducts[index], false])
                                          ));
                            }));
                  }))
        ])),

    );
  }

  Widget productItem(ProductModel model) {
    return GestureDetector(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            margin: const EdgeInsets.only(left: 5, top: 2, bottom: 8, right: 5),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black38,  blurRadius: 2)
                ],
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
                          height: 110, width: 110, child: Loading.circular(mainColor)),
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
                                        fontSize: 16, fontWeight: FontWeight.w900))),
                            Html(
                                data: model.intro ?? '',
                                style: {'p': Style(fontSize:  FontSize(13))}),
                            Container(
                                height: 35,
                                margin: const EdgeInsets.only(right: 7.5),
                                // margin: EdgeInsets.only(bottom: 5, top: 10),
                                child: Text('قیمت: ${toman(model.price!)} تومان',
                                    style: const TextStyle(fontSize: 13)))
                          ]))
                ])),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BottomNav(selectedIndex: 19, arg: [model, false],)));
        });
  }

  Widget search() {
    return Container(
        padding: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.white)),
        child: Row(children: <Widget>[
          Flexible(
              child: TextField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (String str) {
                    searchedProducts.clear();
                    setState(() {
                      isLoading = true;
                    });
                    getData();
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10, right: 10)),
                  style: const TextStyle(height: 2, color: Colors.white))),
          IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                searchedProducts.clear();
                setState(() {
                  isLoading = true;
                });
                getData();
              })
        ]));
  }
}
