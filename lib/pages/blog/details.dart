import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import '../../models/blog_article.dart';
import '../../shared/color.dart';
import '../../shared/converter.dart';
import '../../shared/loading.dart';
import '../../shared/url.dart';

class BlogArticleDetails extends StatefulWidget {
  final BlogArticleModel model;

  const BlogArticleDetails(this.model, {Key? key}) : super(key: key);

  @override
  State<BlogArticleDetails> createState() => _BlogArticleDetailsState();
}

class _BlogArticleDetailsState extends State<BlogArticleDetails> {
  late BlogArticleModel model;
  late VideoPlayerController videoController;
  ChewieController? chewieController;

  @override
  void initState() {
    model = widget.model;
    if (model.videoURL != null) {
      initVideo();
    }
    super.initState();
  }

  void initVideo() async {
    videoController = VideoPlayerController.network(
        '${imageUrl}blog/upload/${model.id}/${model.videoURL!.replaceAll(' ', '%20')}');
    await Future.wait([videoController.initialize()]);
    chewieController = ChewieController(
        videoPlayerController: videoController, autoPlay: true, looping: true);
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction("خبرنامه"),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height + 100,
            child: Stack(children: [header(), Positioned(top: 300, child: body())]),
          ))),
    );
  }

  Widget headerButton(IconData icon, VoidCallback callback) {
    return GestureDetector(
        onTap: callback,
        child: Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5, left: 30),
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                color: homeBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: Colors.black54.withOpacity(0.2))
                ]),
            child: Icon(icon, color: Colors.green)));
  }

  header() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          CachedNetworkImage(
              imageUrl: '${imageUrl}blog/upload/${model.id}/${model.imageURL ?? ''}',
              fit: BoxFit.fill,
              height: 300,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) => SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Loading.circular(mainColor)),
              errorWidget: (context, url, error) {
                debugPrint(error.toString());
                return SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                );
              })
        ]));
  }

  body() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 900,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
        decoration: const BoxDecoration(
            color: homeBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          title(),
          date(),
          divider(),
          description(),
          model.videoURL == null
              ? Column(
                children: [
                  const SizedBox(height: 80,),
                  Center(child: Image.asset("assets/images/logo.png", width: MediaQuery.of(context).size.width * 0.55)),
                ],
              )
              : video(),
          model.videoURL != null ? const SizedBox(height: 150) : Container(),
        ]));
  }

  PreferredSizeWidget appBarWithAction(String title) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: mainColor,
      title: Text(title),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headerButton(AntIcons.shareAltOutlined, () {
              Share.share(
                'این مقاله را در گل پونه ببین!\n https://golpouneh.com/Post/${model.id}',
                subject: model.title ?? 'گل پونه',
              );
            })
          ],
        ),
      ],
    );
  }

  Widget date() {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 15),
      child: Text('زمان انتشار: ${persianDate(model.publishDate!)}',
          style: const TextStyle(
              fontSize: 14, color: mainColor, fontWeight: FontWeight.bold)),
    );
  }

  Widget title() {
    return Container(
        margin: const EdgeInsets.only(top: 20, right: 15),
        child: Text(model.title!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }

  Widget divider() {
    return Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        color: const Color(0xffDCDCDC));
  }

  Widget description() {
    return Container(
        margin: const EdgeInsets.only(right: 20, left: 15),
        child: Html(
            data: model.description ?? "", style: {'p': Style(fontSize: FontSize(12))}));
  }

  Widget video() {
    return Container(
        margin: const EdgeInsets.only(right: 15, left: 15, top: 30),
        height: 100,
        child: chewieController != null &&
                chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: chewieController!)
            :                   Center(child: Image.asset("assets/images/logo.png", width: MediaQuery.of(context).size.width * 0.55)),
    );
  }
}
