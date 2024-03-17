// ignore_for_file: public_member_api_docs, sort_constructors_first
class LatestPRoductModel {
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

  LatestPRoductModel({
    required this.id,
    required this.views,
    required this.likes,
    required this.categoryId,
    required this.price,
    required this.priceBeforeDiscount,
    required this.numberPiecesAvailable,
    required this.productWeight,
    required this.name,
    required this.description,
    required this.quantity,
    required this.image,
  });

  factory LatestPRoductModel.fromJson(Map<String, dynamic> map) {
    return LatestPRoductModel(
      id: map['id'],
      views: map['views'],
      likes: map['likes'],
      categoryId: map['category_id'],
      price: map['price'],
      priceBeforeDiscount: map['price_before_discount'],
      numberPiecesAvailable: map['number_pieces_available'],
      productWeight: map['product_weight'],
      name: map['name'],
      description: map['description'],
      quantity: map['quantity'],
      image: map['img'],
    );
  }

  toJson() {
    return {
      'id': id,
      'views': views,
      'likes': likes,
      'category_id': categoryId,
      'price': price,
      'price_before_discount': priceBeforeDiscount,
      'number_pieces_available': numberPiecesAvailable,
      'product_weight': productWeight,
      'name': name,
      'description': description,
      'quantity': quantity,
      'img': image,
    };
  }
}
