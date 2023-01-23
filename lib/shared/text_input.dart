import 'package:flutter/material.dart';
import 'color.dart';
import 'converter.dart';

Widget textInput(String title, TextEditingController controller, IconData icon,
    [TextInputType type = TextInputType.text]) {
  return
    Container(
      margin: const EdgeInsets.only(top: 25),
      height: 55,
      width: 320,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: homeBackgroundColor),
      child: TextFormField(
          controller: controller,
          textDirection:
              type == TextInputType.emailAddress ? TextDirection.ltr : TextDirection.rtl,
          keyboardType: type,
          onChanged: (text) {
            controller.text = convertNumberToEnglish(controller.text);
            controller.selection =
                TextSelection.fromPosition(TextPosition(offset: controller.text.length));
          },
          decoration: InputDecoration(
              labelText: title,
              labelStyle: const TextStyle(color: Colors.black87),
              fillColor: mainColor,
              prefixIcon: Icon(icon),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(15),),),),);
}

Widget textInputAction(String title, TextEditingController controller, IconData icon,
    Function(String str) onSubmitted,
    [TextInputType type = TextInputType.text]) {
  return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 55,
      width: 320,

      decoration: const BoxDecoration( color: homeBackgroundColor),
      child: TextField(
          controller: controller,
          textDirection:
              type == TextInputType.emailAddress ? TextDirection.ltr : TextDirection.rtl,
          keyboardType: type,
          textInputAction: TextInputAction.go,
          onSubmitted: onSubmitted,
          onChanged: (text) {
            controller.text = convertNumberToEnglish(controller.text);
            controller.selection =
                TextSelection.fromPosition(TextPosition(offset: controller.text.length));
          },
          decoration: InputDecoration(
              labelText: title,
              labelStyle: const TextStyle(color: textColor),
              fillColor: mainColor,
              prefixIcon: Icon(icon),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor2, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor2, width: 2),
                  borderRadius: BorderRadius.circular(15),),),),);
}

Widget textInputMultiline(String title, TextEditingController controller, IconData icon) {
  return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 180,
      width: 320,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: homeBackgroundColor),
      child: TextFormField(
          controller: controller,
          maxLines: 6,
          decoration: InputDecoration(
              labelText: title,
              labelStyle: const TextStyle(color: textColor),
              fillColor: mainColor,
              prefixIcon: Icon(icon),
              isDense: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColor, width: 2),
                  borderRadius: BorderRadius.circular(15),),),),);
}
