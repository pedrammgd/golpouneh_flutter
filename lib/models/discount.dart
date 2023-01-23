class DiscountModel {
  String title;
  String offCode;
  int? amount;
  double? percent;
  String startDate;
  String endDate;
  int count;
  int usedCounter;
  bool isEnable;

  DiscountModel(
      {required this.title,
      required this.offCode,
      this.amount,
      this.percent,
      required this.startDate,
      required this.endDate,
      required this.count,
      required this.usedCounter,
      required this.isEnable});

  factory DiscountModel.fromJson(Map<String, dynamic> data) {
    return DiscountModel(
        title: data["Title"],
        offCode: data["OffCode"],
        amount: data["Amount"],
        percent: data["Percent"],
        startDate: data["StartDate"],
        endDate: data["EndtDate"],
        count: data["Counter"],
        usedCounter: data["UsedCounter"],
        isEnable: data["IsEnable"]);
  }
}
