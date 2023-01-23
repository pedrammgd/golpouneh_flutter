import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../shared/converter.dart';
import '../shared/url.dart';

class CategoryService {
  Future<List<CategoryModel>> index({int? parentId}) async {
    final response = await http
        .post(Uri.parse('${productUrl}ProductCategory/Index'), body: {'parentId': parentId.toString()});
    // debugPrint(utf8convert(response.body));
    var responseBody = json.decode(utf8convert(response.body))['Result']['Item1'];
    return (responseBody as List).map((data) => CategoryModel.fromJson(data)).toList();
  }
}
