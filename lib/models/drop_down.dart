/// Text : "نامشخص"
/// Value : "0"

class DropDownModel {
  DropDownModel({
    String? text,
    String? value,
  }) {
    _text = text;
    _value = value;
  }

  DropDownModel.fromJson(dynamic json) {
    _text = json['Text'];
    _value = json['Value'];
  }

  String? _text;
  String? _value;

  String? get text => _text;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Text'] = _text;
    map['Value'] = _value;
    return map;
  }
}
