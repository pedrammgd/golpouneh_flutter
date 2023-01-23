/// BuyerName : "حسین بهزادی"
/// NationalCode : "0123456789"
/// BuyerAddress : "فارس/شیراز/ چهارراه بفشه به سمت خلدبرین/کوچه7/پلاک57"
/// BuyerEmail : "behzadi.hosein@yahoo.com"
/// PostalCode : "7136956191"
/// Mobile : "09397893772  "
/// RegisterDate : "2021-10-02T18:24:00.2320265"
/// Id : 2

class AddressModel {
  AddressModel({
    String? buyerName,
    String? nationalCode,
    String? buyerAddress,
    String? buyerEmail,
    String? postalCode,
    String? mobile,
    String? registerDate,
    int? id,
    String? latitude,
    String? longitude,
  }) {
    _buyerName = buyerName;
    _nationalCode = nationalCode;
    _buyerAddress = buyerAddress;
    _buyerEmail = buyerEmail;
    _postalCode = postalCode;
    _mobile = mobile;
    _registerDate = registerDate;
    _id = id;
    _latitude = latitude;
    _longitude = longitude;
  }

  AddressModel.fromJson(dynamic json) {
    _buyerName = json['BuyerName'];
    _nationalCode = json['NationalCode'];
    _buyerAddress = json['BuyerAddress'];
    _buyerEmail = json['BuyerEmail'];
    _postalCode = json['PostalCode'];
    _mobile = json['Mobile'];
    _registerDate = json['RegisterDate'];
    _id = json['Id'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
  }
  String? _buyerName;
  String? _nationalCode;
  String? _buyerAddress;
  String? _buyerEmail;
  String? _postalCode;
  String? _mobile;
  String? _registerDate;
  String? _latitude;
  String? _longitude;
  int? _id;

  String? get buyerName => _buyerName;
  String? get nationalCode => _nationalCode;
  String? get buyerAddress => _buyerAddress;
  String? get buyerEmail => _buyerEmail;
  String? get postalCode => _postalCode;
  String? get mobile => _mobile;
  String? get registerDate => _registerDate;
  int? get id => _id;
  String? get latitude => _latitude;
  String? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BuyerName'] = _buyerName;
    map['NationalCode'] = _nationalCode;
    map['BuyerAddress'] = _buyerAddress;
    map['BuyerEmail'] = _buyerEmail;
    map['PostalCode'] = _postalCode;
    map['Mobile'] = _mobile;
    map['RegisterDate'] = _registerDate;
    map['Id'] = _id;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    return map;
  }
}
