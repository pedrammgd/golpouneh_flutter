import 'dart:convert';
/// IsPayment : true
/// GiverId : null
/// Giver : null
/// ReciverId : null
/// Reciver : null
/// TypeDeposits : 0
/// PaymentStatus : 0
/// SaleFactorId : 4307
/// SaleFactor : {"SaleSupplierId":null,"SaleSupplier":null,"SaleResellerId":null,"SaleReseller":null,"SaleDeliveryId":1039,"SaleDelivery":{"UserIdentityId":"b36d1f58-9233-42a4-9a86-0722d72f1feb","UserIdentity":null,"SaleDeliveryCostId":null,"SaleDeliveryCost":null,"SaleFactor":[],"BuyerName":"ففف شبانکار","NationalCode":null,"BuyerAddress":"سنثهت۶خا بشوسعتثعت ستعصت","BuyerEmail":null,"BuyerTel":null,"PostalCode":"1234567891","Mobile":"09179792082  ","RegisterDate":"0001-01-01T00:00:00","Id":1039,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SaleDiscountId":null,"SaleDiscount":null,"SaleFactorCategoryId":null,"SaleFactorCategory":null,"CarUserId":null,"CarUser":null,"InvoiceSellNo":"2022101209380090","CommentStatus":"این فاکتور در محل پرداخت می شود","SaleVehicleEnterExit":[],"SalePayment":[],"SaleFactorStatusHistory":[],"OrderDate":"2022-10-12T09:38:17.7871626","ModifiedDate":"2022-10-12T09:38:00.9001722","IsConfirm":false,"IsClosed":true,"IsDelete":false,"DeliveryDate":null,"Discount":null,"CommentDiscount":null,"UserIdentityId":"b36d1f58-9233-42a4-9a86-0722d72f1feb","UserIdentity":null,"SaleCost":[],"SaleSubFactorId":null,"SaleSubFactor":null,"RegisterDate":"2022-10-12T09:38:00.9000759","Id":4307,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}
/// BepichRequestHeaderId : null
/// BepichRequestHeader : null
/// BankReceiveCityId : null
/// BankReceiveCity : null
/// SerialNumber : null
/// CheckCode : null
/// Branch : null
/// Price : 35500.0
/// CheckDate : null
/// ActionDate : null
/// ReceiptDate : null
/// IsVisible : true
/// RegisterDate : "2022-10-12T09:39:21.6365568"
/// RefId : null
/// ResCodebpPayRequest : null
/// ResCodebpVerifyRequest : null
/// ResCodebpInquiryRequest : null
/// ResCodebpSettleRequest : null
/// SendRequestStatus : null
/// VerifyRequestStatus : null
/// ResultVerifyRequestStatus : null
/// OrderId : null
/// SaleReferenceId : null
/// BankNames : 33
/// ReferBankCode : null
/// DigitalReceipt : null
/// CardNumber : null
/// ConfirmComment : "این فاکتور در محل پرداخت می شود"
/// ConfirmDate : null
/// IsConfirm : true
/// AccountConfirmId : null
/// AccountConfirm : null
/// Id : 3298
/// ResultStatusOperation : {"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}

PaymentWay paymentWayFromJson(String str) => PaymentWay.fromJson(json.decode(str));
String paymentWayToJson(PaymentWay data) => json.encode(data.toJson());
class PaymentWay {
  PaymentWay({
      bool? isPayment,
      num? saleFactorId,
      SaleFactor? saleFactor, 
      dynamic bepichRequestHeaderId, 
      dynamic bepichRequestHeader, 
      dynamic bankReceiveCityId, 
      dynamic bankReceiveCity, 
      dynamic serialNumber, 
      dynamic checkCode, 
      dynamic branch, 
      num? price, 
      dynamic checkDate, 
      dynamic actionDate,
      dynamic receiptDate, 
      String? registerDate,
      int? bankNames,
      dynamic referBankCode, 
      dynamic digitalReceipt, 
      dynamic cardNumber, 
      String? confirmComment, 
      dynamic confirmDate, 
      bool? isConfirm, 
      dynamic accountConfirmId, 
      dynamic accountConfirm, 
      num? id,
      ResultStatusOperation? resultStatusOperation,
      String? payableAmountWithoutDiscount,
      String? buyerName,
    String? buyerAddress,
    String? postalCode,
    String? mobile,
    bool? isClosed,
  }){
    _isPayment = isPayment;
    _saleFactorId = saleFactorId;
    _saleFactor = saleFactor;
    _bepichRequestHeaderId = bepichRequestHeaderId;
    _bepichRequestHeader = bepichRequestHeader;
    _bankReceiveCityId = bankReceiveCityId;
    _bankReceiveCity = bankReceiveCity;
    _serialNumber = serialNumber;
    _checkCode = checkCode;
    _branch = branch;
    _price = price;
    _checkDate = checkDate;
    _actionDate = actionDate;
    _receiptDate = receiptDate;
    _registerDate = registerDate;
    _bankNames = bankNames;
    _referBankCode = referBankCode;
    _digitalReceipt = digitalReceipt;
    _cardNumber = cardNumber;
    _confirmComment = confirmComment;
    _confirmDate = confirmDate;
    _isConfirm = isConfirm;
    _accountConfirmId = accountConfirmId;
    _accountConfirm = accountConfirm;
    _id = id;
    _resultStatusOperation = resultStatusOperation;
    _payableAmountWithoutDiscount = payableAmountWithoutDiscount;
    _buyerName = buyerName;
    _buyerAddress = buyerAddress;
    _postalCode = postalCode;
    _mobile = mobile;
    _isClosed = isClosed;

  }

