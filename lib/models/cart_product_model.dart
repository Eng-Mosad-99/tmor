// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartProductModel {
  final int totalDiscount, totalProductCount, totalPrice;
  final List<ProductItems> productsList;
  CartProductModel({
    required this.totalPrice,
    required this.productsList,
    required this.totalProductCount,
    required this.totalDiscount,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> map) {
    final List<dynamic> subCategoriesJson = map['product_items'] ?? [];
    return CartProductModel(
      totalDiscount: map['total_discount'],
      totalProductCount: map['total_product_count'],
      totalPrice: map['total_price'],
      productsList:
          subCategoriesJson.map((e) => ProductItems.fromJSon(e)).toList(),
    );
  }

  toJson() {
    return {
      'total_discount': totalDiscount,
      'total_product_count': totalProductCount,
      'total_price': totalPrice,
      'product_items': productsList,
    };
  }
}

class ProductItems {
   String id;
   String price;
   String priceBeforeDiscount;
   String numberPiecesAvailable;
   String productWeight;
   String name;
   String img;
   String quantity;
   String cartId;

  ProductItems({
    required this.id,
    required this.price,
    required this.priceBeforeDiscount,
    required this.numberPiecesAvailable,
    required this.productWeight,
    required this.name,
    required this.img,
    required this.quantity,
    required this.cartId,
  });

  factory ProductItems.fromJSon(Map<String, dynamic> map) {
    return ProductItems(
      id: map['id'],
      price: map['price'],
      priceBeforeDiscount: map['price_before_discount'],
      numberPiecesAvailable: map['number_pieces_available'],
      productWeight: map['product_weight'],
      name: map['name'],
      img: map['img'],
      quantity: map['quantity'],
      cartId: map['cart_id'],
    );
  }

  toJson() {
    return {
      'id': id,
      'price': price,
      'price_before_discount': priceBeforeDiscount,
      'number_pieces_available': numberPiecesAvailable,
      'product_weight': productWeight,
      'name': name,
      'img': img,
      'quantity': quantity,
      'cart_id': cartId,
    };
  }
}
