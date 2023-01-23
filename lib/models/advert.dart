import 'dart:convert';

/// Id : 1
/// AdvertLocationId : 1
/// AdvertTitle : "اسلایدر اول"
/// OpenTarget : 0
/// LinkURL : ""
/// SortOrder : 0
/// ImageURL : "\\{ViewDirectoryName}\\uploads\\advert\\1\\image-1.jpg"
/// VideoURL : "\\{ViewDirectoryName}\\uploads\\advert\\1\\"
/// Text1 : ""
/// Text2 : ""

AdvertModel advertModelFromJson(String str) =>
    AdvertModel.fromJson(json.decode(str));
String advertModelToJson(AdvertModel data) => json.encode(data.toJson());

class AdvertModel {
  AdvertModel({
    int? id,
    int? advertLocationId,
    String? advertTitle,
    int? openTarget,
    String? linkURL,
    int? sortOrder,
    String? imageURL,
    String? videoURL,
    String? text1,
    String? text2,
  }) {
    _id = id;
    _advertLocationId = advertLocationId;
    _advertTitle = advertTitle;
    _openTarget = openTarget;
    _linkURL = linkURL;
    _sortOrder = sortOrder;
    _imageURL = imageURL;
    _videoURL = videoURL;
    _text1 = text1;
    _text2 = text2;
  }

  AdvertModel.fromJson(dynamic json) {
    _id = json['Id'];
    _advertLocationId = json['AdvertLocationId'];
    _advertTitle = json['AdvertTitle'];
    _openTarget = json['OpenTarget'];
    _linkURL = json['LinkURL'];
    _sortOrder = json['SortOrder'];
    _imageURL = json['ImageURL'];
    _videoURL = json['VideoURL'];
    _text1 = json['Text1'];
    _text2 = json['Text2'];
  }
  int? _id;
  int? _advertLocationId;
  String? _advertTitle;
  int? _openTarget;
  String? _linkURL;
  int? _sortOrder;
  String? _imageURL;
  String? _videoURL;
  String? _text1;
  String? _text2;
  AdvertModel copyWith({
    int? id,
    int? advertLocationId,
    String? advertTitle,
    int? openTarget,
    String? linkURL,
    int? sortOrder,
    String? imageURL,
    String? videoURL,
    String? text1,
    String? text2,
  }) =>
      AdvertModel(
        id: id ?? _id,
        advertLocationId: advertLocationId ?? _advertLocationId,
        advertTitle: advertTitle ?? _advertTitle,
        openTarget: openTarget ?? _openTarget,
        linkURL: linkURL ?? _linkURL,
        sortOrder: sortOrder ?? _sortOrder,
        imageURL: imageURL ?? _imageURL,
        videoURL: videoURL ?? _videoURL,
        text1: text1 ?? _text1,
        text2: text2 ?? _text2,
      );
  int? get id => _id;
  int? get advertLocationId => _advertLocationId;
  String? get advertTitle => _advertTitle;
  int? get openTarget => _openTarget;
  String? get linkURL => _linkURL;
  int? get sortOrder => _sortOrder;
  String? get imageURL => _imageURL;
  String? get videoURL => _videoURL;
  String? get text1 => _text1;
  String? get text2 => _text2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['AdvertLocationId'] = _advertLocationId;
    map['AdvertTitle'] = _advertTitle;
    map['OpenTarget'] = _openTarget;
    map['LinkURL'] = _linkURL;
    map['SortOrder'] = _sortOrder;
    map['ImageURL'] = _imageURL;
    map['VideoURL'] = _videoURL;
    map['Text1'] = _text1;
    map['Text2'] = _text2;
    return map;
  }
}