  PaymentWay.fromJson(dynamic json) {
    _isPayment = json["IsPaymentSuccess"];
    _saleFactorId = json['SaleFactorId'];
    _saleFactor = json['SaleFactor'] != null ? SaleFactor.fromJson(json['SaleFactor']) : null;
    _bepichRequestHeaderId = json["SaleFactor"]["SaleDelivery"]['BepichRequestHeaderId'];
    _bepichRequestHeader = json["SaleFactor"]["SaleDelivery"]['BepichRequestHeader'];
    _bankReceiveCityId = json["SaleFactor"]["SaleDelivery"]['BankReceiveCityId'];
    _bankReceiveCity = json["SaleFactor"]["SaleDelivery"]['BankReceiveCity'];
    _serialNumber = json["SaleFactor"]["SaleDelivery"]['SerialNumber'];
    _checkCode = json["SaleFactor"]["SaleDelivery"]['CheckCode'];
    _branch = json["SaleFactor"]["SaleDelivery"]['Branch'];
    _price = json["SaleFactor"]["SaleDelivery"]['TotalPrice'];
    _checkDate = json["SaleFactor"]["SaleDelivery"]['CheckDate'];
    _actionDate = json["SaleFactor"]["SaleDelivery"]['ActionDate'];
    _receiptDate = json["SaleFactor"]["SaleDelivery"]['ReceiptDate'];
    _registerDate = json["SaleFactor"]['RegisterDate'];
    _bankNames = (json["SalePayment"] as List).isEmpty ? "" : json["SalePayment"][(json["SalePayment"] as List).length-1]["BankNames"];
    _referBankCode = json["SaleFactor"]["SaleDelivery"]['ReferBankCode'];
    _digitalReceipt = json["SaleFactor"]["SaleDelivery"]["DigitalReceipt"];
    _cardNumber = json["SaleFactor"]["SaleDelivery"]['CardNumber'];
    _confirmComment = json["SaleFactor"]["SaleDelivery"]['ConfirmComment'];
    _confirmDate = json["SaleFactor"]["SaleDelivery"]['ConfirmDate'];
    _isConfirm = (json["SalePayment"] as List).isEmpty ? "" : json["SalePayment"][(json["SalePayment"] as List).length-1]["IsConfirm"];
    _accountConfirmId = json["SaleFactor"]["SaleDelivery"]['AccountConfirmId'];
    _accountConfirm = json["SaleFactor"]["SaleDelivery"]['AccountConfirm'];
    _id = json["SaleFactor"]["SaleDelivery"]['Id'];
    _resultStatusOperation = json["SaleFactor"]["SaleDelivery"]['ResultStatusOperation'] != null ? ResultStatusOperation.fromJson(json["SaleFactor"]["SaleDelivery"]['ResultStatusOperation']) : null;
    _payableAmountWithoutDiscount = json["PayableAmmountWithoutDiscount"].toString();
    _buyerName = json["SaleFactor"]["SaleDelivery"]['BuyerName'];
    _buyerAddress = json["SaleFactor"]["SaleDelivery"]['BuyerAddress'];
    _postalCode = json["SaleFactor"]["SaleDelivery"]['PostalCode'];
    _mobile = json["SaleFactor"]["SaleDelivery"]['Mobile'];
    _isClosed = json["SaleFactor"]["IsClosed"];
  }
  bool? _isPayment;
  dynamic _giverId;
  dynamic _giver;
  dynamic _reciverId;
  dynamic _reciver;
  num? _typeDeposits;
  num? _paymentStatus;
  num? _saleFactorId;
  SaleFactor? _saleFactor;
  dynamic _bepichRequestHeaderId;
  dynamic _bepichRequestHeader;
  dynamic _bankReceiveCityId;
  dynamic _bankReceiveCity;
  dynamic _serialNumber;
  dynamic _checkCode;
  dynamic _branch;
  num? _price;
  dynamic _checkDate;
  dynamic _actionDate;
  dynamic _receiptDate;
  bool? _isVisible;
  String? _registerDate;
  dynamic _refId;
  dynamic _resCodebpPayRequest;
  dynamic _resCodebpVerifyRequest;
  dynamic _resCodebpInquiryRequest;
  dynamic _resCodebpSettleRequest;
  dynamic _sendRequestStatus;
  dynamic _verifyRequestStatus;
  dynamic _resultVerifyRequestStatus;
  dynamic _orderId;
  dynamic _saleReferenceId;
  int? _bankNames;
  dynamic _referBankCode;
  dynamic _digitalReceipt;
  dynamic _cardNumber;
  String? _confirmComment;
  dynamic _confirmDate;
  bool? _isConfirm;
  dynamic _accountConfirmId;
  dynamic _accountConfirm;
  num? _id;
  ResultStatusOperation? _resultStatusOperation;
  String? _payableAmountWithoutDiscount;
  String? _buyerName;
  String? _buyerAddress;
  String? _postalCode;
  String? _mobile;
  bool? _isClosed;
  PaymentWay copyWith({  bool? isPayment,
  dynamic giverId,
  dynamic giver,
  dynamic reciverId,
  dynamic reciver,
  num? typeDeposits,
  num? paymentStatus,
  num? saleFactorId,
  SaleFactor? saleFactor,
  dynamic bepichRequestHeaderId,
  dynamic bepichRequestHeader,
  dynamic bankReceiveCityId,
  dynamic bankReceiveCity,
  dynamic serialNumber,
  dynamic checkCode,
  dynamic branch,
  num? price,
  dynamic checkDate,
  dynamic actionDate,
  dynamic receiptDate,
  bool? isVisible,
  String? registerDate,
  dynamic refId,
  dynamic resCodebpPayRequest,
  dynamic resCodebpVerifyRequest,
  dynamic resCodebpInquiryRequest,
  dynamic resCodebpSettleRequest,
  dynamic sendRequestStatus,
  dynamic verifyRequestStatus,
  dynamic resultVerifyRequestStatus,
  dynamic orderId,
  dynamic saleReferenceId,
  int? bankNames,
  dynamic referBankCode,
  dynamic digitalReceipt,
  dynamic cardNumber,
  String? confirmComment,
  dynamic confirmDate,
  bool? isConfirm,
  dynamic accountConfirmId,
  dynamic accountConfirm,
  num? id,
  ResultStatusOperation? resultStatusOperation,
  String? payableAmountWithoutDiscount,
    String? buyerName,
    String? buyerAddress,
    String? postalCode,
    String? mobile,
    bool? isClosed,
}) => PaymentWay(  isPayment: isPayment ?? _isPayment,
  saleFactorId: saleFactorId ?? _saleFactorId,
  saleFactor: saleFactor ?? _saleFactor,
  bepichRequestHeaderId: bepichRequestHeaderId ?? _bepichRequestHeaderId,
  bepichRequestHeader: bepichRequestHeader ?? _bepichRequestHeader,
  bankReceiveCityId: bankReceiveCityId ?? _bankReceiveCityId,
  bankReceiveCity: bankReceiveCity ?? _bankReceiveCity,
  serialNumber: serialNumber ?? _serialNumber,
  checkCode: checkCode ?? _checkCode,
  branch: branch ?? _branch,
  price: price ?? _price,
  checkDate: checkDate ?? _checkDate,
  actionDate: actionDate ?? _actionDate,
  receiptDate: receiptDate ?? _receiptDate,
  registerDate: registerDate ?? _registerDate,

  bankNames: bankNames ?? _bankNames,
  referBankCode: referBankCode ?? _referBankCode,
  digitalReceipt: digitalReceipt ?? _digitalReceipt,
  cardNumber: cardNumber ?? _cardNumber,
  confirmComment: confirmComment ?? _confirmComment,
  confirmDate: confirmDate ?? _confirmDate,
  isConfirm: isConfirm ?? _isConfirm,
  accountConfirmId: accountConfirmId ?? _accountConfirmId,
  accountConfirm: accountConfirm ?? _accountConfirm,
  id: id ?? _id,
  resultStatusOperation: resultStatusOperation ?? _resultStatusOperation,
  payableAmountWithoutDiscount: payableAmountWithoutDiscount ?? _payableAmountWithoutDiscount,
    buyerName: buyerName ?? _buyerName,
    buyerAddress: buyerAddress ?? _buyerAddress,
    postalCode: postalCode ?? _postalCode,
    mobile:  mobile ?? _mobile,
      isClosed: isClosed ?? _isClosed,
);
  bool? get isPayment => _isPayment;
  dynamic get giverId => _giverId;
  dynamic get giver => _giver;
  dynamic get reciverId => _reciverId;
  dynamic get reciver => _reciver;
  num? get typeDeposits => _typeDeposits;
  num? get paymentStatus => _paymentStatus;
  num? get saleFactorId => _saleFactorId;
  SaleFactor? get saleFactor => _saleFactor;
  dynamic get bepichRequestHeaderId => _bepichRequestHeaderId;
  dynamic get bepichRequestHeader => _bepichRequestHeader;
  dynamic get bankReceiveCityId => _bankReceiveCityId;
  dynamic get bankReceiveCity => _bankReceiveCity;
  dynamic get serialNumber => _serialNumber;
  dynamic get checkCode => _checkCode;
  dynamic get branch => _branch;
  num? get price => _price;
  dynamic get checkDate => _checkDate;
  dynamic get actionDate => _actionDate;
  dynamic get receiptDate => _receiptDate;
  bool? get isVisible => _isVisible;
  String? get registerDate => _registerDate;
  dynamic get refId => _refId;
  dynamic get resCodebpPayRequest => _resCodebpPayRequest;
  dynamic get resCodebpVerifyRequest => _resCodebpVerifyRequest;
  dynamic get resCodebpInquiryRequest => _resCodebpInquiryRequest;
  dynamic get resCodebpSettleRequest => _resCodebpSettleRequest;
  dynamic get sendRequestStatus => _sendRequestStatus;
  dynamic get verifyRequestStatus => _verifyRequestStatus;
  dynamic get resultVerifyRequestStatus => _resultVerifyRequestStatus;
  dynamic get orderId => _orderId;
  dynamic get saleReferenceId => _saleReferenceId;
  int? get bankNames => _bankNames;
  dynamic get referBankCode => _referBankCode;
  dynamic get digitalReceipt => _digitalReceipt;
  dynamic get cardNumber => _cardNumber;
  String? get confirmComment => _confirmComment;
  dynamic get confirmDate => _confirmDate;
  bool? get isConfirm => _isConfirm;
  dynamic get accountConfirmId => _accountConfirmId;
  dynamic get accountConfirm => _accountConfirm;
  num? get id => _id;
  ResultStatusOperation? get resultStatusOperation => _resultStatusOperation;
  String? get payableAmountWithoutDiscount => _payableAmountWithoutDiscount;
  String? get buyerName => _buyerName;
  String? get buyerAddress => _buyerAddress;
  String? get postalCode => _postalCode;
  String? get mobile => _mobile;
bool? get isClosed => _isClosed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map["SaleFactor"]['IsPaymentSuccess"'] = _isPayment;
    map['SaleFactorId'];
    if (_saleFactor != null) {
      map['SaleFactor'] = _saleFactor?.toJson();
    }
    map["SaleFactorId"] = _saleFactorId;
    map["SaleFactor"]["SaleDelivery"]['BepichRequestHeaderId'] = _bepichRequestHeaderId;
    map["SaleFactor"]["SaleDelivery"]['BepichRequestHeader'] = _bepichRequestHeader;
    map["SaleFactor"]["SaleDelivery"]['BankReceiveCityId'] = _bankReceiveCityId;
    map["SaleFactor"]["SaleDelivery"]['BankReceiveCity'] = _bankReceiveCity;
    map["SaleFactor"]["SaleDelivery"]['SerialNumber'] = _serialNumber;
    map["SaleFactor"]["SaleDelivery"]['CheckCode'] = _checkCode;
    map["SaleFactor"]["SaleDelivery"]['Branch'] = _branch;
    map["SaleFactor"]["SaleDelivery"]['TotalPrice'] = _price;
    map["SaleFactor"]["SaleDelivery"]['CheckDate'] = _checkDate;
    map["SaleFactor"]["SaleDelivery"]['ActionDate'] = _actionDate;
    map["SaleFactor"]["SaleDelivery"]['ReceiptDate'] = _receiptDate;
    map["SaleFactor"]['RegisterDate'] = _registerDate;
    map["SalePayment"][0]['BankNames'] = _bankNames;
    map["SaleFactor"]["SaleDelivery"]['BankNames'] = _bankNames;
    map["SaleFactor"]["SaleDelivery"]['ReferBankCode'] = _referBankCode;
    map["SaleFactor"]["SaleDelivery"]["DigitalReceipt"] = _digitalReceipt;
    map["SaleFactor"]["SaleDelivery"]['CardNumber']= _cardNumber;
    map["SaleFactor"]["SaleDelivery"]['ConfirmComment']= _confirmComment;
    map["SaleFactor"]["SaleDelivery"]['ConfirmDate'] = _confirmDate;
    map["SaleFactor"]['IsConfirm'] = _isConfirm;
    map["SaleFactor"]["SaleDelivery"]['AccountConfirmId'] = _accountConfirmId;
    map["SaleFactor"]["SaleDelivery"]['AccountConfirm'] = _accountConfirm;
    map["SaleFactor"]["SaleDelivery"]['Id'] = _id;
    map['PayableAmmountWithoutDiscount'] = _payableAmountWithoutDiscount;
    map["SaleFactor"]["SaleDelivery"]['BuyerName'] = _buyerAddress;
    map["SaleFactor"]["SaleDelivery"]['BuyerAddress'] = _buyerAddress;
    map["SaleFactor"]["SaleDelivery"]['PostalCode'] = _postalCode;
    map["SaleFactor"]["SaleDelivery"]['Mobile'] = _mobile;
    map["SaleFactor"]["IsClosed"] = _isClosed;
    if (_resultStatusOperation != null) {
      map["SaleFactor"]["SaleDelivery"]['ResultStatusOperation'] = _resultStatusOperation?.toJson();
    }

