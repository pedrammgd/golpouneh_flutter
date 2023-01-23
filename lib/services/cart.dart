import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';
import '../models/result_operation.dart';
import '../shared/converter.dart';
import '../shared/data_memory.dart';
import '../shared/url.dart';

class CartService {
  Future<List<ProductModel>> cartProducts() async {
    List<ProductModel> products = [];
    Response response = await post(Uri.parse('${saleUrl}SaleOrderProduct/MyOrder'),
        body: {'userId': DataMemory.userId});
    try {
      var responseBody =
      json.decode(utf8convert(response.body))['Result']['result']['Item1'];
      DataMemory.factorId =
      json.decode(utf8convert(response.body))['Result']['Item2']['Id'];
      products =
          (responseBody as List).map((data) {

            return ProductModel.fromJson(data);
          }).toList();

      return products;
    } catch (e) {
      print(e);
      return products;
    }
  }

  Future<ResultOperation> editCart(int productId, int quantity) async {
    var response = await post(Uri.parse('${saleUrl}SaleOrderProduct/AddProduct'), body: {
      'userId': DataMemory.userId,
      'ProductUniquelyId': productId.toString(),
      'Quantity': quantity.toString(),
    });
    try {
      int responseBody = json.decode(utf8convert(response.body))['Result']
      ['resultStatusOperation']['Item1'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('factorId', responseBody.toString());
      ResultOperation resultOperation = ResultOperation.fromJson(
          jsonDecode((utf8convert(response.body)))['Result']['resultStatusOperation']
          ['Item2']);
      return resultOperation;
    } catch (e) {
      debugPrint(e.toString());
      return ResultOperation();
    }
  }

  Future<ResultOperation> finalizeCart() async {
    var response = await post(
        Uri.parse('${saleUrl}SaleOrderProduct/FinalizeOrderProduct'),
        body: {'userId': DataMemory.userId});
    try {
      ResultOperation resultOperation = ResultOperation.fromJson(
          jsonDecode((utf8convert(response.body)))['Result']['resultStatusOperation']);
      return resultOperation;
    } catch (e) {
      debugPrint(e.toString());
      return ResultOperation();
    }
  }

  Future<ResultOperation> setDiscountCode(String discountCode) async {
    var response = await post(
        Uri.parse('${saleUrl}SaleDiscount/SetDiscount'),
        body: {'userId': DataMemory.userId,
          'saleFactorId': DataMemory.factorId.toString(),
          'saleDiscountCode' :discountCode
    });
    try {
      ResultOperation resultOperation = ResultOperation.fromJson(
          jsonDecode((utf8convert(response.body)))['Result']['resultSetDiscount']['Item2']);
      return resultOperation;
    } catch (e) {
      debugPrint(e.toString());
      return ResultOperation();
    }
  }
}
