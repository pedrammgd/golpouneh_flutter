import 'dart:convert';
/// HttpStatusCode : "200"
/// Result : {"points":false}

ScoreModel scoreModelFromJson(String str) => ScoreModel.fromJson(json.decode(str));
String scoreModelToJson(ScoreModel data) => json.encode(data.toJson());
class ScoreModel {
  ScoreModel({
      String? httpStatusCode, 
      Result? result,}){
    _httpStatusCode = httpStatusCode;
    _result = result;
}

  ScoreModel.fromJson(dynamic json) {
    _httpStatusCode = json['HttpStatusCode'];
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  String? _httpStatusCode;
  Result? _result;
ScoreModel copyWith({  String? httpStatusCode,
  Result? result,
}) => ScoreModel(  httpStatusCode: httpStatusCode ?? _httpStatusCode,
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

/// points : false

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      bool? points,}){
    _points = points;
}

  Result.fromJson(dynamic json) {
    _points = json['points'];
  }
  bool? _points;
Result copyWith({  bool? points,
}) => Result(  points: points ?? _points,
);
  bool? get points => _points;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['points'] = _points;
    return map;
  }

}