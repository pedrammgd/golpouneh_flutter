import 'dart:convert';
import 'dart:developer';
import 'package:gol_pouneh/models/company_model.dart';
import 'package:gol_pouneh/shared/url.dart';
import 'package:http/http.dart' as http;
import '../shared/converter.dart';

class LocationService {
  Future<List<CompanyModel>> setCompany(int pageNumber, int pageSize) async {
    final response = await http.post(Uri.parse('${setLocationUrl}Index'),
        body: {'pageNumber': '1', 'pageSize': '100'});
    var responseBody =
        json.decode(utf8convert(response.body))['Result']['result'];
    return (responseBody as List).map((data) {
      // log(data.toString());
      return CompanyModel.fromJson(data);
    }).toList();
  }
}
