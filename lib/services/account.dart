import 'dart:convert';
import 'package:gol_pouneh/models/Score_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile.dart';

import '../models/result_operation.dart';
import '../shared/converter.dart';
import '../shared/url.dart';

class AccountService {
  Future<ResultOperation> register(String firstName, String lastName,
      String phoneNumber, String titleOrganization) async {
    final response = await post(Uri.parse('${accountUrl}SignUp'), body: {
      'FirstName': firstName,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'AboutMe': titleOrganization
    });
    if (response.statusCode == 200) {
      var responseBody =
          json.decode(utf8convert(response.body))['Result']['Item2'];
      return ResultOperation.fromJson(responseBody);
    } else {
      return ResultOperation(
          isSuccess: false, message: 'خطا در دریافت اطلاعات از سرور');
    }
  }

  Future<ResultOperation> login(String phoneNumber) async {
    final response = await post(
        Uri.parse('${accountUrl}SigninSendVerficationNumber'),
        body: {'phoneNumber': phoneNumber});
    if (response.statusCode == 200) {
      var responseBody = json.decode(utf8convert(response.body))['Result']
          ['resultStatusOperation'];
      return ResultOperation.fromJson(responseBody);
    } else {
      return ResultOperation(
          isSuccess: null, message: 'خطا در دریافت اطلاعات از سرور');
    }
  }

  Future<ResultOperation> checkSms(String phoneNumber, String smsCode) async {
    final response = await post(
        Uri.parse('${accountUrl}SigninCheckVerficationNumber'),
        body: {'PhoneNumber': phoneNumber, 'SMSCode': smsCode});
    try {
      var responseBody = json.decode(utf8convert(response.body))['Result'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userId', responseBody['_loginViewModel']['Item1']['Id']);
      prefs.setString('phoneNumber', phoneNumber);
      return ResultOperation.fromJson(responseBody['_loginViewModel']['Item2']);
    } catch (e) {
      return ResultOperation(
          isSuccess: false, message: 'خطا در دریافت اطلاعات از سرور');
    }
  }

  Future<ProfileModel> getProfileInfo(String userId) async {
    final response =
        await get(Uri.parse('${accountUrl}GetUserIdentityInfo?id=$userId'));
    if (response.statusCode == 200) {
      var responseBody =
          json.decode(utf8convert(response.body))['Result']['Item1'];
      return ProfileModel.fromJson(responseBody);
    } else {
      return ProfileModel(
          firstName: '', lastName: '', email: '', phoneNumber: '');
    }
  }

  Future<ScoreModel> setPointForRepresentativeUser(
      String representativePhoneNumber, String userPhoneNumber) async {
    final response = await post(
        Uri.parse(
            '${setPointForRepresntativeUrl}SetPointForRepresentativeUser'),
        body: {
          'representativePhoneNumber': representativePhoneNumber,
          'userPhoneNumber': userPhoneNumber
        });
    if (response.statusCode == 200) {
      var responseBody = json.decode(utf8convert(response.body));
      return ScoreModel.fromJson(responseBody);
    } else {
      return ScoreModel(httpStatusCode: '');
    }
  }

  Future<ScoreModel> setPointForSetupApplication(String phoneNumber) async {
    final response = await post(
        Uri.parse('${setPointForRepresntativeUrl}SetPointForSetupApplication'),
        body: {'phoneNumber': phoneNumber});
    if (response.statusCode == 200) {
      var responseBody = json.decode(utf8convert(response.body));
      return ScoreModel.fromJson(responseBody);
    } else {
      return ScoreModel(httpStatusCode: '');
    }
  }

  Future<ProfileModel> getProfileInfoByUserName(String userName) async {
    final response = await post(
        Uri.parse('${accountUrl}GetUserIdentityInfoByUserName'),
        body: {'userName': userName});
    try {
      var responseBody =
          json.decode(utf8convert(response.body))['Result']['Item1'];
      return ProfileModel.fromJson(responseBody);
    } catch (e) {
      return ProfileModel(
          firstName: '', lastName: '', email: '', phoneNumber: '', id: '');
    }
  }

  Future<ResultOperation> editProfileInfo(ProfileModel model) async {
    final response =
        await post(Uri.parse('${accountUrl}Edit'), body: model.toJson());
    if (response.statusCode == 200) {
      var responseBody =
          json.decode(utf8convert(response.body))['Result']['Item2'];
      return ResultOperation.fromJson(responseBody);
    } else {
      return ResultOperation(
          isSuccess: false, message: 'خطا در دریافت اطلاعات از سرور');
    }
  }

  Future<List<ProfileModel>> myContacts(List<String> phoneNumbers) async {
    String data = '';
    for (var i in phoneNumbers) {
      data += i;
      data += ',';
    }
    data.substring(0, data.length - 1);
    final response = await post(Uri.parse('${accountUrl}GetUsersByPhoneNumber'),
        body: {'phoneNumbers': data.toString()});
    if (response.statusCode == 200) {
      var responseBody =
          json.decode(utf8convert(response.body))['Result']['Item1'];
      return (responseBody as List)
          .map((data) => ProfileModel.fromJson(data))
          .toList();
    } else {
      return [];
    }
  }
}
