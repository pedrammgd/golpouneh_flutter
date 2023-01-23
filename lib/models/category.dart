/// Id : 1
/// ParentId : null
/// Title : "سبزیجات"

class CategoryModel {
  CategoryModel({
      int? id, 
      int? parentId,
      String? title,
      String? imageUrl}){
    _id = id;
    _parentId = parentId;
    _title = title;
    _imageUrl = imageUrl;
}

  CategoryModel.fromJson(dynamic json) {
    _id = json['Id'];
    _parentId = json['ParentId'];
    _title = json['Title'];
    _imageUrl = json['ImageUrl'];
  }
  int? _id;
  int? _parentId;
  String? _title;
  String? _imageUrl;

  int? get id => _id;
  int? get parentId => _parentId;
  String? get title => _title;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['ParentId'] = _parentId;
    map['Title'] = _title;
    map['ImageUrl'] = _imageUrl;
    return map;
  }

}