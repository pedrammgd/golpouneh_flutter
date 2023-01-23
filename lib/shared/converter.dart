import 'dart:convert';
import 'package:shamsi_date/shamsi_date.dart';

String convertNumberToEnglish(String num) {
  String d = num;
  d = d.replaceAll("۰", "0");
  d = d.replaceAll("۱", "1");
  d = d.replaceAll("۲", "2");
  d = d.replaceAll("٣", "3");
  d = d.replaceAll("٤", "4");
  d = d.replaceAll("۵", "5");
  d = d.replaceAll("٦", "6");
  d = d.replaceAll("٧", "7");
  d = d.replaceAll("۸", "8");
  d = d.replaceAll("۹", "9");
  d = d.replaceAll("۰", "0");
  d = d.replaceAll("۱", "1");
  d = d.replaceAll("۲", "2");
  d = d.replaceAll("۳", "3");
  d = d.replaceAll("۴", "4");
  d = d.replaceAll("۵", "5");
  d = d.replaceAll("۶", "6");
  d = d.replaceAll("۷", "7");
  d = d.replaceAll("۸", "8");
  d = d.replaceAll("۹", "9");
  d = d.replaceAll("0", "0");
  d = d.replaceAll("1", "1");
  d = d.replaceAll("2", "2");
  d = d.replaceAll("3", "3");
  d = d.replaceAll("4", "4");
  d = d.replaceAll("5", "5");
  d = d.replaceAll("6", "6");
  d = d.replaceAll("7", "7");
  d = d.replaceAll("8", "8");
  d = d.replaceAll("9", "9");
  return d;
}

String utf8convert(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}

persianDate(String date) {

if(date =="0001-01-01T00:00:00"){
  return "نامشخص ";
}else{
  Jalali j = Jalali.fromDateTime(DateTime.parse(date));
  return '${j.year}/${j.month}/${j.day}';

}
}


String toman(double price) {
  String result = '';
  String temp1 = price.toString().split('.')[0];
  String temp = temp1.split('').reversed.join();
  for (int i = 0; i < temp.length; i++) {
    if ((i != 0) && (i % 3 == 0)) {
      result += ',';
    }
    result += temp[i];
  }
  return result.split('').reversed.join();
}

String tomanS(String price) {
  String result = '';
  String temp = price.split('').reversed.join();
  for (int i = 0; i < temp.length; i++) {
    if ((i != 0) && (i % 3 == 0)) {
      result += ',';
    }
    result += temp[i];
  }
  return result.split('').reversed.join();
}
