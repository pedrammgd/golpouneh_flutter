import 'dart:convert';
import 'profile.dart';

/// UserIdentityId : "73131500-d892-4b32-ba65-1f09e01f5257"
/// UserIdentity : {"Id":"73131500-d892-4b32-ba65-1f09e01f5257","ForgetPasswordId":null,"AccessFailedCount":0}
/// PublishDate : "2022-02-08T00:00:00"
/// Title : "پیام انگیزشی "
/// BlogArticleURL : "پیام های انگیزشی "
/// RefrenceTitle : ""
/// RefrenceUrl : ""
/// Intro : "<p dir=\"rtl\">برات آرزو می کنم خدا سرنوشتت رو انقدر قشنگ بنویسه که مادرت از ته دل بخنده&nbsp;</p>\r\n"
/// Description : ""
/// ImageURL : "روش-های-موثر-جذب-انرژی-مثبت-600x600.jpg"
/// VideoURL : "جمعه کم حجم.mp4"
/// VideoLink : ""
/// RegisterDate : "2022-02-08T10:58:23.1380004"
/// VisitCounter : 0
/// SortOrder : 1
/// Status : 1
/// Id : 2160

BlogArticleModel blogArticleModelFromJson(String str) => BlogArticleModel.fromJson(json.decode(str));
String blogArticleModelToJson(BlogArticleModel data) => json.encode(data.toJson());

class BlogArticleModel {
  BlogArticleModel({
    String? userIdentityId,
    ProfileModel? userIdentity,
    String? publishDate,
    String? title,
    String? blogArticleURL,
    String? refrenceTitle,
    String? refrenceUrl,
    String? intro,
    String? description,
    String? imageURL,
    String? videoURL,
    String? videoLink,
    String? registerDate,
    int? visitCounter,
    int? sortOrder,
    int? status,
    int? id,
  }) {
    _userIdentityId = userIdentityId;
    _userIdentity = userIdentity;
    _publishDate = publishDate;
    _title = title;
    _blogArticleURL = blogArticleURL;
    _refrenceTitle = refrenceTitle;
    _refrenceUrl = refrenceUrl;
    _intro = intro;
    _description = description;
    _imageURL = imageURL;
    _videoURL = videoURL;
    _videoLink = videoLink;
    _registerDate = registerDate;
    _visitCounter = visitCounter;
    _sortOrder = sortOrder;
    _status = status;
    _id = id;
  }

  BlogArticleModel.fromJson(dynamic json) {
    _userIdentityId = json['UserIdentityId'];
    _userIdentity = json['UserIdentity'] != null ? ProfileModel.fromJson(json['UserIdentity']) : null;
    _publishDate = json['PublishDate'];
    _title = json['Title'];
    _blogArticleURL = json['BlogArticleURL'];
    _refrenceTitle = json['RefrenceTitle'];
    _refrenceUrl = json['RefrenceUrl'];
    _intro = json['Intro'];
    _description = json['Description'];
    _imageURL = json['ImageURL'];
    _videoURL = json['VideoURL'];
    _videoLink = json['VideoLink'];
    _registerDate = json['RegisterDate'];
    _visitCounter = json['VisitCounter'];
    _sortOrder = json['SortOrder'];
    _status = json['Status'];
    _id = json['Id'];
  }
  String? _userIdentityId;
  ProfileModel? _userIdentity;
  String? _publishDate;
  String? _title;
  String? _blogArticleURL;
  String? _refrenceTitle;
  String? _refrenceUrl;
  String? _intro;
  String? _description;
  String? _imageURL;
  String? _videoURL;
  String? _videoLink;
  String? _registerDate;
  int? _visitCounter;
  int? _sortOrder;
  int? _status;
  int? _id;
  BlogArticleModel copyWith({
    String? userIdentityId,
    ProfileModel? userIdentity,
    String? publishDate,
    String? title,
    String? blogArticleURL,
    String? refrenceTitle,
    String? refrenceUrl,
    String? intro,
    String? description,
    String? imageURL,
    String? videoURL,
    String? videoLink,
    String? registerDate,
    int? visitCounter,
    int? sortOrder,
    int? status,
    int? id,
  }) =>
      BlogArticleModel(
        userIdentityId: userIdentityId ?? _userIdentityId,
        userIdentity: userIdentity ?? _userIdentity,
        publishDate: publishDate ?? _publishDate,
        title: title ?? _title,
        blogArticleURL: blogArticleURL ?? _blogArticleURL,
        refrenceTitle: refrenceTitle ?? _refrenceTitle,
        refrenceUrl: refrenceUrl ?? _refrenceUrl,
        intro: intro ?? _intro,
        description: description ?? _description,
        imageURL: imageURL ?? _imageURL,
        videoURL: videoURL ?? _videoURL,
        videoLink: videoLink ?? _videoLink,
        registerDate: registerDate ?? _registerDate,
        visitCounter: visitCounter ?? _visitCounter,
        sortOrder: sortOrder ?? _sortOrder,
        status: status ?? _status,
        id: id ?? _id,
      );
  String? get userIdentityId => _userIdentityId;
  ProfileModel? get userIdentity => _userIdentity;
  String? get publishDate => _publishDate;
  String? get title => _title;
  String? get blogArticleURL => _blogArticleURL;
  String? get refrenceTitle => _refrenceTitle;
  String? get refrenceUrl => _refrenceUrl;
  String? get intro => _intro;
  String? get description => _description;
  String? get imageURL => _imageURL;
  String? get videoURL => _videoURL;
  String? get videoLink => _videoLink;
  String? get registerDate => _registerDate;
  int? get visitCounter => _visitCounter;
  int? get sortOrder => _sortOrder;
  int? get status => _status;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserIdentityId'] = _userIdentityId;
    if (_userIdentity != null) {
      map['UserIdentity'] = _userIdentity?.toJson();
    }
    map['PublishDate'] = _publishDate;
    map['Title'] = _title;
    map['BlogArticleURL'] = _blogArticleURL;
    map['RefrenceTitle'] = _refrenceTitle;
    map['RefrenceUrl'] = _refrenceUrl;
    map['Intro'] = _intro;
    map['Description'] = _description;
    map['ImageURL'] = _imageURL;
    map['VideoURL'] = _videoURL;
    map['VideoLink'] = _videoLink;
    map['RegisterDate'] = _registerDate;
    map['VisitCounter'] = _visitCounter;
    map['SortOrder'] = _sortOrder;
    map['Status'] = _status;
    map['Id'] = _id;
    return map;
  }
}
