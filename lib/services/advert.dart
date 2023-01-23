import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/advert.dart';
import '../shared/converter.dart';
import '../shared/url.dart';

class AdvertService {
  Future<List<AdvertModel>> index(List<int> position) async {
    final response = await http.post(Uri.parse('${advertUrl}index'),
        body: {'advertLocationId': position.toString(), "isVisible": "true"});
    var responseBody = json.decode(utf8convert(response.body))['Result']
        ['indexViewModel']['Slider'];
    return (responseBody as List)
        .map((data) => AdvertModel.fromJson(data))
        .toList();
  }
}
