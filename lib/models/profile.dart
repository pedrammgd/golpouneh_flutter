/// Id : "b37b2e10-5a0b-4d8d-9b94-38e8d34c9052"
/// UserName : "09120975516"
/// PhoneNumber : "09120975516"
/// FirstName : "Esmaeil"
/// LastName : "Sheidaei"
/// IsMale : true
/// RegisterDate : "2019-09-14T12:38:16.3779033"
/// Email : "hsdv@uashcb.sd"

class ProfileModel {
  ProfileModel({
    String? id,
    String? userName,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    bool? isMale,
    String? registerDate,
    String? email,
    String? titleOrganization,
  }){
    _id = id;
    _userName = userName;
    _phoneNumber = phoneNumber;
    _firstName = firstName;
    _lastName = lastName;
    _isMale = isMale;
    _registerDate = registerDate;
    _email = email;
    _titleOrganization = titleOrganization;
  }

  ProfileModel.fromJson(dynamic json) {
    _id = json['Id'];
    _userName = json['UserName'];
    _phoneNumber = json['PhoneNumber'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _isMale = json['IsMale'];
    _registerDate = json['RegisterDate'];
    _email = json['Email'];
    _titleOrganization = json['AboutMe'];
  }
  String? _id;
  String? _userName;
  String? _phoneNumber;
  String? _firstName;
  String? _lastName;
  bool? _isMale;
  String? _registerDate;
  String? _email;
  String? _titleOrganization;

  String? get id => _id;
  String? get userName => _userName;
  String? get phoneNumber => _phoneNumber;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  bool? get isMale => _isMale;
  String? get registerDate => _registerDate;
  String? get email => _email;
  String? get titleOrganization => _titleOrganization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id.toString();
    map['UserName'] = _userName.toString();
    map['PhoneNumber'] = _phoneNumber.toString();
    map['FirstName'] = _firstName.toString();
    map['LastName'] = _lastName.toString();
    map['IsMale'] = _isMale.toString();
    map['RegisterDate'] = _registerDate.toString();
    map['Email'] = _email.toString();
    map['AboutMe'] = _titleOrganization.toString();

    return map;
  }

}