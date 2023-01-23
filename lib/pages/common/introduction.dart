import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/color.dart';
import '../../shared/bottom_nav.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  List<String> imgList = ["Image(image: 'assets/images.intro1.jpg')"];
  CarouselController sliderController = CarouselController();
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
                child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        initialPage: currentIndex,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                    carouselController: sliderController,
                    items:
                        ['assets/images/intro2.jpg', 'assets/images/intro1.jpg'].map((i) {
                      return Builder(builder: (BuildContext context) {
                        return
                          SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Container(
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(color: Colors.green[100]!, blurRadius: 12.0, blurStyle: BlurStyle.outer, spreadRadius: 1.0,),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset(
                                  i,
                                 width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height - 40,
                                  //    height: MediaQuery.of(context).size.height-100
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    }).toList())),
            Container(
              margin: const EdgeInsets.only(left: 15, bottom: 15, top: 20.0),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ['assets/images/intro1.jpg', 'assets/images/intro2.jpg']
                          .toList()
                          .asMap()
                          .entries
                          .map((entry) {
                        return GestureDetector(
                          onTap: () => sliderController.animateToPage(entry.key),
                          child: Container(
                            width: 8.5,
                            height: 8.5,
                            margin: const EdgeInsets.only(right: 3, left: 3),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(currentIndex == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList()),
                  Positioned(
                    child: (currentIndex == imgList.length - 1)
                        ? InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 10, left: 10),
                              alignment: Alignment.center,
                              width: 90,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text(
                                "ورود",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) => const BottomNav()));
                            },
                          )
                        : Container(
                            height: 60,
                          ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: 19),
        bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero);
    return IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        globalHeader: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16),
                    child: buildImage('icon.png', 80)))),
        pages: [
          PageViewModel(
              title: "عنوان",
              body: "توضیحات",
              image: buildImage('img1.jpeg'),
              decoration: pageDecoration),
          PageViewModel(
              title: "عنوان",
              body: "توضیحات",
              image: buildImage('img2.jpeg'),
              decoration: pageDecoration),
          PageViewModel(
              title: "عنوان",
              body: "توضیحات",
              image: buildImage('img3.jpeg'),
              decoration: pageDecoration)
        ],
        onDone: () => onIntroEnd(context),
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        rtl: true,
        back: const Icon(Icons.arrow_forward, color: Colors.white),
        next: const Icon(Icons.arrow_back, color: Colors.white),
        done: const Text('ورود به اپلیکیشن',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        dotsDecorator: const DotsDecorator(
            size: Size(10, 10),
            color: Colors.white,
            activeSize: Size(22, 10),
            activeColor: mainColor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)))),
        dotsContainerDecorator: const ShapeDecoration(
            color: Colors.indigoAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))));
  }

  void onIntroEnd(context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const BottomNav()));
  }

  Widget buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/images/$assetName', width: width);
  }
}

* */