    return map;
  }

}

/// Title : null
/// Message : null
/// Type : 0
/// IsSuccessed : false
/// ErrorException : null

ResultStatusOperation resultStatusOperationFromJson(String str) => ResultStatusOperation.fromJson(json.decode(str));
String resultStatusOperationToJson(ResultStatusOperation data) => json.encode(data.toJson());
class ResultStatusOperation {
  ResultStatusOperation({
      dynamic title, 
      dynamic message, 
      num? type, 
      bool? isSuccessed, 
      dynamic errorException,}){
    _title = title;
    _message = message;
    _type = type;
    _isSuccessed = isSuccessed;
    _errorException = errorException;
}

  ResultStatusOperation.fromJson(dynamic json) {
    _title = json['Title'];
    _message = json['Message'];
    _type = json['Type'];
    _isSuccessed = json['IsSuccessed'];
    _errorException = json['ErrorException'];
  }
  dynamic _title;
  dynamic _message;
  num? _type;
  bool? _isSuccessed;
  dynamic _errorException;
ResultStatusOperation copyWith({  dynamic title,
  dynamic message,
  num? type,
  bool? isSuccessed,
  dynamic errorException,
}) => ResultStatusOperation(  title: title ?? _title,
  message: message ?? _message,
  type: type ?? _type,
  isSuccessed: isSuccessed ?? _isSuccessed,
  errorException: errorException ?? _errorException,
);
  dynamic get title => _title;
  dynamic get message => _message;
  num? get type => _type;
  bool? get isSuccessed => _isSuccessed;
  dynamic get errorException => _errorException;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Title'] = _title;
    map['Message'] = _message;
    map['Type'] = _type;
    map['IsSuccessed'] = _isSuccessed;
    map['ErrorException'] = _errorException;
    return map;
  }

}

