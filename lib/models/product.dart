/// Id : 23
/// ProductInfoId : 23
/// ProductUrl : "سیب_گلاب"
/// Title : "سیب گلاب"
/// Description : "<p dir=\"rtl\">توضیحات سیب گلاب توضیحات سیب گلا</p>\r\n\r\n<p dir=\"rtl\">&nbsp;</p>\r\n\r\n<p dir=\"rtl\">توضیحات سیب گلااااااب</p>\r\n"
/// Intro : "<p dir=\"rtl\">چکیده سیب گلاب چکیده سیب گلاب</p>\r\n"
/// Brand : ""
/// Price : 15000.0
/// ImgUrl : "gol_pounehsseed/uploads/img/download.jpg"
/// OrderProductCount : 0
/// IsProductExist : true
/// IsThisProductExist : true
/// IsExistDiscountForThisProduct : false
/// IsExistDiscountForThisFactor : false
/// SaleOrderProductFinalPrice : 15000.0
/// PayableAmmountWithDiscount : 0.0
/// PayableAmmountWithoutDiscount : 0.0
/// ProductFinancialId : 0
/// SaleOrderProductAdminDiscount : 0
/// SaleFactorAdminDiscount : 0
/// SaleDiscountTypeForProduct : 0
/// SaleDiscountTypeDiscountTypeForProduct : 0
/// SaleDiscountTypeForFactor : 0
/// SaleDiscountTypeDiscountTypeForFactor : 0

class ProductModel {
  ProductModel({
    int? id,
    int? productInfoId,
    String? productUrl,
    String? title,
    String? description,
    String? intro,
    String? brand,
    double? price,
    String? imgUrl,
    int? orderProductCount,
    bool? isProductExist,
    bool? isThisProductExist,
    bool? isExistDiscountForThisProduct,
    bool? isExistDiscountForThisFactor,
    double? saleOrderProductFinalPrice,
    double? payableAmmountWithDiscount,
    double? payableAmmountWithoutDiscount,
    int? productFinancialId,
    int? saleOrderProductAdminDiscount,
    int? saleFactorAdminDiscount,
    int? saleDiscountTypeForProduct,
    int? saleDiscountTypeDiscountTypeForProduct,
    int? saleDiscountTypeForFactor,
    int? saleDiscountTypeDiscountTypeForFactor,
    int? saleFactorDiscountAmmount,
    double? SaleFactorDiscountAmmount,
  }) {
    _id = id;
    _productInfoId = productInfoId;
    _productUrl = productUrl;
    _title = title;
    _description = description;
    _intro = intro;
    _brand = brand;
    _price = price;
    _imgUrl = imgUrl;
    _orderProductCount = orderProductCount;
    _isProductExist = isProductExist;
    _isThisProductExist = isThisProductExist;
    _isExistDiscountForThisProduct = isExistDiscountForThisProduct;
    _isExistDiscountForThisFactor = isExistDiscountForThisFactor;
    _saleOrderProductFinalPrice = saleOrderProductFinalPrice;
    _payableAmmountWithDiscount = payableAmmountWithDiscount;
    _payableAmmountWithoutDiscount = payableAmmountWithoutDiscount;
    _productFinancialId = productFinancialId;
    _saleOrderProductAdminDiscount = saleOrderProductAdminDiscount;
    _saleFactorAdminDiscount = saleFactorAdminDiscount;
    _saleDiscountTypeForProduct = saleDiscountTypeForProduct;
    _saleDiscountTypeDiscountTypeForProduct = saleDiscountTypeDiscountTypeForProduct;
    _saleDiscountTypeForFactor = saleDiscountTypeForFactor;
    _saleDiscountTypeDiscountTypeForFactor = saleDiscountTypeDiscountTypeForFactor;
    _SaleFactorDiscountAmmount = SaleFactorDiscountAmmount;

  }

