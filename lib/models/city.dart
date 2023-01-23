/// Id : 332
/// StateId : 30
/// Title : " اهنگ"

class CityModel {
  CityModel({
      int? id, 
      int? stateId, 
      String? title,}){
    _id = id;
    _stateId = stateId;
    _title = title;
}

  CityModel.fromJson(dynamic json) {
    _id = json['Id'];
    _stateId = json['StateId'];
    _title = json['Title'];
  }
  int? _id;
  int? _stateId;
  String? _title;

  int? get id => _id;
  int? get stateId => _stateId;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['StateId'] = _stateId;
    map['Title'] = _title;
    return map;
  }

}