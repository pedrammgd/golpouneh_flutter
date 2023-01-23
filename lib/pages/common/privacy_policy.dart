import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gol_pouneh/services/settings.dart';
import 'package:gol_pouneh/shared/color.dart';
import '../../shared/appbar.dart';
import '../../shared/loading.dart';
import '../identity/login.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PrivacyPolicyState();
}

class PrivacyPolicyState extends State<PrivacyPolicy> {
  late String data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    data = await SettingsService().privacyPolicy();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("قوانین و مقررات"),
        body: isLoading
            ? Loading.circular()
            : SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                Html(data: data, style: {"html": Style(fontFamily: 'IRANSans')}),
                agree()
              ])));
  }

  Widget agree() {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: mainColor),
            width: 320,
            height: 55,
            margin: const EdgeInsets.only(top: 20, bottom: 50),
            alignment: Alignment.center,
            child: const Text("متوجه شدم", style: TextStyle(color: Colors.white, fontSize: 17))),
        onTap: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        });
  }
}
