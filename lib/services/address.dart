import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/address.dart';
import '../models/result_operation.dart';
import '../shared/converter.dart';
import '../shared/data_memory.dart';
import '../shared/url.dart';

class AddressService {
  Future myAddresses(int saleSupplierId) async {
    final response = await http.post(
        Uri.parse('http://api.golpouneh.com/Sale/SaleDelivery/MyAddress'),
        body: {'userId': DataMemory.userId, 'saleSupplierId': '0'});
    var responseBody =
        json.decode(utf8convert(response.body))['Result']['Item1'];
    return (responseBody as List).map((data) {
      return AddressModel.fromJson(data);
    }).toList();
  }

  Future<ResultOperation> create(
      String buyerName,
      String buyerAddress,
      String postalCode,
      String mobile,
      String? longitude,
      String? latitude) async {
    final response =
        await http.post(Uri.parse('${saleUrl}SaleDelivery/Create'), body: {
      'UserIdentityId': DataMemory.userId,
      'BuyerName': buyerName,
      'BuyerAddress': buyerAddress,
      'PostalCode': postalCode,
      'Mobile': mobile,
      'Longitude': longitude,
      'Latitude': latitude
    });
    debugPrint(utf8convert(response.body));
    ResultOperation resultOperation = ResultOperation.fromJson(
        jsonDecode((utf8convert(response.body)))['Result']['Item2']);
    return resultOperation;
  }

  Future<ResultOperation> edit(
      int id,
      String buyerName,
      String buyerAddress,
      String postalCode,
      String mobile,
      String? longitude,
      String? latitude) async {
    final response =
        await http.post(Uri.parse('${saleUrl}SaleDelivery/Edit'), body: {
      'Id': id.toString(),
      'UserIdentityId': DataMemory.userId,
      'BuyerName': buyerName,
      'BuyerAddress': buyerAddress,
      'PostalCode': postalCode,
      'Mobile': mobile,
      'Longitude': longitude,
      'Latitude': latitude
    });
    debugPrint(utf8convert(response.body));
    ResultOperation resultOperation = ResultOperation.fromJson(
        jsonDecode((utf8convert(response.body)))['Result']['Item2']);
    return resultOperation;
  }

  Future<ResultOperation> delete(int id) async {
    final response = await http.post(
        Uri.parse('http://api.golpouneh.com/Sale/SaleDelivery/Delete'),
        body: {'Id': id.toString()});
    ResultOperation resultOperation = ResultOperation.fromJson(
        jsonDecode((utf8convert(response.body)))['Result']['result']);
    return resultOperation;
  }
}
