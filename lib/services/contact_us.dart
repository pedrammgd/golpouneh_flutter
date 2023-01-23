import 'dart:convert';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/url.dart';
import 'package:http/http.dart';

class ContactUsService{
  Future<bool> submitMessage(String subject, String message) async {
    var res =  await post(Uri.parse("${apiUrl}Main/Main/ContactUs",), body: {
      "UserRequesterId": DataMemory.userId.toString(),
      "Subject": subject,
      "Content": message,
    });
    var resBody = jsonDecode(res.body);
    if(resBody["HttpStatusCode"] == "200" && resBody["Result"]["Item2"]["IsSuccessed"] == true){
      return true;
    }
    return false;
  }
}