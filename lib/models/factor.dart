class FactorModel {
  String? invoiceSellNo;
  bool? isConfirm;
  String? orderDate;
  int? id;

  FactorModel({this.invoiceSellNo, this.isConfirm, this.orderDate, this.id});

  factory FactorModel.fromJson(Map<String, dynamic> json) {
    return FactorModel(
        invoiceSellNo: json['InvoiceSellNo'],
        isConfirm: json['IsConfirm'],
        orderDate: json['OrderDate'],
        id: json['Id']);
  }
}
