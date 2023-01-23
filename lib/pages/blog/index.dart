import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import '../../models/blog_article.dart';
import '../../services/blog.dart';
import '../../shared/appbar.dart';
import '../../shared/color.dart';
import '../../shared/converter.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';
import '../../shared/url.dart';

class BlogArticleIndex extends StatefulWidget {
  const BlogArticleIndex({Key? key}) : super(key: key);

  @override
  State<BlogArticleIndex> createState() => _BlogArticleIndexState();
}

class _BlogArticleIndexState extends State<BlogArticleIndex> {
  bool isLoading = true;

  @override
  void initState() {
    if (DataMemory.blogArticles.isEmpty) {
      getData();
    } else {
      setState(() {
        isLoading = false;
      });
    }
    super.initState();
  }

  void getData() async {
    DataMemory.blogArticles = await BlogService().index();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('خبرنامه'),
        backgroundColor: backgroundColor,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
          ),
          child: isLoading
              ? Loading.circular(mainColor)
              : ListView.builder(
                  padding: const EdgeInsets.only(top:10,bottom: 40),
                  itemCount: DataMemory.blogArticles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return item(DataMemory.blogArticles[index]);
                  }),
        ));
  }

  Widget item(BlogArticleModel model) {
    return GestureDetector(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: homeBackgroundColor,
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 4)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(children: <Widget>[
              Container(
                padding: const EdgeInsets.all( 10),
                margin: const EdgeInsets.all(3.5),
                width: 114,
                height: 100,
                decoration: const BoxDecoration(
                ),
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:
                        '${imageUrl}blog/upload/${model.id}/${model.imageURL ?? ''}',
                    imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill))),
                    placeholder: (context, url) => SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Loading.circular(mainColor)),
                    errorWidget: (context, url, error) {
                      debugPrint(error.toString());
                      return const SizedBox(height: 104, width: 104);
                    },
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    margin: const EdgeInsets.only(right: 7, top: 6),
                    width: MediaQuery.of(context).size.width - 140,

                    child: Text(model.title!,
                        style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                Container(
                    margin: const EdgeInsets.only(right: 0, top: 5),
                    width: MediaQuery.of(context).size.width - 140,
                    height: 30,
                    child: Html(data: model.intro ?? '', style: {
                      'p': Style(fontSize: FontSize(12.5), fontFamily: 'IRANSans')
                    })),
                Container(
                    margin: const EdgeInsets.only(right: 7),
                    child: Text('زمان ثبت: ${persianDate(model.registerDate!)}',
                        style: const TextStyle(color: Colors.grey, fontSize: 12.5)))
              ])
            ])),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNav(selectedIndex: 13, arg: model)));
        });
  }
}