/// SaleSupplierId : null
/// SaleSupplier : null
/// SaleResellerId : null
/// SaleReseller : null
/// SaleDeliveryId : 1039
/// SaleDelivery : {"UserIdentityId":"b36d1f58-9233-42a4-9a86-0722d72f1feb","UserIdentity":null,"SaleDeliveryCostId":null,"SaleDeliveryCost":null,"SaleFactor":[],"BuyerName":"ففف شبانکار","NationalCode":null,"BuyerAddress":"سنثهت۶خا بشوسعتثعت ستعصت","BuyerEmail":null,"BuyerTel":null,"PostalCode":"1234567891","Mobile":"09179792082  ","RegisterDate":"0001-01-01T00:00:00","Id":1039,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}
/// SaleDiscountId : null
/// SaleDiscount : null
/// SaleFactorCategoryId : null
/// SaleFactorCategory : null
/// CarUserId : null
/// CarUser : null
/// InvoiceSellNo : "2022101209380090"
/// CommentStatus : "این فاکتور در محل پرداخت می شود"
/// SaleVehicleEnterExit : []
/// SalePayment : []
/// SaleFactorStatusHistory : []
/// OrderDate : "2022-10-12T09:38:17.7871626"
/// ModifiedDate : "2022-10-12T09:38:00.9001722"
/// IsConfirm : false
/// IsClosed : true
/// IsDelete : false
/// DeliveryDate : null
/// Discount : null
/// CommentDiscount : null
/// UserIdentityId : "b36d1f58-9233-42a4-9a86-0722d72f1feb"
/// UserIdentity : null
/// SaleCost : []
/// SaleSubFactorId : null
/// SaleSubFactor : null
/// RegisterDate : "2022-10-12T09:38:00.9000759"
/// Id : 4307
/// ResultStatusOperation : {"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}

