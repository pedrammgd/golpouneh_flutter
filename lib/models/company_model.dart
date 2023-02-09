import 'dart:convert';

/// UserIdentityId : "d82e557a-e067-4523-aa68-a842a142be95"
/// UserIdentity : {"Id":"d82e557a-e067-4523-aa68-a842a142be95","ForgetPasswordId":null,"UserName":"09177145956","PhoneNumber":"09177145956","UserIdentityTitle":null,"FirstName":"علیرضا ","LastName":"مرحمتی","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2022-02-26T12:39:44.2316955","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09177145956@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9402","ForgetPasswordCodeGenerateDate":"2022-02-26T12:39:48.1894686","UserFiles":[],"NormalizedUserName":"09177145956","NormalizedEmail":"09177145956@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEMzolYQzVzt4xR0SKhaArtlyzfxPWNDC97y9EsO09D2vuEFGKKBcLnyH719YLq1kHA==","SecurityStamp":"56CAFQ6AQWJUALOZOSJBW2UUVJYSIFT6","ConcurrencyStamp":"effdcf01-bac5-4bc5-ba46-bb950e5516a6","PhoneNumberConfirmed":false,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0}
/// ApplicationUserId : null
/// ParentId : null
/// Parent : null
/// CityId : 5
/// City : {"StateId":17,"State":null,"Title":"کازرون","Id":5,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}
/// SupplierCode : null
/// EconomicCode : "۱۱۱۱۱۱۱۱"
/// NationalCode : null
/// CompanyName : "ندارم"
/// Brand : null
/// TypeCopmany : 0
/// PhoneNumber : "09177145956"
/// FaxNumber : null
/// Address : "کازرون "
/// Website : null
/// RegistrationNumber : "۱۱۱۱۱۱۱۱۱۱"
/// PostalCode : "۱۱۱۱۱۱۱۱۱۱"
/// PhoneNumbers : null
/// PersonnelCount : 0
/// Emails : null
/// CRMCompanyStatus : 0
/// Salary : 0
/// Description : null
/// Telegram : null
/// WhatsApp : null
/// Instagram : null
/// Rate : null
/// Attractive : 0
/// IsBlack : false
/// RegisterDate : "2022-02-26T12:50:52.5883378"
/// IsAccept : false
/// IsVisible : true
/// IsDelete : false
/// Id : 30
/// ResultStatusOperation : {"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}

CompanyModel companyModelFromJson(String str) =>
    CompanyModel.fromJson(json.decode(str));
