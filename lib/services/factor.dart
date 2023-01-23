import 'dart:convert';
import 'package:gol_pouneh/models/payment_way.dart';
import 'package:http/http.dart';
import '../models/factor.dart';
import '../models/product.dart';
import '../models/result_operation.dart';
import '../shared/converter.dart';
import '../shared/data_memory.dart';
import '../shared/url.dart';
PaymentWay paymentWay = PaymentWay();
class FactorService {
  Future<List> factorHistory() async {
    final response = await post(Uri.parse('${saleUrl}SaleFactor/MyFactors'),
        body: {'userId': DataMemory.userId, 'isClosed': 'true'});
    var responseBody =
    json.decode(utf8convert(response.body))['Result']['factors']['Item1'];
    ResultOperation resultOperation = ResultOperation.fromJson(
        jsonDecode((utf8convert(response.body)))['Result']['factors']['Item2']);
    return [
      (responseBody as List).map((data) => FactorModel.fromJson(data)).toList(),
      resultOperation
    ];
  }

  Future<PaymentWay> factorDetails(int id) async {

    final uri = Uri.parse('${saleUrl}SaleFactor/FactorDetails');
    var request =  MultipartRequest('POST', uri);

    request.fields["id"] = id.toString();
    final response = await request.send();

    final respStr = await response.stream.bytesToString();

    Map<String, dynamic> data =  Map<String, dynamic>.from(json.decode(respStr));


    paymentWay = PaymentWay.fromJson(data["Result"]['resultFactorDetail']['Item1']);

    // paymentWay =
    //  PaymentWay.fromJson(json.decode(utf8convert(respStr))['Result']['resultFactorDetail']['Item1']);

    // final response = await post(Uri.parse('${saleUrl}SaleFactor/FactorDetails'),
    //     body: {'id': id.toString()});
    //
    // paymentWay =
    // PaymentWay.fromJson(json.decode(utf8convert(response.body))['Result']['resultFactorDetail']['Item1']);

    return paymentWay;

  }

  Future<List<ProductModel>> factorProducts(int factorId) async {
    final response = await post(Uri.parse('${saleUrl}SaleOrderProduct/MyOrder'),
        body: {'userId': DataMemory.userId, 'factorId': factorId.toString()});
    var responseBody =
    json.decode(utf8convert(response.body))['Result']['result']['Item1'];
    return (responseBody as List).map((data) => ProductModel.fromJson(data)).toList();
  }
  Future<ResultOperation> finalizeCart(int saleSupplierId) async {
    var response = await post(
        Uri.parse('${saleUrl}SaleOrderProduct/FinalizeOrderProduct'),
        body: {'userId': DataMemory.userId,
          'factorId':  DataMemory.factorId.toString(),
          'saleSupplierId' : saleSupplierId.toString()});
    ResultOperation resultOperation = ResultOperation.fromJson(
        jsonDecode((utf8convert(response.body)))['Result']['Item2']);
    return resultOperation;
  }

  Future<ResultOperation> setAddress(int addressId) async {
    var response =
    await post(Uri.parse('${saleUrl}SaleFactor/SelectAddressForFactor'), body: {
      'factorId': '${DataMemory.factorId}',
      'saleDeliveryId': '$addressId',
    });

    ResultOperation resultOperation = ResultOperation.fromJson(
        jsonDecode((utf8convert(response.body)))['Result']['resultStatusOperation']);
    return resultOperation;
  }

  Future<String> onlinePayEghtesad() async {
    var response = await get(Uri.parse(
        '${saleUrl}SalePayment/Payment?saleFactorId=${DataMemory.factorId}&bankName=13'));
    String result = jsonDecode((utf8convert(response.body)))['message'];
    return result;
  }
  Future<String> onlinePayKeshavarzi() async {

    // var response = await get(Uri.parse(
    //     '${saleUrl}SalePayment/Payment?saleFactorId=${2120}&bankName=11'));
    var response = await get(Uri.parse(
        'https://golpouneh.com/Sale/SalePayment/Payment?saleFactorId=${DataMemory.factorId}&bankName=11'));

    String result = jsonDecode((utf8convert(response.body)))['message'].toString();
    return result;

  }
  Future<ResultOperation> homePay(int factorId) async {
    var response = await get(Uri.parse(
        '${saleUrl}SalePayment/Payment?saleFactorId=$factorId&bankName=33'));
    ResultOperation result = ResultOperation.fromJson(
        jsonDecode((utf8convert(response.body)))['Result']['Item2']);
    return result;
  }


}
