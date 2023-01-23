import 'package:flutter/material.dart';
import 'package:gol_pouneh/models/factor.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/bottom_nav.dart';
import 'package:gol_pouneh/shared/color.dart';
import 'package:gol_pouneh/shared/loading.dart';
import '../../services/factor.dart';
import '../../shared/converter.dart';

class MyFactorsState extends State<MyFactors> {
  List<FactorModel> factors = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    List response = await FactorService().factorHistory();
    setState(() {
      factors = response[0];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await getData();
        setState(() {});
      },
      child: Scaffold(
          appBar: appBar('سوابق خرید'),
          body: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20.0),
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"), fit: BoxFit.cover),
            ),
            child: isLoading
                ? Loading.circular()
                : factors.isEmpty
                    ? const Center(
                        child:
                            Text('تا کنون خریدی از سایت و اپلیکیشن گل پونه  نداشته اید'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: factors.length,
                        itemBuilder: (context, index) {
                          return item(factors[index]);
                        },
                      ),
          )),
    );
  }

  Widget item(FactorModel model) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomNav(selectedIndex: 15, arg: model)));
        },
        child: Card(
            margin: const EdgeInsets.only(top: 5, right: 5, left: 5),
            child: Wrap(children: <Widget>[
              Column(children: <Widget>[
                Container(
                    color: homeBackgroundColor,
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(top: 5, right: 8),
                    child: Text('شماره سفارش: ${model.invoiceSellNo!}')),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                      alignment: Alignment.centerRight,
                      margin:
                          const EdgeInsets.only(top: 7, right: 10, left: 5, bottom: 5),
                      child: Text(
                          model.isConfirm! ? 'وضعیت: پرداخت شده' : 'وضعیت: پرداخت نشده',
                          style: const TextStyle(fontSize: 13))),
                  Container(
                      alignment: Alignment.centerRight,
                      margin:
                          const EdgeInsets.only(top: 7, right: 10, left: 5, bottom: 5),
                      child: Text('زمان سفارش: ${persianDate(model.orderDate!)}',
                          style: const TextStyle(fontSize: 13))),
                ]),
                // Container(
                //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                //   child:  Text("شما به این خرید امتیاز نداده اید", style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),),
                // ),
              ])
            ])));
  }
}

class MyFactors extends StatefulWidget {
  const MyFactors({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFactorsState();
}
