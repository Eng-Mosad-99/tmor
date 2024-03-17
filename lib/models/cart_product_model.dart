class CartProductModel {
  final String image, name, price, productId;
  int quantity;

  CartProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> map) {
    return CartProductModel(
      image: map['image'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      productId: map['productId'],
    );
  }

  toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
