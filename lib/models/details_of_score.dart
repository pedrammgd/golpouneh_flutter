import 'dart:convert';
/// HttpStatusCode : "200"
/// Result : {"listCustomerClubUserPoint":[{"UserIdentityId":"219657e3-be6e-4d2a-bea1-35732daef3d4","UserIdentity":null,"UserOwnerPointId":"219657e3-be6e-4d2a-bea1-35732daef3d4","UserOwnerPoint":null,"CustomerClubTypeOfPointId":1,"CustomerClubTypeOfPoint":{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":null,"Title":"نصب اپلیکیشن","Point":10,"PointField":1,"FromDay":0,"ToDay":0,"FromPrice":0,"ToPrice":0,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-05-25T12:25:02.931402","Desciption":"امتیازی که کاربر برای نصب اولین  اپلیکیشن دریافت میکند","Id":1,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"Point":10,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-08-25T10:53:20.962052","Id":1,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"01659e12-817c-4fe5-95dc-36126a123837","UserIdentity":null,"UserOwnerPointId":"219657e3-be6e-4d2a-bea1-35732daef3d4","UserOwnerPoint":null,"CustomerClubTypeOfPointId":8,"CustomerClubTypeOfPoint":{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":null,"Title":"معرفی اپلیکیشن به دیگران","Point":5,"PointField":3,"FromDay":0,"ToDay":0,"FromPrice":0,"ToPrice":0,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-05-25T13:08:15","Desciption":"معرفی اپلیکیشن به دیگران این امتیاز برای کاربری که معرّف بوده است ثبت می گردد","Id":8,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"Point":5,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-08-25T10:53:56.1227181","Id":2,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}]}

DetailsOfScore detailsOfScoreFromJson(String str) => DetailsOfScore.fromJson(json.decode(str));
String detailsOfScoreToJson(DetailsOfScore data) => json.encode(data.toJson());
class DetailsOfScore {
  DetailsOfScore({
      String? httpStatusCode, 
      Result? result,}){
    _httpStatusCode = httpStatusCode;
    _result = result;
}

  DetailsOfScore.fromJson(dynamic json) {
    _httpStatusCode = json['HttpStatusCode'];
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  String? _httpStatusCode;
  Result? _result;
DetailsOfScore copyWith({  String? httpStatusCode,
  Result? result,
}) => DetailsOfScore(  httpStatusCode: httpStatusCode ?? _httpStatusCode,
  result: result ?? _result,
);
  String? get httpStatusCode => _httpStatusCode;
  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['HttpStatusCode'] = _httpStatusCode;
    if (_result != null) {
      map['Result'] = _result?.toJson();
    }
    return map;
  }

}

/// listCustomerClubUserPoint : [{"UserIdentityId":"219657e3-be6e-4d2a-bea1-35732daef3d4","UserIdentity":null,"UserOwnerPointId":"219657e3-be6e-4d2a-bea1-35732daef3d4","UserOwnerPoint":null,"CustomerClubTypeOfPointId":1,"CustomerClubTypeOfPoint":{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":null,"Title":"نصب اپلیکیشن","Point":10,"PointField":1,"FromDay":0,"ToDay":0,"FromPrice":0,"ToPrice":0,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-05-25T12:25:02.931402","Desciption":"امتیازی که کاربر برای نصب اولین بار اپلیکیشن دریافت میکند","Id":1,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"Point":10,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-08-25T10:53:20.962052","Id":1,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"01659e12-817c-4fe5-95dc-36126a123837","UserIdentity":null,"UserOwnerPointId":"219657e3-be6e-4d2a-bea1-35732daef3d4","UserOwnerPoint":null,"CustomerClubTypeOfPointId":8,"CustomerClubTypeOfPoint":{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":null,"Title":"معرفی اپلیکیشن به دیگران","Point":5,"PointField":3,"FromDay":0,"ToDay":0,"FromPrice":0,"ToPrice":0,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-05-25T13:08:15","Desciption":"معرفی اپلیکیشن به دیگران این امتیاز برای کاربری که معرّف بوده است ثبت می گردد","Id":8,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"Point":5,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-08-25T10:53:56.1227181","Id":2,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}]

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      List<ListCustomerClubUserPoint>? listCustomerClubUserPoint,}){
    _listCustomerClubUserPoint = listCustomerClubUserPoint;
}

  Result.fromJson(dynamic json) {
    if (json['listCustomerClubUserPoint'] != null) {
      _listCustomerClubUserPoint = [];
      json['listCustomerClubUserPoint'].forEach((v) {
        _listCustomerClubUserPoint?.add(ListCustomerClubUserPoint.fromJson(v));
      });
    }
  }
  List<ListCustomerClubUserPoint>? _listCustomerClubUserPoint;
