import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import '../../models/details_of_score.dart';
import '../../services/score.dart';
import '../../shared/appbar.dart';
import '../../shared/loading.dart';

class Score extends StatefulWidget {
  const Score({Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  dynamic totalPoint;
  dynamic listOfLenght;
  dynamic title;
  dynamic total;
  dynamic mount;
  dynamic object;
  var isLoading = true;
  late DetailsOfScore scoreDetails;
  late List<ListCustomerClubUserPoint> listDetails;
  late CustomerClubTypeOfPoint customerClubTypeOfPoint;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotalScore();
    getListOfDetailsScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scoreBgColor,
        appBar: appBar('  جزییات امتیاز'),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/banner.jpg"),
                fit: BoxFit.cover),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 30,
              ),
              Card(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.white,
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  // Image.asset('assets/images/silver.png',
                                  //     width: 55, height: 55),
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.red,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50))),
                                    child: Center(
                                      child: Text(totalPoint ?? '',
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: warningColor)),
                                    ),
                                  ),
                                ],
                              ),
                              const Text('کاربر برنز',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: warningColor)),
                            ],
                          ),
                          Column(
                            children: const [
                              Text('جزییات امتیاز',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black)),
                              Text('جزییات امتیازات شما',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54)),
                            ],
                          ),
                          const SizedBox(width: 70)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('عنوان امتیاز',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black)),
                              Text('میزان امتیاز',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black)),
                              Text('مجموع امتیاز',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black)),
                            ],
                          ),
                          divider(),
                          isLoading
                              ? Loading.circular()
                              : SizedBox(
                                  height: 180,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: listOfLenght,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        object = listDetails.elementAt(index);
                                        title = object
                                            .customerClubTypeOfPoint?.title;
                                        mount = object
                                            .customerClubTypeOfPoint?.point;
                                        total = 1;

                                        return row(title,
                                            listDetails[index].point, total);
                                        // return row(title, mount, total);
                                      }),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget divider() {
    return Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: const Color(0xffDCDCDC));
  }

  Widget row(title, mount, total) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Text(title ?? '',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Text(mount.toString(),
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            ),
            const SizedBox(
              width: 80,
            ),
            Text(mount.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          ],
        ),
        divider()
      ],
    );
  }

  getTotalScore() async {
    var points = await ScoreService().setTotalUserScore(DataMemory.userId);
    // var points = await ScoreService().setTotalUserScore(DataMemory.userId);
    if (!mounted) return;
    setState(() {
      totalPoint = points.result?.points?.toInt().toString();
    });
    //totalPoint= points.result?.points?.toString();
    // toastSuccess('گل پونه', "${points.result?.points}", context);
    if (points.result?.points != null) {
      // toastSuccess('گل پونه', "تخصیص امتیاز با موفقیت انجام شد", context);
      //   print("تخصیص امتیاز با موفقیت انجام شد");
    } else {
      // toastSuccess('گل پونه', "تخصیص امتیاز قبلا بع شمل تعلق گرفته است ", context);
      // print("تخصیص امتیاز قبلا بع شمل تعلق گرفته است");

    }
  }

  getListOfDetailsScore() async {
    var response = await ScoreService().setListOfUserScore(DataMemory.userId);
    // var response = await ScoreService()
    //     .setListOfUserScore("219657e3-be6e-4d2a-bea1-35732daef3d4");
    //  print(DataMemory.userId);
    scoreDetails = response;
    listOfLenght = scoreDetails.result?.listCustomerClubUserPoint!.length;
    listDetails = scoreDetails.result?.listCustomerClubUserPoint ?? [];

    setState(() {
      isLoading = false;
    });
    /*  for (var i in listDetails) {
      setState(() {
        title = i.customerClubTypeOfPoint?.title;
        mount = i.customerClubTypeOfPoint?.point;
        total = i.customerClubTypeOfPoint?.point;
        print(title);
        print(mount);
        print(total);
      });

    }*/
  }
}