String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel {
  CompanyModel({
    String? userIdentityId,
    UserIdentity? userIdentity,
    dynamic applicationUserId,
    dynamic parentId,
    dynamic parent,
    num? cityId,
    City? city,
    dynamic supplierCode,
    String? economicCode,
    dynamic nationalCode,
    String? companyName,
    dynamic brand,
    num? typeCopmany,
    String? phoneNumber,
    dynamic faxNumber,
    String? address,
    dynamic website,
    String? registrationNumber,
    String? postalCode,
    dynamic phoneNumbers,
    num? personnelCount,
    dynamic emails,
    num? cRMCompanyStatus,
    num? salary,
    dynamic description,
    dynamic telegram,
    dynamic whatsApp,
    dynamic instagram,
    dynamic rate,
    num? attractive,
    bool? isBlack,
    String? registerDate,
    bool? isAccept,
    bool? isVisible,
    bool? isDelete,
    num? id,
    ResultStatusOperation? resultStatusOperation,
    String? geoLocation,
    dynamic Latitude,
    dynamic Longitude,
    int? sortId,
  }) {
    _userIdentityId = userIdentityId;
    _userIdentity = userIdentity;
    _applicationUserId = applicationUserId;
    _parentId = parentId;
    _parent = parent;
    _cityId = cityId;
    _city = city;
    _supplierCode = supplierCode;
    _economicCode = economicCode;
    _nationalCode = nationalCode;
    _companyName = companyName;
    _brand = brand;
    _typeCopmany = typeCopmany;
    _phoneNumber = phoneNumber;
    _faxNumber = faxNumber;
    _address = address;
    _website = website;
    _registrationNumber = registrationNumber;
    _postalCode = postalCode;
    _phoneNumbers = phoneNumbers;
    _personnelCount = personnelCount;
    _emails = emails;
    _cRMCompanyStatus = cRMCompanyStatus;
    _salary = salary;
    _description = description;
    _telegram = telegram;
    _whatsApp = whatsApp;
    _instagram = instagram;
    _rate = rate;
    _attractive = attractive;
    _isBlack = isBlack;
    _registerDate = registerDate;
    _isAccept = isAccept;
    _isVisible = isVisible;
    _isDelete = isDelete;
    _id = id;
    _resultStatusOperation = resultStatusOperation;
    _geoLocation = geoLocation;
    _Latitude = Latitude;
    _Longitude = Longitude;
    _sortId = sortId;
  }

  CompanyModel.fromJson(dynamic json) {
    _userIdentityId = json['UserIdentityId'];
    _userIdentity = json['UserIdentity'] != null
        ? UserIdentity.fromJson(json['UserIdentity'])
        : null;
    _applicationUserId = json['ApplicationUserId'];
    _parentId = json['ParentId'];
    _parent = json['Parent'];
    _cityId = json['CityId'];
    _city = json['City'] != null ? City.fromJson(json['City']) : null;
    _supplierCode = json['SupplierCode'];
    _economicCode = json['EconomicCode'];
    _nationalCode = json['NationalCode'];
    _companyName = json['CompanyName'];
    _brand = json['Brand'];
    _typeCopmany = json['TypeCopmany'];
    _phoneNumber = json['PhoneNumber'];
    _faxNumber = json['FaxNumber'];
    _address = json['Address'];
    _website = json['Website'];
    _registrationNumber = json['RegistrationNumber'];
    _postalCode = json['PostalCode'];
    _phoneNumbers = json['PhoneNumbers'];
    _personnelCount = json['PersonnelCount'];
    _emails = json['Emails'];
    _cRMCompanyStatus = json['CRMCompanyStatus'];
    _salary = json['Salary'];
    _description = json['Description'];
    _telegram = json['Telegram'];
    _whatsApp = json['WhatsApp'];
    _instagram = json['Instagram'];
    _rate = json['Rate'];
    _attractive = json['Attractive'];
    _isBlack = json['IsBlack'];
    _registerDate = json['RegisterDate'];
    _isAccept = json['IsAccept'];
    _isVisible = json['IsVisible'];
    _isDelete = json['IsDelete'];
    _id = json['Id'];
    _Latitude = json['Latitude'];
    _Longitude = json['Longitude'];
    _sortId = json['SortId'];
    _resultStatusOperation = json['ResultStatusOperation'] != null
        ? ResultStatusOperation.fromJson(json['ResultStatusOperation'])
        : null;
  }
  String? _userIdentityId;
  UserIdentity? _userIdentity;
  dynamic _applicationUserId;
  dynamic _parentId;
  dynamic _parent;
  num? _cityId;
  City? _city;
  dynamic _supplierCode;
  String? _economicCode;
  dynamic _nationalCode;
  String? _companyName;
  dynamic _brand;
  num? _typeCopmany;
  String? _phoneNumber;
  dynamic _faxNumber;
  String? _address;
  dynamic _website;
  String? _registrationNumber;
  String? _postalCode;
  dynamic _phoneNumbers;
  num? _personnelCount;
  dynamic _emails;
  num? _cRMCompanyStatus;
  num? _salary;
  dynamic _description;
  dynamic _telegram;
  dynamic _whatsApp;
  dynamic _instagram;
  dynamic _rate;
  num? _attractive;
  bool? _isBlack;
  String? _registerDate;
  bool? _isAccept;
  bool? _isVisible;
  bool? _isDelete;
  num? _id;
  ResultStatusOperation? _resultStatusOperation;
  String? _geoLocation;
  dynamic _Latitude;
  dynamic _Longitude;
  int? _sortId;

  CompanyModel copyWith({
    String? userIdentityId,
    UserIdentity? userIdentity,
    dynamic applicationUserId,
    dynamic parentId,
    dynamic parent,
    num? cityId,
    City? city,
    dynamic supplierCode,
    String? economicCode,
    dynamic nationalCode,
    String? companyName,
    dynamic brand,
    num? typeCopmany,
    String? phoneNumber,
    dynamic faxNumber,
    String? address,
    dynamic website,
    String? registrationNumber,
    String? postalCode,
    dynamic phoneNumbers,
    num? personnelCount,
    dynamic emails,
    num? cRMCompanyStatus,
    num? salary,
    dynamic description,
    dynamic telegram,
    dynamic whatsApp,
    dynamic instagram,
    dynamic rate,
    num? attractive,
    bool? isBlack,
    String? registerDate,
    bool? isAccept,
    bool? isVisible,
    bool? isDelete,
    num? id,
    ResultStatusOperation? resultStatusOperation,
    String? geoLocation,
    dynamic Latitude,
    dynamic Longitude,
    int? sortId,
  }) =>
      CompanyModel(
          userIdentityId: userIdentityId ?? _userIdentityId,
          userIdentity: userIdentity ?? _userIdentity,
          applicationUserId: applicationUserId ?? _applicationUserId,
          parentId: parentId ?? _parentId,
          parent: parent ?? _parent,
          cityId: cityId ?? _cityId,
          city: city ?? _city,
          supplierCode: supplierCode ?? _supplierCode,
          economicCode: economicCode ?? _economicCode,
          nationalCode: nationalCode ?? _nationalCode,
          companyName: companyName ?? _companyName,
          brand: brand ?? _brand,
          typeCopmany: typeCopmany ?? _typeCopmany,
          phoneNumber: phoneNumber ?? _phoneNumber,
          faxNumber: faxNumber ?? _faxNumber,
          address: address ?? _address,
          website: website ?? _website,
          registrationNumber: registrationNumber ?? _registrationNumber,
          postalCode: postalCode ?? _postalCode,
          phoneNumbers: phoneNumbers ?? _phoneNumbers,
          personnelCount: personnelCount ?? _personnelCount,
          emails: emails ?? _emails,
          cRMCompanyStatus: cRMCompanyStatus ?? _cRMCompanyStatus,
          salary: salary ?? _salary,
          description: description ?? _description,
          telegram: telegram ?? _telegram,
          whatsApp: whatsApp ?? _whatsApp,
          instagram: instagram ?? _instagram,
          rate: rate ?? _rate,
          attractive: attractive ?? _attractive,
          isBlack: isBlack ?? _isBlack,
          registerDate: registerDate ?? _registerDate,
          isAccept: isAccept ?? _isAccept,
          isVisible: isVisible ?? _isVisible,
          isDelete: isDelete ?? _isDelete,
          id: id ?? _id,
          resultStatusOperation:
              resultStatusOperation ?? _resultStatusOperation,
          geoLocation: geoLocation ?? _geoLocation,
          Latitude: Latitude ?? _Latitude,
          Longitude: Longitude ?? _Longitude,
          sortId: sortId ?? _sortId);
  String? get userIdentityId => _userIdentityId;
  UserIdentity? get userIdentity => _userIdentity;
  dynamic get applicationUserId => _applicationUserId;
  dynamic get parentId => _parentId;
  dynamic get parent => _parent;
  num? get cityId => _cityId;
  City? get city => _city;
  dynamic get supplierCode => _supplierCode;
  String? get economicCode => _economicCode;
  dynamic get nationalCode => _nationalCode;
  String? get companyName => _companyName;
  dynamic get brand => _brand;
  num? get typeCopmany => _typeCopmany;
  String? get phoneNumber => _phoneNumber;
  dynamic get faxNumber => _faxNumber;
  String? get address => _address;
  dynamic get website => _website;
  String? get registrationNumber => _registrationNumber;
  String? get postalCode => _postalCode;
  dynamic get phoneNumbers => _phoneNumbers;
  num? get personnelCount => _personnelCount;
  dynamic get emails => _emails;
  num? get cRMCompanyStatus => _cRMCompanyStatus;
  num? get salary => _salary;
  dynamic get description => _description;
  dynamic get telegram => _telegram;
  dynamic get whatsApp => _whatsApp;
  dynamic get instagram => _instagram;
  dynamic get rate => _rate;
  num? get attractive => _attractive;
  bool? get isBlack => _isBlack;
  String? get registerDate => _registerDate;
  bool? get isAccept => _isAccept;
  bool? get isVisible => _isVisible;
  bool? get isDelete => _isDelete;
  num? get id => _id;
  ResultStatusOperation? get resultStatusOperation => _resultStatusOperation;
  String? get geoLocation => _geoLocation;
  dynamic get Latitude => _Latitude;
  dynamic get Longitude => _Longitude;
  int? get sortId => _sortId;

  set setGeo(String value) => _geoLocation = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserIdentityId'] = _userIdentityId;
    if (_userIdentity != null) {
      map['UserIdentity'] = _userIdentity?.toJson();
    }
    map['ApplicationUserId'] = _applicationUserId;
    map['ParentId'] = _parentId;
    map['Parent'] = _parent;
    map['CityId'] = _cityId;
    if (_city != null) {
      map['City'] = _city?.toJson();
    }
    map['SupplierCode'] = _supplierCode;
    map['EconomicCode'] = _economicCode;
    map['NationalCode'] = _nationalCode;
    map['CompanyName'] = _companyName;
    map['Brand'] = _brand;
    map['TypeCopmany'] = _typeCopmany;
    map['PhoneNumber'] = _phoneNumber;
    map['FaxNumber'] = _faxNumber;
    map['Address'] = _address;
    map['Website'] = _website;
    map['RegistrationNumber'] = _registrationNumber;
    map['PostalCode'] = _postalCode;
    map['PhoneNumbers'] = _phoneNumbers;
    map['PersonnelCount'] = _personnelCount;
    map['Emails'] = _emails;
    map['CRMCompanyStatus'] = _cRMCompanyStatus;
    map['Salary'] = _salary;
    map['Description'] = _description;
    map['Telegram'] = _telegram;
    map['WhatsApp'] = _whatsApp;
    map['Instagram'] = _instagram;
    map['Rate'] = _rate;
    map['Attractive'] = _attractive;
    map['IsBlack'] = _isBlack;
    map['RegisterDate'] = _registerDate;
    map['IsAccept'] = _isAccept;
    map['IsVisible'] = _isVisible;
    map['IsDelete'] = _isDelete;
    map['Latitude'] = _Latitude;
    map['Longitude'] = _Longitude;
    map['SortId'] = _sortId;
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

ResultStatusOperation resultStatusOperationFromJson(String str) =>
    ResultStatusOperation.fromJson(json.decode(str));
String resultStatusOperationToJson(ResultStatusOperation data) =>
    json.encode(data.toJson());

class ResultStatusOperation {
  ResultStatusOperation({
    dynamic title,
    dynamic message,
    num? type,
    bool? isSuccessed,
    dynamic errorException,
  }) {
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
  ResultStatusOperation copyWith({
    dynamic title,
    dynamic message,
    num? type,
    bool? isSuccessed,
    dynamic errorException,
  }) =>
      ResultStatusOperation(
        title: title ?? _title,
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

/// StateId : 17
/// State : null
/// Title : "کازرون"
/// Id : 5
/// ResultStatusOperation : {"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}

City cityFromJson(String str) => City.fromJson(json.decode(str));
String cityToJson(City data) => json.encode(data.toJson());

class City {
  City({
    num? stateId,
    dynamic state,
    String? title,
    num? id,
    ResultStatusOperation? resultStatusOperation,
  }) {
    _stateId = stateId;
    _state = state;
    _title = title;
    _id = id;
    _resultStatusOperation = resultStatusOperation;
  }

  City.fromJson(dynamic json) {
    _stateId = json['StateId'];
    _state = json['State'];
    _title = json['Title'];
    _id = json['Id'];
    _resultStatusOperation = json['ResultStatusOperation'] != null
        ? ResultStatusOperation.fromJson(json['ResultStatusOperation'])
        : null;
  }
  num? _stateId;
  dynamic _state;
  String? _title;
  num? _id;
  ResultStatusOperation? _resultStatusOperation;
  City copyWith({
    num? stateId,
    dynamic state,
    String? title,
    num? id,
    ResultStatusOperation? resultStatusOperation,
  }) =>
      City(
        stateId: stateId ?? _stateId,
        state: state ?? _state,
        title: title ?? _title,
        id: id ?? _id,
        resultStatusOperation: resultStatusOperation ?? _resultStatusOperation,
      );
  num? get stateId => _stateId;
  dynamic get state => _state;
  String? get title => _title;
  num? get id => _id;
  ResultStatusOperation? get resultStatusOperation => _resultStatusOperation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['StateId'] = _stateId;
    map['State'] = _state;
    map['Title'] = _title;
    map['Id'] = _id;
    if (_resultStatusOperation != null) {
      map['ResultStatusOperation'] = _resultStatusOperation?.toJson();
    }
    return map;
  }
}

/// Id : "d82e557a-e067-4523-aa68-a842a142be95"
/// ForgetPasswordId : null
/// UserName : "09177145956"
/// PhoneNumber : "09177145956"
/// UserIdentityTitle : null
/// FirstName : "علیرضا "
/// LastName : "مرحمتی"
/// NationalCode : null
/// IsMale : null
/// ProfileImageFile : null
/// Salt : null
/// Password : null
/// IsLocked : false
/// IsConfirm : null
/// IsDeleted : false
/// RegisterDate : "2022-02-26T12:39:44.2316955"
/// BirthDate : null
/// CreatedByUser : null
/// FatherName : null
/// ModifiedDate : null
/// ModifiedByUser : null
/// Email : "09177145956@ably.co"
/// AboutMe : null
/// HomeAddress : null
/// PostalCode : null
/// StateId : null
/// State : null
/// CityId : null
/// City : null
/// RegisterByMarketerId : null
/// RegisterByMarketer : null
/// MarketerInfoCodes : []
/// HearAboutUs : 0
/// ForgetPasswordCode : "9402"
/// ForgetPasswordCodeGenerateDate : "2022-02-26T12:39:48.1894686"
/// UserFiles : []
/// NormalizedUserName : "09177145956"
/// NormalizedEmail : "09177145956@ABLY.CO"
/// EmailConfirmed : false
/// PasswordHash : "AQAAAAEAACcQAAAAEMzolYQzVzt4xR0SKhaArtlyzfxPWNDC97y9EsO09D2vuEFGKKBcLnyH719YLq1kHA=="
/// SecurityStamp : "56CAFQ6AQWJUALOZOSJBW2UUVJYSIFT6"
/// ConcurrencyStamp : "effdcf01-bac5-4bc5-ba46-bb950e5516a6"
/// PhoneNumberConfirmed : false
/// TwoFactorEnabled : false
/// LockoutEnd : null
/// LockoutEnabled : true
/// AccessFailedCount : 0

UserIdentity userIdentityFromJson(String str) =>
    UserIdentity.fromJson(json.decode(str));
String userIdentityToJson(UserIdentity data) => json.encode(data.toJson());

class UserIdentity {
  UserIdentity({
    String? id,
    dynamic forgetPasswordId,
    String? userName,
    String? phoneNumber,
    dynamic userIdentityTitle,
    String? firstName,
    String? lastName,
    dynamic nationalCode,
    dynamic isMale,
    dynamic profileImageFile,
    dynamic salt,
    dynamic password,
    bool? isLocked,
    dynamic isConfirm,
    bool? isDeleted,
    String? registerDate,
    dynamic birthDate,
    dynamic createdByUser,
    dynamic fatherName,
    dynamic modifiedDate,
    dynamic modifiedByUser,
    String? email,
    dynamic aboutMe,
    dynamic homeAddress,
    dynamic postalCode,
    dynamic stateId,
    dynamic state,
    dynamic cityId,
    dynamic city,
    dynamic registerByMarketerId,
    dynamic registerByMarketer,
    List<dynamic>? marketerInfoCodes,
    num? hearAboutUs,
    String? forgetPasswordCode,
    String? forgetPasswordCodeGenerateDate,
    List<dynamic>? userFiles,
    String? normalizedUserName,
    String? normalizedEmail,
    bool? emailConfirmed,
    String? passwordHash,
    String? securityStamp,
    String? concurrencyStamp,
    bool? phoneNumberConfirmed,
    bool? twoFactorEnabled,
    dynamic lockoutEnd,
    bool? lockoutEnabled,
    num? accessFailedCount,
  }) {
    _id = id;
    _forgetPasswordId = forgetPasswordId;
    _userName = userName;
    _phoneNumber = phoneNumber;
    _userIdentityTitle = userIdentityTitle;
    _firstName = firstName;
    _lastName = lastName;
    _nationalCode = nationalCode;
    _isMale = isMale;
    _profileImageFile = profileImageFile;
    _salt = salt;
    _password = password;
    _isLocked = isLocked;
    _isConfirm = isConfirm;
    _isDeleted = isDeleted;
    _registerDate = registerDate;
    _birthDate = birthDate;
    _createdByUser = createdByUser;
    _fatherName = fatherName;
    _modifiedDate = modifiedDate;
    _modifiedByUser = modifiedByUser;
    _email = email;
    _aboutMe = aboutMe;
    _homeAddress = homeAddress;
    _postalCode = postalCode;
    _stateId = stateId;
    _state = state;
    _cityId = cityId;
    _city = city;
    _registerByMarketerId = registerByMarketerId;
    _registerByMarketer = registerByMarketer;
    _marketerInfoCodes = marketerInfoCodes;
    _hearAboutUs = hearAboutUs;
    _forgetPasswordCode = forgetPasswordCode;
    _forgetPasswordCodeGenerateDate = forgetPasswordCodeGenerateDate;
    _userFiles = userFiles;
    _normalizedUserName = normalizedUserName;
    _normalizedEmail = normalizedEmail;
    _emailConfirmed = emailConfirmed;
    _passwordHash = passwordHash;
    _securityStamp = securityStamp;
    _concurrencyStamp = concurrencyStamp;
    _phoneNumberConfirmed = phoneNumberConfirmed;
    _twoFactorEnabled = twoFactorEnabled;
    _lockoutEnd = lockoutEnd;
    _lockoutEnabled = lockoutEnabled;
    _accessFailedCount = accessFailedCount;
  }

  UserIdentity.fromJson(dynamic json) {
    _id = json['Id'];
    _forgetPasswordId = json['ForgetPasswordId'];
    _userName = json['UserName'];
    _phoneNumber = json['PhoneNumber'];
    _userIdentityTitle = json['UserIdentityTitle'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _nationalCode = json['NationalCode'];
    _isMale = json['IsMale'];
    _profileImageFile = json['ProfileImageFile'];
    _salt = json['Salt'];
    _password = json['Password'];
    _isLocked = json['IsLocked'];
    _isConfirm = json['IsConfirm'];
    _isDeleted = json['IsDeleted'];
    _registerDate = json['RegisterDate'];
    _birthDate = json['BirthDate'];
    _createdByUser = json['CreatedByUser'];
    _fatherName = json['FatherName'];
    _modifiedDate = json['ModifiedDate'];
    _modifiedByUser = json['ModifiedByUser'];
    _email = json['Email'];
    _aboutMe = json['AboutMe'];
    _homeAddress = json['HomeAddress'];
    _postalCode = json['PostalCode'];
    _stateId = json['StateId'];
    _state = json['State'];
    _cityId = json['CityId'];
    _city = json['City'];
    _registerByMarketerId = json['RegisterByMarketerId'];
    _registerByMarketer = json['RegisterByMarketer'];
    if (json['MarketerInfoCodes'] != null) {
      _marketerInfoCodes = [];
      json['MarketerInfoCodes'].forEach((v) {
        // _marketerInfoCodes?.add(Dynamic.fromJson(v));
      });
    }
    _hearAboutUs = json['HearAboutUs'];
    _forgetPasswordCode = json['ForgetPasswordCode'];
    _forgetPasswordCodeGenerateDate = json['ForgetPasswordCodeGenerateDate'];
    if (json['UserFiles'] != null) {
      _userFiles = [];
      json['UserFiles'].forEach((v) {
        //  _userFiles?.add(Dynamic.fromJson(v));
      });
    }
    _normalizedUserName = json['NormalizedUserName'];
    _normalizedEmail = json['NormalizedEmail'];
    _emailConfirmed = json['EmailConfirmed'];
    _passwordHash = json['PasswordHash'];
    _securityStamp = json['SecurityStamp'];
    _concurrencyStamp = json['ConcurrencyStamp'];
    _phoneNumberConfirmed = json['PhoneNumberConfirmed'];
    _twoFactorEnabled = json['TwoFactorEnabled'];
    _lockoutEnd = json['LockoutEnd'];
    _lockoutEnabled = json['LockoutEnabled'];
    _accessFailedCount = json['AccessFailedCount'];
  }
  String? _id;
  dynamic _forgetPasswordId;
  String? _userName;
  String? _phoneNumber;
  dynamic _userIdentityTitle;
  String? _firstName;
  String? _lastName;
  dynamic _nationalCode;
  dynamic _isMale;
  dynamic _profileImageFile;
  dynamic _salt;
  dynamic _password;
  bool? _isLocked;
  dynamic _isConfirm;
  bool? _isDeleted;
  String? _registerDate;
  dynamic _birthDate;
  dynamic _createdByUser;
  dynamic _fatherName;
  dynamic _modifiedDate;
  dynamic _modifiedByUser;
  String? _email;
  dynamic _aboutMe;
  dynamic _homeAddress;
  dynamic _postalCode;
  dynamic _stateId;
  dynamic _state;
  dynamic _cityId;
  dynamic _city;
  dynamic _registerByMarketerId;
  dynamic _registerByMarketer;
  List<dynamic>? _marketerInfoCodes;
  num? _hearAboutUs;
  String? _forgetPasswordCode;
  String? _forgetPasswordCodeGenerateDate;
  List<dynamic>? _userFiles;
  String? _normalizedUserName;
  String? _normalizedEmail;
  bool? _emailConfirmed;
  String? _passwordHash;
  String? _securityStamp;
  String? _concurrencyStamp;
  bool? _phoneNumberConfirmed;
  bool? _twoFactorEnabled;
  dynamic _lockoutEnd;
  bool? _lockoutEnabled;
  num? _accessFailedCount;
  UserIdentity copyWith({
    String? id,
    dynamic forgetPasswordId,
    String? userName,
    String? phoneNumber,
    dynamic userIdentityTitle,
    String? firstName,
    String? lastName,
    dynamic nationalCode,
    dynamic isMale,
    dynamic profileImageFile,
    dynamic salt,
    dynamic password,
    bool? isLocked,
    dynamic isConfirm,
    bool? isDeleted,
    String? registerDate,
    dynamic birthDate,
    dynamic createdByUser,
    dynamic fatherName,
    dynamic modifiedDate,
    dynamic modifiedByUser,
    String? email,
    dynamic aboutMe,
    dynamic homeAddress,
    dynamic postalCode,
    dynamic stateId,
    dynamic state,
    dynamic cityId,
    dynamic city,
    dynamic registerByMarketerId,
    dynamic registerByMarketer,
    List<dynamic>? marketerInfoCodes,
    num? hearAboutUs,
    String? forgetPasswordCode,
    String? forgetPasswordCodeGenerateDate,
    List<dynamic>? userFiles,
    String? normalizedUserName,
    String? normalizedEmail,
    bool? emailConfirmed,
    String? passwordHash,
    String? securityStamp,
    String? concurrencyStamp,
    bool? phoneNumberConfirmed,
    bool? twoFactorEnabled,
    dynamic lockoutEnd,
    bool? lockoutEnabled,
    num? accessFailedCount,
  }) =>
      UserIdentity(
        id: id ?? _id,
        forgetPasswordId: forgetPasswordId ?? _forgetPasswordId,
        userName: userName ?? _userName,
        phoneNumber: phoneNumber ?? _phoneNumber,
        userIdentityTitle: userIdentityTitle ?? _userIdentityTitle,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        nationalCode: nationalCode ?? _nationalCode,
        isMale: isMale ?? _isMale,
        profileImageFile: profileImageFile ?? _profileImageFile,
        salt: salt ?? _salt,
        password: password ?? _password,
        isLocked: isLocked ?? _isLocked,
        isConfirm: isConfirm ?? _isConfirm,
        isDeleted: isDeleted ?? _isDeleted,
        registerDate: registerDate ?? _registerDate,
        birthDate: birthDate ?? _birthDate,
        createdByUser: createdByUser ?? _createdByUser,
        fatherName: fatherName ?? _fatherName,
        modifiedDate: modifiedDate ?? _modifiedDate,
        modifiedByUser: modifiedByUser ?? _modifiedByUser,
        email: email ?? _email,
        aboutMe: aboutMe ?? _aboutMe,
        homeAddress: homeAddress ?? _homeAddress,
        postalCode: postalCode ?? _postalCode,
        stateId: stateId ?? _stateId,
        state: state ?? _state,
        cityId: cityId ?? _cityId,
        city: city ?? _city,
        registerByMarketerId: registerByMarketerId ?? _registerByMarketerId,
        registerByMarketer: registerByMarketer ?? _registerByMarketer,
        marketerInfoCodes: marketerInfoCodes ?? _marketerInfoCodes,
        hearAboutUs: hearAboutUs ?? _hearAboutUs,
        forgetPasswordCode: forgetPasswordCode ?? _forgetPasswordCode,
        forgetPasswordCodeGenerateDate:
            forgetPasswordCodeGenerateDate ?? _forgetPasswordCodeGenerateDate,
        userFiles: userFiles ?? _userFiles,
        normalizedUserName: normalizedUserName ?? _normalizedUserName,
        normalizedEmail: normalizedEmail ?? _normalizedEmail,
        emailConfirmed: emailConfirmed ?? _emailConfirmed,
        passwordHash: passwordHash ?? _passwordHash,
        securityStamp: securityStamp ?? _securityStamp,
        concurrencyStamp: concurrencyStamp ?? _concurrencyStamp,
        phoneNumberConfirmed: phoneNumberConfirmed ?? _phoneNumberConfirmed,
        twoFactorEnabled: twoFactorEnabled ?? _twoFactorEnabled,
        lockoutEnd: lockoutEnd ?? _lockoutEnd,
        lockoutEnabled: lockoutEnabled ?? _lockoutEnabled,
        accessFailedCount: accessFailedCount ?? _accessFailedCount,
      );
  String? get id => _id;
  dynamic get forgetPasswordId => _forgetPasswordId;
  String? get userName => _userName;
  String? get phoneNumber => _phoneNumber;
  dynamic get userIdentityTitle => _userIdentityTitle;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  dynamic get nationalCode => _nationalCode;
  dynamic get isMale => _isMale;
  dynamic get profileImageFile => _profileImageFile;
  dynamic get salt => _salt;
  dynamic get password => _password;
  bool? get isLocked => _isLocked;
  dynamic get isConfirm => _isConfirm;
  bool? get isDeleted => _isDeleted;
  String? get registerDate => _registerDate;
  dynamic get birthDate => _birthDate;
  dynamic get createdByUser => _createdByUser;
  dynamic get fatherName => _fatherName;
  dynamic get modifiedDate => _modifiedDate;
  dynamic get modifiedByUser => _modifiedByUser;
  String? get email => _email;
  dynamic get aboutMe => _aboutMe;
  dynamic get homeAddress => _homeAddress;
  dynamic get postalCode => _postalCode;
  dynamic get stateId => _stateId;
  dynamic get state => _state;
  dynamic get cityId => _cityId;
  dynamic get city => _city;
  dynamic get registerByMarketerId => _registerByMarketerId;
  dynamic get registerByMarketer => _registerByMarketer;
  List<dynamic>? get marketerInfoCodes => _marketerInfoCodes;
  num? get hearAboutUs => _hearAboutUs;
  String? get forgetPasswordCode => _forgetPasswordCode;
  String? get forgetPasswordCodeGenerateDate => _forgetPasswordCodeGenerateDate;
  List<dynamic>? get userFiles => _userFiles;
  String? get normalizedUserName => _normalizedUserName;
  String? get normalizedEmail => _normalizedEmail;
  bool? get emailConfirmed => _emailConfirmed;
  String? get passwordHash => _passwordHash;
  String? get securityStamp => _securityStamp;
  String? get concurrencyStamp => _concurrencyStamp;
  bool? get phoneNumberConfirmed => _phoneNumberConfirmed;
  bool? get twoFactorEnabled => _twoFactorEnabled;
  dynamic get lockoutEnd => _lockoutEnd;
  bool? get lockoutEnabled => _lockoutEnabled;
  num? get accessFailedCount => _accessFailedCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['ForgetPasswordId'] = _forgetPasswordId;
    map['UserName'] = _userName;
    map['PhoneNumber'] = _phoneNumber;
    map['UserIdentityTitle'] = _userIdentityTitle;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['NationalCode'] = _nationalCode;
    map['IsMale'] = _isMale;
    map['ProfileImageFile'] = _profileImageFile;
    map['Salt'] = _salt;
    map['Password'] = _password;
    map['IsLocked'] = _isLocked;
    map['IsConfirm'] = _isConfirm;
    map['IsDeleted'] = _isDeleted;
    map['RegisterDate'] = _registerDate;
    map['BirthDate'] = _birthDate;
    map['CreatedByUser'] = _createdByUser;
    map['FatherName'] = _fatherName;
    map['ModifiedDate'] = _modifiedDate;
    map['ModifiedByUser'] = _modifiedByUser;
    map['Email'] = _email;
    map['AboutMe'] = _aboutMe;
    map['HomeAddress'] = _homeAddress;
    map['PostalCode'] = _postalCode;
    map['StateId'] = _stateId;
    map['State'] = _state;
    map['CityId'] = _cityId;
    map['City'] = _city;
    map['RegisterByMarketerId'] = _registerByMarketerId;
    map['RegisterByMarketer'] = _registerByMarketer;
    if (_marketerInfoCodes != null) {
      map['MarketerInfoCodes'] =
          _marketerInfoCodes?.map((v) => v.toJson()).toList();
    }
    map['HearAboutUs'] = _hearAboutUs;
    map['ForgetPasswordCode'] = _forgetPasswordCode;
    map['ForgetPasswordCodeGenerateDate'] = _forgetPasswordCodeGenerateDate;
    if (_userFiles != null) {
      map['UserFiles'] = _userFiles?.map((v) => v.toJson()).toList();
    }
    map['NormalizedUserName'] = _normalizedUserName;
    map['NormalizedEmail'] = _normalizedEmail;
    map['EmailConfirmed'] = _emailConfirmed;
    map['PasswordHash'] = _passwordHash;
    map['SecurityStamp'] = _securityStamp;
    map['ConcurrencyStamp'] = _concurrencyStamp;
    map['PhoneNumberConfirmed'] = _phoneNumberConfirmed;
    map['TwoFactorEnabled'] = _twoFactorEnabled;
    map['LockoutEnd'] = _lockoutEnd;
    map['LockoutEnabled'] = _lockoutEnabled;
    map['AccessFailedCount'] = _accessFailedCount;
    return map;
  }
}