SaleFactor saleFactorFromJson(String str) => SaleFactor.fromJson(json.decode(str));
String saleFactorToJson(SaleFactor data) => json.encode(data.toJson());
class SaleFactor {
  SaleFactor({
      dynamic saleSupplierId, 
      dynamic saleSupplier, 
      dynamic saleResellerId, 
      dynamic saleReseller, 
      num? saleDeliveryId, 
      SaleDelivery? saleDelivery, 
      dynamic saleDiscountId, 
      dynamic saleDiscount, 
      dynamic saleFactorCategoryId, 
      dynamic saleFactorCategory, 
      dynamic carUserId, 
      dynamic carUser, 
      String? invoiceSellNo, 
      String? commentStatus, 
      List<dynamic>? saleVehicleEnterExit, 
      List<dynamic>? salePayment, 
      List<dynamic>? saleFactorStatusHistory, 
      String? orderDate, 
      String? modifiedDate, 
      bool? isConfirm, 
      bool? isClosed, 
      bool? isDelete, 
      dynamic deliveryDate, 
      dynamic discount, 
      dynamic commentDiscount, 
      String? userIdentityId, 
      dynamic userIdentity, 
      List<dynamic>? saleCost, 
      dynamic saleSubFactorId, 
      dynamic saleSubFactor, 
      String? registerDate, 
      num? id, 
      ResultStatusOperation? resultStatusOperation,}){
    _saleSupplierId = saleSupplierId;
    _saleSupplier = saleSupplier;
    _saleResellerId = saleResellerId;
    _saleReseller = saleReseller;
    _saleDeliveryId = saleDeliveryId;
    _saleDelivery = saleDelivery;
    _saleDiscountId = saleDiscountId;
    _saleDiscount = saleDiscount;
    _saleFactorCategoryId = saleFactorCategoryId;
    _saleFactorCategory = saleFactorCategory;
    _carUserId = carUserId;
    _carUser = carUser;
    _invoiceSellNo = invoiceSellNo;
    _commentStatus = commentStatus;
    _saleVehicleEnterExit = saleVehicleEnterExit;
    _salePayment = salePayment;
    _saleFactorStatusHistory = saleFactorStatusHistory;
    _orderDate = orderDate;
    _modifiedDate = modifiedDate;
    _isConfirm = isConfirm;
    _isClosed = isClosed;
    _isDelete = isDelete;
    _deliveryDate = deliveryDate;
    _discount = discount;
    _commentDiscount = commentDiscount;
    _userIdentityId = userIdentityId;
    _userIdentity = userIdentity;
    _saleCost = saleCost;
    _saleSubFactorId = saleSubFactorId;
    _saleSubFactor = saleSubFactor;
    _registerDate = registerDate;
    _id = id;
    _resultStatusOperation = resultStatusOperation;
}

