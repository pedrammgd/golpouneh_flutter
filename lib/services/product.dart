import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../shared/converter.dart';
import '../shared/data_memory.dart';
import '../shared/url.dart';

class ProductService {
  Future<List<ProductModel>> search(String search, int pageNumber, int pageCount) async {
    final response =
        await http.post(Uri.parse('${productUrl}ProductUniquely/Newest'), body: {
      'userId': DataMemory.userId,
      'search': search,
      'pageNumber': pageNumber.toString(),
      'pageCount': pageCount.toString()
    });
    var responseBody =
        json.decode(utf8convert(response.body))['Result']['_result']['Item1'];
    return (responseBody as List).map((data) => ProductModel.fromJson(data)).toList();
  }

  Future<List<ProductModel>> byCategory(
      int categoryId, int pageNumber, int pageCount) async {
    final response =
        await http.post(Uri.parse('${productUrl}ProductUniquely/Newest'), body: {
      'userId': DataMemory.userId,
      'search': '',
      'categoryId': categoryId.toString(),
      'pageNumber': pageNumber.toString(),
      'pageCount': pageCount.toString()
    });
    var responseBody =
        json.decode(utf8convert(response.body))['Result']['_result']['Item1'];
    return (responseBody as List).map((data) => ProductModel.fromJson(data)).toList();
  }

  Future<List<ProductModel>> newestProducts(int pageNumber, int pageCount) async {
    final response =
        await http.post(Uri.parse('${productUrl}ProductUniquely/Newest'), body: {
      'userId': DataMemory.userId,
      'search': '',
      'pageNumber': pageNumber.toString(),
      'pageCount': pageCount.toString()
    });
    var responseBody =
        json.decode(utf8convert(response.body))['Result']['_result']['Item1'];
    return (responseBody as List).map((data) => ProductModel.fromJson(data)).toList();
  }

  Future<List<ProductModel>> bestSellerProducts(int pageNumber, int pageCount) async {
    final response =
        await http.post(Uri.parse('${productUrl}ProductUniquely/Bestseller'), body: {
      'userId': DataMemory.userId,
      'search': '',
      'pageNumber': pageNumber.toString(),
      'pageCount': pageCount.toString()
    });
    var responseBody =
        json.decode(utf8convert(response.body))['Result']['_result']['Item1'];
    return (responseBody as List).map((data) => ProductModel.fromJson(data)).toList();
  }

  Future<List<ProductModel>> mostDiscountProducts(int pageNumber, int pageCount) async {
    final response =
        await http.post(Uri.parse('${productUrl}ProductUniquely/MostDiscount'), body: {
      'userId': DataMemory.userId,
      'search': '',
      'pageNumber': pageNumber.toString(),
      'pageCount': pageCount.toString()
    });

    var responseBody =
        json.decode(utf8convert(response.body))['Result']['_result']['Item1'];

    return (responseBody as List).map((data) => ProductModel.fromJson(data)).toList();
  }

  Future<ProductModel> todayOffer() async {
    final response = await http
        .post(Uri.parse('${productUrl}ProductUniquely/MostDiscount'), body: {
      'userId': DataMemory.userId,
      'search': '',
      'pageNumber': '1',
      'pageCount': '1'
    });
    var responseBody =
        json.decode(utf8convert(response.body))['Result']['_result']['Item1'];
    return (responseBody as List).map((data) => ProductModel.fromJson(data)).toList()[0];
  }
}
