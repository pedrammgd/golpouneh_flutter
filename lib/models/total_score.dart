import 'dart:convert';
/// HttpStatusCode : "200"
/// Result : {"points":15.0}

TotalScore totalScoreFromJson(String str) => TotalScore.fromJson(json.decode(str));
String totalScoreToJson(TotalScore data) => json.encode(data.toJson());
class TotalScore {
  TotalScore({
      String? httpStatusCode, 
      Result? result,}){
    _httpStatusCode = httpStatusCode;
    _result = result;
}

  TotalScore.fromJson(dynamic json) {
    _httpStatusCode = json['HttpStatusCode'];
    _result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
  }
  String? _httpStatusCode;
  Result? _result;
TotalScore copyWith({  String? httpStatusCode,
  Result? result,
}) => TotalScore(  httpStatusCode: httpStatusCode ?? _httpStatusCode,
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

/// points : 15.0

Result resultFromJson(String str) => Result.fromJson(json.decode(str));
String resultToJson(Result data) => json.encode(data.toJson());
class Result {
  Result({
      num? points,}){
    _points = points;
}

  Result.fromJson(dynamic json) {
    _points = json['points'];
  }
  num? _points;
Result copyWith({  num? points,
}) => Result(  points: points ?? _points,
);
  num? get points => _points;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['points'] = _points;
    return map;
  }

}