  SaleFactor.fromJson(dynamic json) {
    _saleSupplierId = json['SaleSupplierId'];
    _saleSupplier = json['SaleSupplier'];
    _saleResellerId = json['SaleResellerId'];
    _saleReseller = json['SaleReseller'];
    _saleDeliveryId = json['SaleDeliveryId'];
    _saleDelivery = json['SaleDelivery'] != null ? SaleDelivery.fromJson(json['SaleDelivery']) : null;
    _saleDiscountId = json['SaleDiscountId'];
    _saleDiscount = json['SaleDiscount'];
    _saleFactorCategoryId = json['SaleFactorCategoryId'];
    _saleFactorCategory = json['SaleFactorCategory'];
    _carUserId = json['CarUserId'];
    _carUser = json['CarUser'];
    _invoiceSellNo = json['InvoiceSellNo'];
    _commentStatus = json['CommentStatus'];
    if (json['SaleVehicleEnterExit'] != null) {
      _saleVehicleEnterExit = [];

    }
    if (json['SalePayment'] != null) {
      _salePayment = [];

    }
    if (json['SaleFactorStatusHistory'] != null) {
      _saleFactorStatusHistory = [];

    }
    _orderDate = json['OrderDate'];
    _modifiedDate = json['ModifiedDate'];
    _isConfirm = json['IsConfirm'];
    _isClosed = json['IsClosed'];
    _isDelete = json['IsDelete'];
    _deliveryDate = json['DeliveryDate'];
    _discount = json['Discount'];
    _commentDiscount = json['CommentDiscount'];
    _userIdentityId = json['UserIdentityId'];
    _userIdentity = json['UserIdentity'];
    if (json['SaleCost'] != null) {
      _saleCost = [];

    }
    _saleSubFactorId = json['SaleSubFactorId'];
    _saleSubFactor = json['SaleSubFactor'];
    _registerDate = json['RegisterDate'];
    _id = json['Id'];
    _resultStatusOperation = json['ResultStatusOperation'] != null ? ResultStatusOperation.fromJson(json['ResultStatusOperation']) : null;
  }
  dynamic _saleSupplierId;
  dynamic _saleSupplier;
  dynamic _saleResellerId;
  dynamic _saleReseller;
  num? _saleDeliveryId;
  SaleDelivery? _saleDelivery;
  dynamic _saleDiscountId;
  dynamic _saleDiscount;
  dynamic _saleFactorCategoryId;
  dynamic _saleFactorCategory;
  dynamic _carUserId;
  dynamic _carUser;
  String? _invoiceSellNo;
  String? _commentStatus;
  List<dynamic>? _saleVehicleEnterExit;
  List<dynamic>? _salePayment;
  List<dynamic>? _saleFactorStatusHistory;
  String? _orderDate;
  String? _modifiedDate;
  bool? _isConfirm;
  bool? _isClosed;
  bool? _isDelete;
  dynamic _deliveryDate;
  dynamic _discount;
  dynamic _commentDiscount;
  String? _userIdentityId;
  dynamic _userIdentity;
  List<dynamic>? _saleCost;
  dynamic _saleSubFactorId;
  dynamic _saleSubFactor;
  String? _registerDate;
  num? _id;
  ResultStatusOperation? _resultStatusOperation;
SaleFactor copyWith({  dynamic saleSupplierId,
  dynamic saleSupplier,
  dynamic saleResellerId,
  dynamic saleReseller,
  num? saleDeliveryId,
  SaleDelivery? saleDelivery,
  dynamic saleDiscountId,
  dynamic saleDiscount,
  dynamic saleFactorCategoryId,
  dynamic saleFactorCategory,
  dynamic carUserId,
  dynamic carUser,
  String? invoiceSellNo,
  String? commentStatus,
  List<dynamic>? saleVehicleEnterExit,
  List<dynamic>? salePayment,
  List<dynamic>? saleFactorStatusHistory,
  String? orderDate,
  String? modifiedDate,
  bool? isConfirm,
  bool? isClosed,
  bool? isDelete,
  dynamic deliveryDate,
  dynamic discount,
  dynamic commentDiscount,
  String? userIdentityId,
  dynamic userIdentity,
  List<dynamic>? saleCost,
  dynamic saleSubFactorId,
  dynamic saleSubFactor,
  String? registerDate,
  num? id,
  ResultStatusOperation? resultStatusOperation,
}) => SaleFactor(  saleSupplierId: saleSupplierId ?? _saleSupplierId,
  saleSupplier: saleSupplier ?? _saleSupplier,
  saleResellerId: saleResellerId ?? _saleResellerId,
  saleReseller: saleReseller ?? _saleReseller,
  saleDeliveryId: saleDeliveryId ?? _saleDeliveryId,
  saleDelivery: saleDelivery ?? _saleDelivery,
  saleDiscountId: saleDiscountId ?? _saleDiscountId,
  saleDiscount: saleDiscount ?? _saleDiscount,
  saleFactorCategoryId: saleFactorCategoryId ?? _saleFactorCategoryId,
  saleFactorCategory: saleFactorCategory ?? _saleFactorCategory,
  carUserId: carUserId ?? _carUserId,
  carUser: carUser ?? _carUser,
  invoiceSellNo: invoiceSellNo ?? _invoiceSellNo,
  commentStatus: commentStatus ?? _commentStatus,
  saleVehicleEnterExit: saleVehicleEnterExit ?? _saleVehicleEnterExit,
  salePayment: salePayment ?? _salePayment,
  saleFactorStatusHistory: saleFactorStatusHistory ?? _saleFactorStatusHistory,
  orderDate: orderDate ?? _orderDate,
  modifiedDate: modifiedDate ?? _modifiedDate,
  isConfirm: isConfirm ?? _isConfirm,
  isClosed: isClosed ?? _isClosed,
  isDelete: isDelete ?? _isDelete,
  deliveryDate: deliveryDate ?? _deliveryDate,
  discount: discount ?? _discount,
  commentDiscount: commentDiscount ?? _commentDiscount,
  userIdentityId: userIdentityId ?? _userIdentityId,
  userIdentity: userIdentity ?? _userIdentity,
  saleCost: saleCost ?? _saleCost,
  saleSubFactorId: saleSubFactorId ?? _saleSubFactorId,
  saleSubFactor: saleSubFactor ?? _saleSubFactor,
  registerDate: registerDate ?? _registerDate,
  id: id ?? _id,
  resultStatusOperation: resultStatusOperation ?? _resultStatusOperation,
);
  dynamic get saleSupplierId => _saleSupplierId;
  dynamic get saleSupplier => _saleSupplier;
  dynamic get saleResellerId => _saleResellerId;
  dynamic get saleReseller => _saleReseller;
  num? get saleDeliveryId => _saleDeliveryId;
  SaleDelivery? get saleDelivery => _saleDelivery;
  dynamic get saleDiscountId => _saleDiscountId;
  dynamic get saleDiscount => _saleDiscount;
  dynamic get saleFactorCategoryId => _saleFactorCategoryId;
  dynamic get saleFactorCategory => _saleFactorCategory;
  dynamic get carUserId => _carUserId;
  dynamic get carUser => _carUser;
  String? get invoiceSellNo => _invoiceSellNo;
  String? get commentStatus => _commentStatus;
  List<dynamic>? get saleVehicleEnterExit => _saleVehicleEnterExit;
  List<dynamic>? get salePayment => _salePayment;
  List<dynamic>? get saleFactorStatusHistory => _saleFactorStatusHistory;
  String? get orderDate => _orderDate;
  String? get modifiedDate => _modifiedDate;
  bool? get isConfirm => _isConfirm;
  bool? get isClosed => _isClosed;
  bool? get isDelete => _isDelete;
  dynamic get deliveryDate => _deliveryDate;
  dynamic get discount => _discount;
  dynamic get commentDiscount => _commentDiscount;
  String? get userIdentityId => _userIdentityId;
  dynamic get userIdentity => _userIdentity;
  List<dynamic>? get saleCost => _saleCost;
  dynamic get saleSubFactorId => _saleSubFactorId;
  dynamic get saleSubFactor => _saleSubFactor;
  String? get registerDate => _registerDate;
  num? get id => _id;
  ResultStatusOperation? get resultStatusOperation => _resultStatusOperation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SaleSupplierId'] = _saleSupplierId;
    map['SaleSupplier'] = _saleSupplier;
    map['SaleResellerId'] = _saleResellerId;
    map['SaleReseller'] = _saleReseller;
    map['SaleDeliveryId'] = _saleDeliveryId;
    if (_saleDelivery != null) {
      map['SaleDelivery'] = _saleDelivery?.toJson();
    }
    map['SaleDiscountId'] = _saleDiscountId;
    map['SaleDiscount'] = _saleDiscount;
    map['SaleFactorCategoryId'] = _saleFactorCategoryId;
    map['SaleFactorCategory'] = _saleFactorCategory;
    map['CarUserId'] = _carUserId;
    map['CarUser'] = _carUser;
    map['InvoiceSellNo'] = _invoiceSellNo;
    map['CommentStatus'] = _commentStatus;
    if (_saleVehicleEnterExit != null) {
      map['SaleVehicleEnterExit'] = _saleVehicleEnterExit?.map((v) => v.toJson()).toList();
    }
    if (_salePayment != null) {
      map['SalePayment'] = _salePayment?.map((v) => v.toJson()).toList();
    }
    if (_saleFactorStatusHistory != null) {
      map['SaleFactorStatusHistory'] = _saleFactorStatusHistory?.map((v) => v.toJson()).toList();
    }
    map['OrderDate'] = _orderDate;
    map['ModifiedDate'] = _modifiedDate;
    map['IsConfirm'] = _isConfirm;
    map['IsClosed'] = _isClosed;
    map['IsDelete'] = _isDelete;
    map['DeliveryDate'] = _deliveryDate;
    map['Discount'] = _discount;
    map['CommentDiscount'] = _commentDiscount;
    map['UserIdentityId'] = _userIdentityId;
    map['UserIdentity'] = _userIdentity;
    if (_saleCost != null) {
      map['SaleCost'] = _saleCost?.map((v) => v.toJson()).toList();
    }
    map['SaleSubFactorId'] = _saleSubFactorId;
    map['SaleSubFactor'] = _saleSubFactor;
    map['RegisterDate'] = _registerDate;
    map['Id'] = _id;
    if (_resultStatusOperation != null) {
      map['ResultStatusOperation'] = _resultStatusOperation?.toJson();
    }
    return map;
  }

}

