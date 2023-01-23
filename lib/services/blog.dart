import 'dart:convert';
import 'package:http/http.dart' as http;
import '../shared/converter.dart';
import '../shared/url.dart';
import '../models/blog_article.dart';

class BlogService {
  Future<List<BlogArticleModel>> index() async {
    final response =
        await http.post(Uri.parse('${blogUrl}index'), body: {'pageNumber': '1', 'pageSize': '100'});
    var responseBody = json.decode(utf8convert(response.body))['Result']['pagedList'];
    return (responseBody as List).map((data) => BlogArticleModel.fromJson(data)).toList();
  }
}
