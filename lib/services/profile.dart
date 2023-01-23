import 'dart:convert';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:http/http.dart' as http;
import "dart:io";
import '../shared/url.dart';
import '../shared/converter.dart';

class ProfileService {

  Future<String?> downloadProfileImage() async {
    var response = await http.post(Uri.parse(
        '${apiUrl}Main/Profile/GetImage'), body: {
      'userId': DataMemory.userId.toString(),
      "UserFileType": "4",
    });
    String fileName = jsonDecode(utf8convert(response.body))["Result"]["Item2"]["Message"];
    return fileName;
  }

  /*Future<dynamic> upload(File imageFile) async {
    String imageBase = base64Encode(imageFile.readAsBytesSync());
   var response = await http.post(
        Uri.parse("http://api.golpouneh.com/Main/Profile/UplaodImages"), body: {
      "UserIdentity": DataMemory.userId,
      "UserFileType": 4.toString(),
      "imageFile": imageBase
    });
    print(response.body);
  }*/

  Future<String> profileImage(File imageFile) async {
   // var bytes = imageFile.readAsBytesSync();
    var request = http.MultipartRequest(
        "POST", Uri.parse('${apiUrl}Main/Profile/UplaodImages'));
    request.fields["UserIdentityId"] = DataMemory.userId.toString();
    request.fields["UserFileType"] = "4";

    final httpImage = await http.MultipartFile.fromPath('imageFile', imageFile.path);
    request.files.add(httpImage);
    await request.send().then((response) {
      if (response.statusCode == 200) {
        return "Success";
      }
    }
    );
    return "";
  }
  /*Future<String> profileImage(File imageFile) async {
    var bytes = imageFile.readAsBytesSync();
    var request = http.MultipartRequest(
        "POST", Uri.parse('${apiUrl}Main/Profile/UplaodImages'));
    request.fields["UserIdentityId"] = DataMemory.userId;
    request.fields["UserFileType"] = "4";
    request.files.add(http.MultipartFile.fromString(
        'imageFile',
        base64Encode(bytes),
        contentType: MediaType("image", "jpg")
    ));
    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
      print(response.toString() + "salam");
    }
    );
    return "";
  }*/
}