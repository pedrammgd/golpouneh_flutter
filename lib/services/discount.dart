import 'dart:convert';
import 'package:gol_pouneh/models/discount.dart';
import 'package:gol_pouneh/shared/converter.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:http/http.dart';

class DiscountService{
  Future<List<DiscountModel>> discountList() async {
    final response = await post(Uri.parse("http://api.golpouneh.com/Sale/SaleDiscount/UserDiscounts"), body: {
      "userId": DataMemory.userId.toString(),
    });
    final res = jsonDecode(utf8convert(response.body));
    List<DiscountModel> discounts = [];
    if(res["HttpStatusCode"] == "200"){
      if(res["Result"]["saleDiscount"] != null){
        discounts.addAll((res["Result"]["saleDiscount"] as List).map((e) => DiscountModel.fromJson(e)));
      }else {

      }
    }else {

    }
    return discounts;
  }
}