/// Title : null
/// Message : null
/// Type : 0
/// IsSuccessed : false
/// ErrorException : null

/// UserIdentityId : "b36d1f58-9233-42a4-9a86-0722d72f1feb"
/// UserIdentity : null
/// SaleDeliveryCostId : null
/// SaleDeliveryCost : null
/// SaleFactor : []
/// BuyerName : "ففف شبانکار"
/// NationalCode : null
/// BuyerAddress : "سنثهت۶خا بشوسعتثعت ستعصت"
/// BuyerEmail : null
/// BuyerTel : null
/// PostalCode : "1234567891"
/// Mobile : "09179792082  "
/// RegisterDate : "0001-01-01T00:00:00"
/// Id : 1039
/// ResultStatusOperation : {"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}

SaleDelivery saleDeliveryFromJson(String str) => SaleDelivery.fromJson(json.decode(str));
String saleDeliveryToJson(SaleDelivery data) => json.encode(data.toJson());
class SaleDelivery {
  SaleDelivery({
      String? userIdentityId, 
      dynamic userIdentity, 
      dynamic saleDeliveryCostId, 
      dynamic saleDeliveryCost, 
      List<dynamic>? saleFactor, 
      String? buyerName, 
      dynamic nationalCode, 
      String? buyerAddress, 
      dynamic buyerEmail, 
      dynamic buyerTel, 
      String? postalCode, 
      String? mobile, 
      String? registerDate, 
      num? id, 
      ResultStatusOperation? resultStatusOperation,}){
    _userIdentityId = userIdentityId;
    _userIdentity = userIdentity;
    _saleDeliveryCostId = saleDeliveryCostId;
    _saleDeliveryCost = saleDeliveryCost;
    _saleFactor = saleFactor;
    _buyerName = buyerName;
    _nationalCode = nationalCode;
    _buyerAddress = buyerAddress;
    _buyerEmail = buyerEmail;
    _buyerTel = buyerTel;
    _postalCode = postalCode;
    _mobile = mobile;
    _registerDate = registerDate;
    _id = id;
    _resultStatusOperation = resultStatusOperation;
}

