import 'dart:io';
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gol_pouneh/pages/identity/login.dart';
import 'package:gol_pouneh/pages/identity/profile_info.dart';
import 'package:gol_pouneh/services/profile.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/account.dart';
import '../../shared/appbar.dart';
import '../../shared/data_memory.dart';
import '../../shared/loading.dart';
import '../../shared/toast.dart';
import '../../shared/url.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = true;
  bool profileLoading = false;
  late File imageFile;
  String profileImageName = "";
  PickedFile? pickedFile;

  @override
  void initState() {
    super.initState();

    if (DataMemory.profile == null) {
      getData();
    } else {
      setState(() {
        isLoading = false;
      });
    }
    getProfileImage();
  }

  File? file;

  void getData() async {
    DataMemory.profile =
        await AccountService().getProfileInfo(DataMemory.userId);
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
          backgroundColor: backgroundColor,
          appBar: appBar('حساب کاربری'),
          body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/banner.jpg"),
                    fit: BoxFit.cover),
              ),
              child: ListView(children: <Widget>[topCard(), bottomContent()]))),
    );
  }

  Widget bottomContent() {
    return Container(
        width: MediaQuery.of(context).size.width,
        // height: 225,
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(children: [
          bottomCardItem('تاریخچه خرید', AntIcons.historyOutlined, navIndex: 4),
          bottomCardDivider(),
          bottomCardItem('آدرس ها', Icons.map_outlined, navIndex: 5),
          bottomCardDivider(),
          bottomCardItem('شعب و نمایندگی ها', Icons.location_on_outlined,
              navIndex: 6),
          bottomCardDivider(),
          bottomCardItem('امتیازات', Icons.verified_user, navIndex: 7),
          bottomCardDivider(),
          bottomCardItem('تخفیف ها', Icons.discount, navIndex: 25),
          bottomCardDivider(),
          // bottomCardItem('اعلانات', Icons.email, const Messages()),
          // bottomCardDivider(),
          bottomCardItem('به روزرسانی', Icons.update, navIndex: 8),
          bottomCardDivider(),
          bottomCardItem('خبرنامه', AntIcons.readOutlined, navIndex: 9),
          bottomCardDivider(),
          bottomCardItem('گزارش خطا', Icons.verified_user, navIndex: 10),
          bottomCardDivider(),
          bottomCardItem('معرفی اپلیکیشن به دیگران', Icons.share,
              navIndex: 100),
          bottomCardDivider(),
          bottomCardItem('قوانین و مقررات', Icons.rule_folder_outlined,
              navIndex: 21),
          bottomCardDivider(),
          bottomCardItem('ارتباط با ما', Icons.contact_page, navIndex: 22),
          bottomCardDivider(),
          bottomCardItem(
            'خروج از حساب کاربری',
            Icons.exit_to_app,
            navIndex: 0,
            navigate: const Login(),
          ),
          const SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget bottomCardItem(String title, IconData iconData,
      {Widget? navigate, int? navIndex}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: homeBackgroundColor, borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left: 2),
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: mainColor, shape: BoxShape.circle),
                      child: Icon(iconData, color: titleColor, size: 20)),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ]),
                const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.grey)
              ]),
          onTap: () async {
            if (navIndex != null && navIndex == 0) {
              showExitAccount(context, navigate!);
            } else {
              if (navIndex == 100) {
                Share.share(
                  'این اپلیکیشن را به دیگران معرفی کن!\n http://www.golpouneh.com/',
                );
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomNav(
                              selectedIndex: navIndex!,
                            )));
              }
            }
          }),
    );
  }

  Widget bottomCardDivider() {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 5),
        height: 1,
        color: const Color(0xffe3e3e3));
  }

  Widget topCard() {
    return Card(
        margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: secondaryColor,
        elevation: 3,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 135,
            margin: const EdgeInsets.only(top: 3),
            child: isLoading
                ? Loading.circular(mainColor)
                : Column(children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              child: const Text('اطلاعات حساب',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500))),
                          GestureDetector(
                              child: Card(
                                  margin:
                                      const EdgeInsets.only(left: 15, top: 10),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  color: Colors.amber,
                                  child: const SizedBox(
                                      width: 60,
                                      height: 25,
                                      child: Center(
                                          child: Text('ویرایش',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: backgroundColor))))),
                              onTap: () async {
                                bool? result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const BottomNav(
                                              selectedIndex: 16,
                                            )));
                                if (result == true) {
                                  if (!mounted) return;
                                  toastSuccess(
                                      'با موفقیت انجام شد', '', context);
                                  setState(() {
                                    isLoading = true;
                                  });
                                  getData();
                                }
                              })
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          profileLoading
                              ? Loading.circular()
                              : InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, right: 10),
                                    width: 60,
                                    height: 60,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CachedNetworkImage(
                                        imageUrl: imageUrlProfile +
                                            profileImageName.replaceAll(
                                                '\\', '/'),
                                        imageBuilder: (context,
                                                imageProvider) =>
                                            Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover))),
                                        placeholder: (context, url) => SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Loading.circular(mainColor)),
                                        errorWidget: (context, url, error) {
                                          debugPrint(error.toString());
                                          return const SizedBox(
                                              height: 60, width: 60);
                                        },
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProfileInfo()))
                                        .then((value) => getProfileImage());
                                  },
                                ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(
                                        right: 17, top: 20),
                                    child: Text(
                                        '${DataMemory.profile!.firstName ?? ''} ${DataMemory.profile!.lastName ?? ''}',
                                        style: const TextStyle(fontSize: 15))),
                                Container(
                                    margin: const EdgeInsets.only(
                                        right: 17, top: 8),
                                    child: Text(
                                        DataMemory.profile!.phoneNumber ?? '',
                                        style: const TextStyle(fontSize: 15)))
                              ]),
                        ])
                  ])));
  }

  Future<bool> showExitAccount(context, Widget navigate) async {
    return await showDialog(
        context: context,
        builder: (BuildContext alertContext) {
          return AlertDialog(
              content: SizedBox(
                  height: 120,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("آیا میخواهید از حساب کاربری خارج شوید؟"),
                        const SizedBox(height: 20),
                        Row(children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.remove('userId');
                                    prefs.remove('phoneNumber');
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => navigate));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: mainColor),
                                  child: const Text("خروج"))),
                          const SizedBox(width: 15),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(alertContext).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  child: const Text("خیر",
                                      style: TextStyle(color: Colors.black))))
                        ])
                      ])));
        });
  }

  getProfileImage() async {
    setState(() {
      profileLoading = true;
    });
    var res = await ProfileService().downloadProfileImage();
    profileImageName = res!;
    setState(() {
      profileLoading = false;
    });
  }
}
