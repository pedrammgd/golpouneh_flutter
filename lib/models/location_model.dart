import 'dart:convert';

/// HttpStatusCode : "200"
/// Result : {"result":[{"UserIdentityId":"d82e557a-e067-4523-aa68-a842a142be95",
/// "UserIdentity":{"Id":"d82e557a-e067-4523-aa68-a842a142be95",
/// "ForgetPasswordId":null,
/// "UserName":"09177145956",
/// "PhoneNumber":"09177145956",
/// "UserIdentityTitle":null,
/// "FirstName":"علیرضا ",
/// "LastName":"مرحمتی","NationalCode":null,
/// "IsMale":null,"ProfileImageFile":null,
/// "Salt":null,
/// "Password":null,
/// "IsLocked":false,
/// "IsConfirm":null,
/// "IsDeleted":false,
/// "RegisterDate":"2022-02-26T12:39:44.2316955",
/// "BirthDate":null,
/// "CreatedByUser":null,
/// "FatherName":null,
/// "ModifiedDate":null,
/// "ModifiedByUser":null,
/// "Email":"09177145956@ably.co",
/// "AboutMe":null,
/// "HomeAddress":null,
/// "PostalCode":null,
/// "StateId":null,
/// "State":null,
/// "CityId":null,
/// "City":null,
/// "RegisterByMarketerId":null,
/// "RegisterByMarketer":null,
/// "MarketerInfoCodes":[],
/// "HearAboutUs":0,"ForgetPasswordCode":"9402","ForgetPasswordCodeGenerateDate":"2022-02-26T12:39:48.1894686","UserFiles":[],"NormalizedUserName":"09177145956","NormalizedEmail":"09177145956@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEMzolYQzVzt4xR0SKhaArtlyzfxPWNDC97y9EsO09D2vuEFGKKBcLnyH719YLq1kHA==","SecurityStamp":"56CAFQ6AQWJUALOZOSJBW2UUVJYSIFT6","ConcurrencyStamp":"effdcf01-bac5-4bc5-ba46-bb950e5516a6","PhoneNumberConfirmed":false,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":5,"City":{"StateId":17,"State":null,"Title":"کازرون","Id":5,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":null,"EconomicCode":"۱۱۱۱۱۱۱۱","NationalCode":null,"CompanyName":"ندارم","Brand":null,"TypeCopmany":0,"PhoneNumber":"09177145956","FaxNumber":null,"Address":"کازرون ","Website":null,"RegistrationNumber":"۱۱۱۱۱۱۱۱۱۱","PostalCode":"۱۱۱۱۱۱۱۱۱۱","PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"2022-02-26T12:50:52.5883378","IsAccept":false,"IsVisible":true,"IsDelete":false,"Id":30,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":null,"UserIdentity":null,"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7101","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه پاسداران","Brand":null,"TypeCopmany":0,"PhoneNumber":"07138227323","FaxNumber":null,"Address":"پاسداران _ روبروی خیابان آقایی نبش کوچه 68","Website":null,"RegistrationNumber":"07138227323","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":1,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":null,"UserIdentity":null,"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7102","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه معالی آباد","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136248126","FaxNumber":null,"Address":"خیابان معالی آباد _ نبش کوچه 5","Website":null,"RegistrationNumber":"07136248126","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":2,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7103","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه نصر","Brand":null,"TypeCopmany":0,"PhoneNumber":"07137303613","FaxNumber":null,"Address":"بلوار نصر _ جنب هتل جهانگردی","Website":null,"RegistrationNumber":"07137303613","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":3,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7104","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه روغن نباتی","Brand":null,"TypeCopmany":0,"PhoneNumber":"07132258066","FaxNumber":null,"Address":"روغن نباتی _ اول خیابان سفر","Website":null,"RegistrationNumber":"07132258066","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":4,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7105","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه ولیعصر","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136274965","FaxNumber":null,"Address":"خیابان قصردشت _ خیابان ولیعصر نبش کوچه 3","Website":null,"RegistrationNumber":"07136274965","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":5,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7111","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی خلدبرین","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136475031","FaxNumber":null,"Address":"خلدبرین _ روبروی پارک ، بین کوچه 16 و 18","Website":null,"RegistrationNumber":"07136475031","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":6,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7112","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی فضل آباد","Brand":null,"TypeCopmany":0,"PhoneNumber":"07137278795","FaxNumber":null,"Address":"انتهای فضل آباد _ بلوارک فدک نبش کوچه 4","Website":null,"RegistrationNumber":"07137278795","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":7,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7113","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی دکتر حسابی","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136231713","FaxNumber":null,"Address":"دکترحسابی _ نبش آرین حد فاصل کوچه 20 و 22","Website":null,"RegistrationNumber":"07136231713","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":8,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7114","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی گلدشت معالی آباد","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136392699","FaxNumber":null,"Address":"گلدشت _ خیابان لادن بازارچه اکرام زاده، کوچه 4","Website":null,"RegistrationNumber":"07136392699","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":9,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}]}

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    String? httpStatusCode,
    Result? result,
  }) {
    _httpStatusCode = httpStatusCode;
    _result = result;
  }

  LocationModel.fromJson(dynamic json) {
    _httpStatusCode = json['HttpStatusCode'];
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }

  String? _httpStatusCode;
  Result? _result;

  LocationModel copyWith({
    String? httpStatusCode,
    Result? result,
  }) =>
      LocationModel(
        httpStatusCode: httpStatusCode ?? _httpStatusCode,
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

/// result : [{"UserIdentityId":"d82e557a-e067-4523-aa68-a842a142be95","UserIdentity":{"Id":"d82e557a-e067-4523-aa68-a842a142be95","ForgetPasswordId":null,"UserName":"09177145956","PhoneNumber":"09177145956","UserIdentityTitle":null,"FirstName":"علیرضا ","LastName":"مرحمتی","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2022-02-26T12:39:44.2316955","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09177145956@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9402","ForgetPasswordCodeGenerateDate":"2022-02-26T12:39:48.1894686","UserFiles":[],"NormalizedUserName":"09177145956","NormalizedEmail":"09177145956@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEMzolYQzVzt4xR0SKhaArtlyzfxPWNDC97y9EsO09D2vuEFGKKBcLnyH719YLq1kHA==","SecurityStamp":"56CAFQ6AQWJUALOZOSJBW2UUVJYSIFT6","ConcurrencyStamp":"effdcf01-bac5-4bc5-ba46-bb950e5516a6","PhoneNumberConfirmed":false,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":5,"City":{"StateId":17,"State":null,"Title":"کازرون","Id":5,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":null,"EconomicCode":"۱۱۱۱۱۱۱۱","NationalCode":null,"CompanyName":"ندارم","Brand":null,"TypeCopmany":0,"PhoneNumber":"09177145956","FaxNumber":null,"Address":"کازرون ","Website":null,"RegistrationNumber":"۱۱۱۱۱۱۱۱۱۱","PostalCode":"۱۱۱۱۱۱۱۱۱۱","PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"2022-02-26T12:50:52.5883378","IsAccept":false,"IsVisible":true,"IsDelete":false,"Id":30,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":null,"UserIdentity":null,"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7101","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه پاسداران","Brand":null,"TypeCopmany":0,"PhoneNumber":"07138227323","FaxNumber":null,"Address":"پاسداران _ روبروی خیابان آقایی نبش کوچه 68","Website":null,"RegistrationNumber":"07138227323","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":1,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":null,"UserIdentity":null,"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7102","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه معالی آباد","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136248126","FaxNumber":null,"Address":"خیابان معالی آباد _ نبش کوچه 5","Website":null,"RegistrationNumber":"07136248126","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":2,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7103","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه نصر","Brand":null,"TypeCopmany":0,"PhoneNumber":"07137303613","FaxNumber":null,"Address":"بلوار نصر _ جنب هتل جهانگردی","Website":null,"RegistrationNumber":"07137303613","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":3,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7104","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه روغن نباتی","Brand":null,"TypeCopmany":0,"PhoneNumber":"07132258066","FaxNumber":null,"Address":"روغن نباتی _ اول خیابان سفر","Website":null,"RegistrationNumber":"07132258066","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":4,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7105","EconomicCode":null,"NationalCode":null,"CompanyName":"شعبه ولیعصر","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136274965","FaxNumber":null,"Address":"خیابان قصردشت _ خیابان ولیعصر نبش کوچه 3","Website":null,"RegistrationNumber":"07136274965","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":5,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7111","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی خلدبرین","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136475031","FaxNumber":null,"Address":"خلدبرین _ روبروی پارک ، بین کوچه 16 و 18","Website":null,"RegistrationNumber":"07136475031","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":6,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7112","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی فضل آباد","Brand":null,"TypeCopmany":0,"PhoneNumber":"07137278795","FaxNumber":null,"Address":"انتهای فضل آباد _ بلوارک فدک نبش کوچه 4","Website":null,"RegistrationNumber":"07137278795","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":7,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7113","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی دکتر حسابی","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136231713","FaxNumber":null,"Address":"دکترحسابی _ نبش آرین حد فاصل کوچه 20 و 22","Website":null,"RegistrationNumber":"07136231713","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":8,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},{"UserIdentityId":"cda898c4-fcf8-42c4-9693-a534b36ac478","UserIdentity":{"Id":"cda898c4-fcf8-42c4-9693-a534b36ac478","ForgetPasswordId":null,"UserName":"admin","PhoneNumber":"09111111111","UserIdentityTitle":null,"FirstName":"مدیر","LastName":"سایت","NationalCode":null,"IsMale":null,"ProfileImageFile":null,"Salt":null,"Password":null,"IsLocked":false,"IsConfirm":null,"IsDeleted":false,"RegisterDate":"2019-12-22T15:41:04.9218606","BirthDate":null,"CreatedByUser":null,"FatherName":null,"ModifiedDate":null,"ModifiedByUser":null,"Email":"09397893772@ably.co","AboutMe":null,"HomeAddress":null,"PostalCode":null,"StateId":null,"State":null,"CityId":null,"City":null,"RegisterByMarketerId":null,"RegisterByMarketer":null,"MarketerInfoCodes":[],"HearAboutUs":0,"ForgetPasswordCode":"9490","ForgetPasswordCodeGenerateDate":"2021-10-18T18:58:46.8312901","UserFiles":[],"NormalizedUserName":"admin","NormalizedEmail":"09111111111@ABLY.CO","EmailConfirmed":false,"PasswordHash":"AQAAAAEAACcQAAAAEDP6fFqasWUUC9Vio9E+g25MHp6/BwcspqeTNl/rfBMGt9J933r1U0NvVg7BxP0Itg==","SecurityStamp":"JTQ33M7W6YLCL5SJJL7PO54UZLHCFYTE","ConcurrencyStamp":"09ccb166-8c74-4d1e-9d61-b282427515b3","PhoneNumberConfirmed":true,"TwoFactorEnabled":false,"LockoutEnd":null,"LockoutEnabled":true,"AccessFailedCount":0},"ApplicationUserId":null,"ParentId":null,"Parent":null,"CityId":0,"City":{"StateId":0,"State":null,"Title":" نامشخص ","Id":0,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}},"SupplierCode":"7114","EconomicCode":null,"NationalCode":null,"CompanyName":"نمایندگی گلدشت معالی آباد","Brand":null,"TypeCopmany":0,"PhoneNumber":"07136392699","FaxNumber":null,"Address":"گلدشت _ خیابان لادن بازارچه اکرام زاده، کوچه 4","Website":null,"RegistrationNumber":"07136392699","PostalCode":null,"PhoneNumbers":null,"PersonnelCount":0,"Emails":null,"CRMCompanyStatus":0,"Salary":0,"Description":null,"Telegram":null,"WhatsApp":null,"Instagram":null,"Rate":null,"Attractive":0,"IsBlack":false,"RegisterDate":"0001-01-01T00:00:00","IsAccept":true,"IsVisible":true,"IsDelete":false,"Id":9,"ResultStatusOperation":{"Title":null,"Message":null,"Type":0,"IsSuccessed":false,"ErrorException":null}}]

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
  Result({
    List<Result>? result,
  }) {
    _result = result;
  }

  Result.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(Result.fromJson(v));
      });
    }
  }

  List<Result>? _result;

  Result copyWith({
    List<Result>? result,
  }) =>
      Result(
        result: result ?? _result,
      );

  List<Result>? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

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

/// Title : null
/// Message : null
/// Type : 0
/// IsSuccessed : false
/// ErrorException : null

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
