class ResultOperation {
  String? message;
  bool? isSuccess;
  int? Type;

  ResultOperation({this.message, this.isSuccess,this.Type});

  factory ResultOperation.fromJson(Map<String, dynamic> json) {
    return ResultOperation(message: json['Message'], isSuccess: json['IsSuccessed'],Type:json['Type'] );
  }
}