  SaleDelivery.fromJson(dynamic json) {
    _userIdentityId = json['UserIdentityId'];
    _userIdentity = json['UserIdentity'];
    _saleDeliveryCostId = json['SaleDeliveryCostId'];
    _saleDeliveryCost = json['SaleDeliveryCost'];
    if (json['SaleFactor'] != null) {
      _saleFactor = [];

    }
    _buyerName = json['BuyerName'];
    _nationalCode = json['NationalCode'];
    _buyerAddress = json['BuyerAddress'];
    _buyerEmail = json['BuyerEmail'];
    _buyerTel = json['BuyerTel'];
    _postalCode = json['PostalCode'];
    _mobile = json['Mobile'];
    _registerDate = json['RegisterDate'];
    _id = json['Id'];
    _resultStatusOperation = json['ResultStatusOperation'] != null ? ResultStatusOperation.fromJson(json['ResultStatusOperation']) : null;
  }
  String? _userIdentityId;
  dynamic _userIdentity;
  dynamic _saleDeliveryCostId;
  dynamic _saleDeliveryCost;
  List<dynamic>? _saleFactor;
  String? _buyerName;
  dynamic _nationalCode;
  String? _buyerAddress;
  dynamic _buyerEmail;
  dynamic _buyerTel;
  String? _postalCode;
  String? _mobile;
  String? _registerDate;
  num? _id;
  ResultStatusOperation? _resultStatusOperation;
SaleDelivery copyWith({  String? userIdentityId,
  dynamic userIdentity,
  dynamic saleDeliveryCostId,
  dynamic saleDeliveryCost,
  List<dynamic>? saleFactor,
  String? buyerName,
  dynamic nationalCode,
  String? buyerAddress,
  dynamic buyerEmail,
  dynamic buyerTel,
  String? postalCode,
  String? mobile,
  String? registerDate,
  num? id,
  ResultStatusOperation? resultStatusOperation,
}) => SaleDelivery(  userIdentityId: userIdentityId ?? _userIdentityId,
  userIdentity: userIdentity ?? _userIdentity,
  saleDeliveryCostId: saleDeliveryCostId ?? _saleDeliveryCostId,
  saleDeliveryCost: saleDeliveryCost ?? _saleDeliveryCost,
  saleFactor: saleFactor ?? _saleFactor,
  buyerName: buyerName ?? _buyerName,
  nationalCode: nationalCode ?? _nationalCode,
  buyerAddress: buyerAddress ?? _buyerAddress,
  buyerEmail: buyerEmail ?? _buyerEmail,
  buyerTel: buyerTel ?? _buyerTel,
  postalCode: postalCode ?? _postalCode,
  mobile: mobile ?? _mobile,
  registerDate: registerDate ?? _registerDate,
  id: id ?? _id,
  resultStatusOperation: resultStatusOperation ?? _resultStatusOperation,
);
  String? get userIdentityId => _userIdentityId;
  dynamic get userIdentity => _userIdentity;
  dynamic get saleDeliveryCostId => _saleDeliveryCostId;
  dynamic get saleDeliveryCost => _saleDeliveryCost;
  List<dynamic>? get saleFactor => _saleFactor;
  String? get buyerName => _buyerName;
  dynamic get nationalCode => _nationalCode;
  String? get buyerAddress => _buyerAddress;
  dynamic get buyerEmail => _buyerEmail;
  dynamic get buyerTel => _buyerTel;
  String? get postalCode => _postalCode;
  String? get mobile => _mobile;
  String? get registerDate => _registerDate;
  num? get id => _id;
  ResultStatusOperation? get resultStatusOperation => _resultStatusOperation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserIdentityId'] = _userIdentityId;
    map['UserIdentity'] = _userIdentity;
    map['SaleDeliveryCostId'] = _saleDeliveryCostId;
    map['SaleDeliveryCost'] = _saleDeliveryCost;
    if (_saleFactor != null) {
      map['SaleFactor'] = _saleFactor?.map((v) => v.toJson()).toList();
    }
    map['BuyerName'] = _buyerName;
    map['NationalCode'] = _nationalCode;
    map['BuyerAddress'] = _buyerAddress;
    map['BuyerEmail'] = _buyerEmail;
    map['BuyerTel'] = _buyerTel;
    map['PostalCode'] = _postalCode;
    map['Mobile'] = _mobile;
    map['RegisterDate'] = _registerDate;
    map['Id'] = _id;
    if (_resultStatusOperation != null) {
      map['ResultStatusOperation'] = _resultStatusOperation?.toJson();
    }
    return map;
  }

}