Result copyWith({  List<ListCustomerClubUserPoint>? listCustomerClubUserPoint,
}) => Result(  listCustomerClubUserPoint: listCustomerClubUserPoint ?? _listCustomerClubUserPoint,
);
  List<ListCustomerClubUserPoint>? get listCustomerClubUserPoint => _listCustomerClubUserPoint;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_listCustomerClubUserPoint != null) {
      map['listCustomerClubUserPoint'] = _listCustomerClubUserPoint?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UserIdentityId : "219657e3-be6e-4d2a-bea1-35732daef3d4"
/// UserIdentity : null
/// UserOwnerPointId : "219657e3-be6e-4d2a-bea1-35732daef3d4"
/// UserOwnerPoint : null
/// CustomerClubTypeOfPointId : 1
/// CustomerClubTypeOfPoint : {"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":null,"Title":"نصب اپلیکیشن","Point":10,"PointField":1,"FromDay":0,"ToDay":0,"FromPrice":0,"ToPrice":0,"IsVisible":true,"IsDelete":false,"RegisterDate":"2022-05-25T12:25:02.931402","Desciption":"امتیازی که کاربر برای نصب اولین بار اپلیکیشن دریافت میکند","Id":1,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}
/// Point : 10
/// IsVisible : true
/// IsDelete : false
/// RegisterDate : "2022-08-25T10:53:20.962052"
/// Id : 1
/// ResultStatusOperation : {"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}

ListCustomerClubUserPoint listCustomerClubUserPointFromJson(String str) => ListCustomerClubUserPoint.fromJson(json.decode(str));
String listCustomerClubUserPointToJson(ListCustomerClubUserPoint data) => json.encode(data.toJson());
class ListCustomerClubUserPoint {
  ListCustomerClubUserPoint({
      String? userIdentityId, 
      dynamic userIdentity, 
      String? userOwnerPointId, 
      dynamic userOwnerPoint, 
      num? customerClubTypeOfPointId, 
      CustomerClubTypeOfPoint? customerClubTypeOfPoint, 
      num? point, 
      bool? isVisible, 
      bool? isDelete, 
      String? registerDate, 
      num? id, 
      ResultStatusOperation? resultStatusOperation,}){
    _userIdentityId = userIdentityId;
    _userIdentity = userIdentity;
    _userOwnerPointId = userOwnerPointId;
    _userOwnerPoint = userOwnerPoint;
    _customerClubTypeOfPointId = customerClubTypeOfPointId;
    _customerClubTypeOfPoint = customerClubTypeOfPoint;
    _point = point;
    _isVisible = isVisible;
    _isDelete = isDelete;
    _registerDate = registerDate;
    _id = id;
    _resultStatusOperation = resultStatusOperation;
}

  ListCustomerClubUserPoint.fromJson(dynamic json) {
    _userIdentityId = json['UserIdentityId'];
    _userIdentity = json['UserIdentity'];
    _userOwnerPointId = json['UserOwnerPointId'];
    _userOwnerPoint = json['UserOwnerPoint'];
    _customerClubTypeOfPointId = json['CustomerClubTypeOfPointId'];
    _customerClubTypeOfPoint = json['CustomerClubTypeOfPoint'] != null ? CustomerClubTypeOfPoint.fromJson(json['CustomerClubTypeOfPoint']) : null;
    _point = json['Point'];
    _isVisible = json['IsVisible'];
    _isDelete = json['IsDelete'];
    _registerDate = json['RegisterDate'];
    _id = json['Id'];
    _resultStatusOperation = json['ResultStatusOperation'] != null ? ResultStatusOperation.fromJson(json['ResultStatusOperation']) : null;
  }
  String? _userIdentityId;
  dynamic _userIdentity;
  String? _userOwnerPointId;
  dynamic _userOwnerPoint;
  num? _customerClubTypeOfPointId;
  CustomerClubTypeOfPoint? _customerClubTypeOfPoint;
  num? _point;
  bool? _isVisible;
  bool? _isDelete;
  String? _registerDate;
  num? _id;
  ResultStatusOperation? _resultStatusOperation;
ListCustomerClubUserPoint copyWith({  String? userIdentityId,
  dynamic userIdentity,
  String? userOwnerPointId,
  dynamic userOwnerPoint,
  num? customerClubTypeOfPointId,
  CustomerClubTypeOfPoint? customerClubTypeOfPoint,
  num? point,
  bool? isVisible,
  bool? isDelete,
  String? registerDate,
  num? id,
  ResultStatusOperation? resultStatusOperation,
}) => ListCustomerClubUserPoint(  userIdentityId: userIdentityId ?? _userIdentityId,
  userIdentity: userIdentity ?? _userIdentity,
  userOwnerPointId: userOwnerPointId ?? _userOwnerPointId,
  userOwnerPoint: userOwnerPoint ?? _userOwnerPoint,
  customerClubTypeOfPointId: customerClubTypeOfPointId ?? _customerClubTypeOfPointId,
  customerClubTypeOfPoint: customerClubTypeOfPoint ?? _customerClubTypeOfPoint,
  point: point ?? _point,
  isVisible: isVisible ?? _isVisible,
  isDelete: isDelete ?? _isDelete,
  registerDate: registerDate ?? _registerDate,
  id: id ?? _id,
  resultStatusOperation: resultStatusOperation ?? _resultStatusOperation,
);
  String? get userIdentityId => _userIdentityId;
  dynamic get userIdentity => _userIdentity;
  String? get userOwnerPointId => _userOwnerPointId;
  dynamic get userOwnerPoint => _userOwnerPoint;
  num? get customerClubTypeOfPointId => _customerClubTypeOfPointId;
  CustomerClubTypeOfPoint? get customerClubTypeOfPoint => _customerClubTypeOfPoint;
  num? get point => _point;
  bool? get isVisible => _isVisible;
  bool? get isDelete => _isDelete;
  String? get registerDate => _registerDate;
  num? get id => _id;
  ResultStatusOperation? get resultStatusOperation => _resultStatusOperation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserIdentityId'] = _userIdentityId;
    map['UserIdentity'] = _userIdentity;
    map['UserOwnerPointId'] = _userOwnerPointId;
    map['UserOwnerPoint'] = _userOwnerPoint;
    map['CustomerClubTypeOfPointId'] = _customerClubTypeOfPointId;
    if (_customerClubTypeOfPoint != null) {
      map['CustomerClubTypeOfPoint'] = _customerClubTypeOfPoint?.toJson();
    }
    map['Point'] = _point;
    map['IsVisible'] = _isVisible;
    map['IsDelete'] = _isDelete;
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

/// UserIdentityId : "cda898c4-fcf8-42c4-9693-a534b36ac478"
/// UserIdentity : null
/// Title : "نصب اپلیکیشن"
/// Point : 10
/// PointField : 1
/// FromDay : 0
/// ToDay : 0
/// FromPrice : 0
/// ToPrice : 0
/// IsVisible : true
/// IsDelete : false
/// RegisterDate : "2022-05-25T12:25:02.931402"
/// Desciption : "امتیازی که کاربر برای نصب اولین بار اپلیکیشن دریافت میکند"
/// Id : 1
/// ResultStatusOperation : {"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}

CustomerClubTypeOfPoint customerClubTypeOfPointFromJson(String str) => CustomerClubTypeOfPoint.fromJson(json.decode(str));
String customerClubTypeOfPointToJson(CustomerClubTypeOfPoint data) => json.encode(data.toJson());
class CustomerClubTypeOfPoint {
  CustomerClubTypeOfPoint({
      String? userIdentityId, 
      dynamic userIdentity, 
      String? title, 
      num? point, 
      num? pointField, 
      num? fromDay, 
      num? toDay, 
      num? fromPrice, 
      num? toPrice, 
      bool? isVisible, 
      bool? isDelete, 
      String? registerDate, 
      String? desciption, 
      num? id, 
      ResultStatusOperation? resultStatusOperation,}){
    _userIdentityId = userIdentityId;
    _userIdentity = userIdentity;
    _title = title;
    _point = point;
    _pointField = pointField;
    _fromDay = fromDay;
    _toDay = toDay;
    _fromPrice = fromPrice;
    _toPrice = toPrice;
    _isVisible = isVisible;
    _isDelete = isDelete;
    _registerDate = registerDate;
    _desciption = desciption;
    _id = id;
    _resultStatusOperation = resultStatusOperation;
}

  CustomerClubTypeOfPoint.fromJson(dynamic json) {
    _userIdentityId = json['UserIdentityId'];
    _userIdentity = json['UserIdentity'];
    _title = json['Title'];
    _point = json['Point'];
    _pointField = json['PointField'];
    _fromDay = json['FromDay'];
    _toDay = json['ToDay'];
    _fromPrice = json['FromPrice'];
    _toPrice = json['ToPrice'];
    _isVisible = json['IsVisible'];
    _isDelete = json['IsDelete'];
    _registerDate = json['RegisterDate'];
    _desciption = json['Desciption'];
    _id = json['Id'];
    _resultStatusOperation = json['ResultStatusOperation'] != null ? ResultStatusOperation.fromJson(json['ResultStatusOperation']) : null;
  }
  String? _userIdentityId;
  dynamic _userIdentity;
  String? _title;
  num? _point;
  num? _pointField;
  num? _fromDay;
  num? _toDay;
  num? _fromPrice;
  num? _toPrice;
  bool? _isVisible;
  bool? _isDelete;
  String? _registerDate;
  String? _desciption;
  num? _id;
  ResultStatusOperation? _resultStatusOperation;
CustomerClubTypeOfPoint copyWith({  String? userIdentityId,
  dynamic userIdentity,
  String? title,
  num? point,
  num? pointField,
  num? fromDay,
  num? toDay,
  num? fromPrice,
  num? toPrice,
  bool? isVisible,
  bool? isDelete,
  String? registerDate,
  String? desciption,
  num? id,
  ResultStatusOperation? resultStatusOperation,
}) => CustomerClubTypeOfPoint(  userIdentityId: userIdentityId ?? _userIdentityId,
  userIdentity: userIdentity ?? _userIdentity,
  title: title ?? _title,
  point: point ?? _point,
  pointField: pointField ?? _pointField,
  fromDay: fromDay ?? _fromDay,
  toDay: toDay ?? _toDay,
  fromPrice: fromPrice ?? _fromPrice,
  toPrice: toPrice ?? _toPrice,
  isVisible: isVisible ?? _isVisible,
  isDelete: isDelete ?? _isDelete,
  registerDate: registerDate ?? _registerDate,
  desciption: desciption ?? _desciption,
  id: id ?? _id,
  resultStatusOperation: resultStatusOperation ?? _resultStatusOperation,
);
  String? get userIdentityId => _userIdentityId;
  dynamic get userIdentity => _userIdentity;
  String? get title => _title;
  num? get point => _point;
  num? get pointField => _pointField;
  num? get fromDay => _fromDay;
  num? get toDay => _toDay;
  num? get fromPrice => _fromPrice;
  num? get toPrice => _toPrice;
  bool? get isVisible => _isVisible;
  bool? get isDelete => _isDelete;
  String? get registerDate => _registerDate;
  String? get desciption => _desciption;
  num? get id => _id;
  ResultStatusOperation? get resultStatusOperation => _resultStatusOperation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserIdentityId'] = _userIdentityId;
    map['UserIdentity'] = _userIdentity;
    map['Title'] = _title;
    map['Point'] = _point;
    map['PointField'] = _pointField;
    map['FromDay'] = _fromDay;
    map['ToDay'] = _toDay;
    map['FromPrice'] = _fromPrice;
    map['ToPrice'] = _toPrice;
    map['IsVisible'] = _isVisible;
    map['IsDelete'] = _isDelete;
    map['RegisterDate'] = _registerDate;
    map['Desciption'] = _desciption;
    map['Id'] = _id;
    if (_resultStatusOperation != null) {
      map['ResultStatusOperation'] = _resultStatusOperation?.toJson();
    }
    return map;
  }
}