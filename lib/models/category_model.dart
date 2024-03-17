// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoriesModel {
  final String id;
  final String img;
  final String name;
  final List<SubcategoryModel>? subCategories;
  CategoriesModel({
    required this.id,
    required this.img,
    required this.name,
    required this.subCategories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> map) {
    final List<dynamic> subCategoriesJson = map['sub_categories'] ?? [];
    return CategoriesModel(
      id: map["id"],
      img: map["img"],
      name: map["name"],
      subCategories:
          subCategoriesJson.map((e) => SubcategoryModel.fromJson(e)).toList(),
    );
  }

  toJson() {
    return {
      'id': id,
      'img': img,
      'name': name,
      'sub_categories': subCategories,
    };
  }
}

class SubcategoryModel {
  final String id;
  final String img;
  final String name;
  final String subCategories;

  SubcategoryModel({
    required this.id,
    required this.img,
    required this.name,
    required this.subCategories,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> map) {
    return SubcategoryModel(
      id: map['id'],
      img: map['img'],
      name: map['name'],
      subCategories: map['sub_categories'].toString(),
    );
  }

  toJson() {
    return {
      'id': id,
      'img': img,
      'name': name,
      'sub_categories': subCategories,
    };
  }
}
