import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/color.dart';
import '../../shared/appbar.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('به روز رسانی'),
        backgroundColor: backgroundColor,
        body:
        Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover),
            ),child: Center(
            child: Container(
             padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: homeBackgroundColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: const Text('شما در حال استفاده از آخرین نسخه اپلیکیشن می باشید.',
                  style: TextStyle(fontSize: 15)),
            ))

        )
       );
  }
}
