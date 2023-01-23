import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/color.dart';
import '../../shared/appbar.dart';

class MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar("پیام ها"),
        body:  Container(
        height: double.infinity,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/banner.jpg"),
        fit: BoxFit.cover),
        ),child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(children: <Widget>[
              Card(
                  color:homeBackgroundColor,
                  elevation: 2,
                  child: SizedBox(
                      width: double.infinity,
                      height: 70,
                      child: Row(children: <Widget>[
                        Container(
                            width: 40,
                            margin: const EdgeInsets.only(left: 10, right: 8),
                            decoration: const BoxDecoration(
                                color: mainColor, shape: BoxShape.circle),
                            child: const Center(
                                child: Text("خ",
                                    style: TextStyle(color: titleColor, fontSize: 19)))),
                        const Text("خوش آمدید!")
                      ])))
            ])))

       );
  }
}

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MessagesState();
}
