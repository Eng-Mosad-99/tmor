// ignore_for_file: public_member_api_docs, sort_constructors_first

class FeaturedProducts {
  final String id;
  final String views;
  final String likes;
  final String categoryId;
  final String price;
  final String priceBeforeDiscount;
  final String numberPiecesAvailable;
  final String productWeight;
  final String name;
  final String description;
  final String quantity;
  final String image;

  FeaturedProducts({
    required this.id,
    required this.views,
    required this.likes,
    required this.image,
    required this.categoryId,
    required this.price,
    required this.priceBeforeDiscount,
    required this.numberPiecesAvailable,
    required this.productWeight,
    required this.name,
    required this.description,
    required this.quantity,
  });

  factory FeaturedProducts.fromJson(Map<String, dynamic> map) {
    return FeaturedProducts(
      id: map['id'],
      categoryId: map['category_id'],
      price: map['price'],
      priceBeforeDiscount: map['price_before_discount'],
      numberPiecesAvailable: map['number_pieces_available'],
      productWeight: map['product_weight'],
      name: map['name'],
      description: map['description'],
      quantity: map['quantity'] ?? '',
      image: map['img'],
      likes: map['likes'],
      views: map['views'],
    );
  }

  toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'price': price,
      'price_before_discount': priceBeforeDiscount,
      'number_pieces_available': numberPiecesAvailable,
      'product_weight': productWeight,
      'name': name,
      'description': description,
      'quantity': quantity,
      'img': image,
      'likes': likes,
      'views': views,
    };
  }
}

class CategoryProduct {
  final String id;
  final String name;
  final List<FeaturedProducts> productsList;

  CategoryProduct({
    required this.id,
    required this.name,
    required this.productsList,
  });

  factory CategoryProduct.fromJson(Map<String, dynamic> map) {
    final List<dynamic> subCategoriesJson = map['products'] ?? [];

    return CategoryProduct(
      id: map['id'],
      name: map['name'],
      productsList:
          subCategoriesJson.map((e) => FeaturedProducts.fromJson(e)).toList(),
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'products': productsList,
    };
  }
}
