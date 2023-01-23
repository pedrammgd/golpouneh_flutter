import 'package:flutter/material.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import '../pages/supplier/location_on_map.dart';
import 'color.dart';

PreferredSizeWidget appBar(String title,
    [Color color = mainColor, List<Widget>? actions, Widget? leading]) {
  return AppBar(
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    backgroundColor: color,
    centerTitle: false,
    leading: leading,
    actions: actions,
  );
}

PreferredSizeWidget appBarCustom(String title, Color bgColor, Color txtColor) {
  return AppBar(
      title: Text(title,
          style: TextStyle(color: txtColor, fontWeight: FontWeight.bold)),
      backgroundColor: bgColor,
      centerTitle: false);
}

PreferredSizeWidget appBarNoBack(String title) {
  return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      automaticallyImplyLeading: false,
      backgroundColor: mainColor,
      centerTitle: false);
}

PreferredSizeWidget appBarNoShadow(String title) {
  return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: mainColor,
      elevation: 0,
      centerTitle: false);
}

PreferredSizeWidget appBarWithAction(
    String title, IconData icon, VoidCallback onPressed) {
  return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(title),
      backgroundColor: mainColor,
      actions: <Widget>[
        IconButton(icon: Icon(icon, color: titleColor), onPressed: onPressed)
      ],
      centerTitle: false);
}

PreferredSizeWidget appBarLocation(String s, BuildContext context) {
  return AppBar(
      title: Text(s, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: mainColor,
      elevation: 0,
      centerTitle: false,
      actions: [
        GestureDetector(
            child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: GestureDetector(
                    onTap: () {
                      DataMemory.geoLocation = null;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocationOnMAp()));
                    },
                    child: Row(children: const [
                      Icon(Icons.location_on_outlined,
                          color: Colors.white, size: 23),
                      Text('مکان یابی ',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ]))),
            onTap: () {
              DataMemory.geoLocation = null;
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  LocationOnMAp()));

              //toastFail('مکان یابی', 'خطا در یافتن نزدیک ترین شعبه', context);
            })
      ]);
}
