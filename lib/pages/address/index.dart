import 'package:flutter/material.dart';
import 'package:gol_pouneh/models/address.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/address.dart';
import '../../shared/appbar.dart';

class AddressIndexState extends State<AddressIndex> {
  List<AddressModel> addresses = [];
  bool isLoading = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {

    prefs = await SharedPreferences.getInstance();
    var supId=prefs.getInt('supplierId1');
    addresses = await AddressService().myAddresses(supId!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('آدرس های من'),
        backgroundColor: backgroundColor,
        body: addresses.isNotEmpty?Container(
          padding: const EdgeInsets.only(top: 20),
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
          ),
          child: isLoading
              ? Loading.circular()
              : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return item(addresses[index]);
              }),
        ):Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(15),
          child: const Text("فهرست شما خالی است"),),
        floatingActionButton: FloatingActionButton(
            backgroundColor: mainColor,
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BottomNav(selectedIndex: 12,)))
                  .then((value) {
                setState(() {
                  isLoading = true;
                  getData();
                });
              });
            }));
  }

  Widget item(AddressModel model) {
    return Card(
        color: homeBackgroundColor,
        margin: const EdgeInsets.only(top: 5, right: 5, left: 5),
        child: Wrap(children: <Widget>[
          Column(children: <Widget>[
            // Container(
            //     margin: const EdgeInsets.only(top: 5, right: 8),
            //     child: Text(' موبایل: ${model.mobile?.length.toString() ?? ''}')),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 5, right: 8),
                  child: Text('دریافت کننده: ${model.buyerName ?? ''}')),
              GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5, left: 5),
                    child:Image.asset('assets/images/edit1.png',
                      width: 24,height: 24,),
                  ),
                  onTap: () async {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BottomNav(selectedIndex:11, arg: model)))
                        .then((value) {
                      setState(() {
                        isLoading = true;
                        getData();
                      });
                    });
                  })
            ]),
            Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 7, right: 10, left: 5, bottom: 5),
                child: Text('نشانی: ${model.buyerAddress ?? ''}',
                    style: const TextStyle(fontSize: 13)))
          ])
        ]));
  }
}

class AddressIndex extends StatefulWidget {
  const AddressIndex({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddressIndexState();
}
