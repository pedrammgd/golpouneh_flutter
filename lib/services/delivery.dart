import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gol_pouneh/models/result_operation.dart';
import 'package:gol_pouneh/shared/converter.dart';
import 'package:gol_pouneh/shared/url.dart';
import 'package:http/http.dart' as http;

class DeliveryService {
  Future<Delivery> calculateDelivery(
    String totalPrice,
    String saleDeliveryPriceItem,
  ) async {
    final response =
        await http.post(Uri.parse('${deliveryUrl}GetExtraCosts'), body: {
      'totalPrice': totalPrice,
      'saleDeliveryPriceItem': saleDeliveryPriceItem,
    });
    debugPrint(utf8convert(response.body));
    Delivery resultOperation =
        Delivery.fromJson(jsonDecode((utf8convert(response.body))));
    return resultOperation;
  }
}

class Delivery {
  Delivery({
    this.httpStatusCode,
    this.result,
  });

  Delivery.fromJson(dynamic json) {
    httpStatusCode = json['HttpStatusCode'];
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  String? httpStatusCode;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['HttpStatusCode'] = httpStatusCode;
    if (result != null) {
      map['Result'] = result?.toJson();
    }
    return map;
  }
}

class Result {
  Result({
    this.price,
  });

  Result.fromJson(dynamic json) {
    price = json['price'];
  }
  double? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    return map;
  }
}
