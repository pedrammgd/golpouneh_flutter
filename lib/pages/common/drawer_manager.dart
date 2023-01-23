import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gol_pouneh/pages/home/home.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import '../supplier/location.dart';

class DrawerManager extends StatefulWidget {
  const DrawerManager({Key? key}) : super(key: key);

  @override
  State<DrawerManager> createState() => _DrawerManagerState();
}

class _DrawerManagerState extends State<DrawerManager> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  late String pageTitle;
  Widget page = const Home();

  @override
  void initState() {
    pageTitle = 'گل پونه';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SliderDrawer(
                appBar: SliderAppBar(
                    appBarPadding: const EdgeInsets.only(left: 5),
                    appBarColor: Colors.white,
                    isTitleCenter: false,
                    title: Text(pageTitle == 'خانه' ? 'گل پونه' : pageTitle,
                        style:
                            const TextStyle(fontSize: 22, fontWeight: FontWeight.w700))),
                key: _key,
                sliderOpenSize: 200,
                slideDirection: SlideDirection.RIGHT_TO_LEFT,
                slider: sliderView(),
                splashColor: Colors.white,
                child: page)));
  }

  Widget sliderView() {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 30, right: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          const SizedBox(height: 80),
          Image.asset('assets/images/logo.png', width: 157),
          const SizedBox(height: 20),
          sliderItem('خانه', AntIcons.homeOutlined, const BottomNav(selectedIndex: 0,)),
          // sliderItem('محصولات', AntIcons.shopOutlined,
          //     ProductIndex(CategoryModel(parentId: null, id: null),)),
          sliderItem('سبد خرید', AntIcons.shoppingCartOutlined, const BottomNav(selectedIndex: 2,)),
          sliderItem('بلاگ', AntIcons.readOutlined, const BottomNav(selectedIndex: 14,)),
          sliderItem('حساب کاربری', AntIcons.userOutlined, const BottomNav(selectedIndex: 16,)),
          sliderItem('آدرس ها', Icons.map_outlined, const BottomNav(selectedIndex: 5,)),
          sliderItem('تاریخچه خرید', AntIcons.historyOutlined, const BottomNav(selectedIndex: 4,)),
          sliderItem(
              'شعب و نمایندگی ها', AntIcons.historyOutlined,  const SuppliersLocation(false)),
        ]));
  }

  Widget sliderItem(String title, IconData icon, Widget nav) {
    return GestureDetector(
        child: Container(
            margin: const EdgeInsets.only(top: 25, bottom: 5),
            child: Row(children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 7),
              Text(title, style: const TextStyle(color: Colors.black))
            ])),
        onTap: () {
          _key.currentState!.closeSlider();
          setState(() {
            pageTitle = title;
            page = nav;
          });
        });
  }
}