  ProductModel.fromJson(dynamic json) {
    _id = json['Id'];
    _productInfoId = json['ProductInfoId'];
    _productUrl = json['ProductUrl'];
    _title = json['Title'];
    _description = json['Description'];
    _intro = json['Intro'];
    _brand = json['Brand'];
    _price = json['Price'];
    _imgUrl = json['ImgUrl'];
    _orderProductCount = json['OrderProductCount'];
    _isProductExist = json['IsProductExist'];
    _isThisProductExist = json['IsThisProductExist'];
    _isExistDiscountForThisProduct = json['IsExistDiscountForThisProduct'];
    _isExistDiscountForThisFactor = json['IsExistDiscountForThisFactor'];
    _saleOrderProductFinalPrice = json['SaleOrderProductFinalPrice'];
    _payableAmmountWithDiscount = json['PayableAmmountWithDiscount'];
    _payableAmmountWithoutDiscount = json['PayableAmmountWithoutDiscount'];
    _productFinancialId = json['ProductFinancialId'];
    _saleOrderProductAdminDiscount = json['SaleOrderProductAdminDiscount'];
    _saleFactorAdminDiscount = json['SaleFactorAdminDiscount'];
    _saleDiscountTypeForProduct = json['SaleDiscountTypeForProduct'];
    _saleDiscountTypeDiscountTypeForProduct = json['SaleDiscountTypeDiscountTypeForProduct'];
    _saleDiscountTypeForFactor = json['SaleDiscountTypeForFactor'];
    _saleDiscountTypeDiscountTypeForFactor = json['SaleDiscountTypeDiscountTypeForFactor'];
    _SaleFactorDiscountAmmount = json['SaleFactorDiscountAmmount'];
  }
  int? _id;
  int? _productInfoId;
  String? _productUrl;
  String? _title;
  String? _description;
  String? _intro;
  String? _brand;
  double? _price;
  String? _imgUrl;
  int? _orderProductCount;
  bool? _isProductExist;
  bool? _isThisProductExist;
  bool? _isExistDiscountForThisProduct;
  bool? _isExistDiscountForThisFactor;
  double? _saleOrderProductFinalPrice;
  double? _payableAmmountWithDiscount;
  double? _payableAmmountWithoutDiscount;
  int? _productFinancialId;
  int? _saleOrderProductAdminDiscount;
  int? _saleFactorAdminDiscount;
  int? _saleDiscountTypeForProduct;
  int? _saleDiscountTypeDiscountTypeForProduct;
  int? _saleDiscountTypeForFactor;
  int? _saleDiscountTypeDiscountTypeForFactor;
  double? _SaleFactorDiscountAmmount;

  int? get id => _id;
  int? get productInfoId => _productInfoId;
  String? get productUrl => _productUrl;
  String? get title => _title;
  String? get description => _description;
  String? get intro => _intro;
  String? get brand => _brand;
  double? get price => _price;
  String? get imgUrl => _imgUrl;
  int? get orderProductCount => _orderProductCount;
  bool? get isProductExist => _isProductExist;
  bool? get isThisProductExist => _isThisProductExist;
  bool? get isExistDiscountForThisProduct => _isExistDiscountForThisProduct;
  bool? get isExistDiscountForThisFactor => _isExistDiscountForThisFactor;
  double? get saleOrderProductFinalPrice => _saleOrderProductFinalPrice;
  double? get payableAmmountWithDiscount => _payableAmmountWithDiscount;
  double? get payableAmmountWithoutDiscount => _payableAmmountWithoutDiscount;
  int? get productFinancialId => _productFinancialId;
  int? get saleOrderProductAdminDiscount => _saleOrderProductAdminDiscount;
  int? get saleFactorAdminDiscount => _saleFactorAdminDiscount;
  int? get saleDiscountTypeForProduct => _saleDiscountTypeForProduct;
  int? get saleDiscountTypeDiscountTypeForProduct => _saleDiscountTypeDiscountTypeForProduct;
  int? get saleDiscountTypeForFactor => _saleDiscountTypeForFactor;
  int? get saleDiscountTypeDiscountTypeForFactor => _saleDiscountTypeDiscountTypeForFactor;
  double? get SaleFactorDiscountAmmount => _SaleFactorDiscountAmmount;


  set orderProductCount(value) => _orderProductCount = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['ProductInfoId'] = _productInfoId;
    map['ProductUrl'] = _productUrl;
    map['Title'] = _title;
    map['Description'] = _description;
    map['Intro'] = _intro;
    map['Brand'] = _brand;
    map['Price'] = _price;
    map['ImgUrl'] = _imgUrl;
    map['OrderProductCount'] = _orderProductCount;
    map['IsProductExist'] = _isProductExist;
    map['IsThisProductExist'] = _isThisProductExist;
    map['IsExistDiscountForThisProduct'] = _isExistDiscountForThisProduct;
    map['IsExistDiscountForThisFactor'] = _isExistDiscountForThisFactor;
    map['SaleOrderProductFinalPrice'] = _saleOrderProductFinalPrice;
    map['PayableAmmountWithDiscount'] = _payableAmmountWithDiscount;
    map['PayableAmmountWithoutDiscount'] = _payableAmmountWithoutDiscount;
    map['ProductFinancialId'] = _productFinancialId;
    map['SaleOrderProductAdminDiscount'] = _saleOrderProductAdminDiscount;
    map['SaleFactorAdminDiscount'] = _saleFactorAdminDiscount;
    map['SaleDiscountTypeForProduct'] = _saleDiscountTypeForProduct;
    map['SaleDiscountTypeDiscountTypeForProduct'] = _saleDiscountTypeDiscountTypeForProduct;
    map['SaleDiscountTypeForFactor'] = _saleDiscountTypeForFactor;
    map['SaleDiscountTypeDiscountTypeForFactor'] = _saleDiscountTypeDiscountTypeForFactor;
    return map;
  }
}
