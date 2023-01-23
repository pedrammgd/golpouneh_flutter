import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/city.dart';
import '../models/drop_down.dart';
import '../shared/converter.dart';
import '../shared/data_memory.dart';
import '../shared/url.dart';

class SettingsService {
  Future update() async {
    final response = await http.post(Uri.parse('${settingsUrl}CheckUpdate'));
    var responseBody = json.decode(response.body);
    if (responseBody['HttpStatusCode'] == "200") return responseBody['Result']['update'];
    return '';
  }

  Future<String> privacyPolicy() async {
    final response = await http.post(Uri.parse('${settingsUrl}PrivacyPolicy'), body: {'path': 'gol_pounehs'});
    var responseBody = json.decode(response.body);
    if (responseBody['HttpStatusCode'] == "200") {
      return utf8convert(responseBody['Result']['htm']);
    }
    return '';
  }

  Future states() async {
    if (DataMemory.isOnline) {
      final response = await http.post(Uri.parse('${mainUrl}GetAllState'));
      var responseBody = json.decode(utf8convert(response.body))['Result']['liststate'];
      DataMemory.states = (responseBody as List).map((data) => DropDownModel.fromJson(data)).toList();
      // await DbContext.delete('States');
      // for (DropDownModel item in DataMemory.states) {
      //   await DbContext.createState(item);
      // }
    } else {
      // DataMemory.states = await DbContext.getStates();
    }
  }

  Future cities() async {
    if (DataMemory.isOnline) {
      final response = await http.post(Uri.parse('${mainUrl}GetAllCityWithState'));
      var responseBody = json.decode(utf8convert(response.body))['Result']['listCity'];
      DataMemory.cities = (responseBody as List).map((data) => CityModel.fromJson(data)).toList();
      // await DbContext.delete('Cities');
      // for (CityModel item in DataMemory.cities) {
      //   await DbContext.createCity(item);
      // }
    } else {
      // DataMemory.cities = await DbContext.getCity();
    }
  }
}
