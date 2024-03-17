import 'package:get/get.dart';
import 'package:tmor/models/product_model.dart';

import '../services/api.dart';

class ProductViewModel extends GetxController {
  Future<List<FeaturedProducts>> getAllProducts() async {
    // ignore: missing_required_param
    List<dynamic> data = await API().get(
      action: 'getAllProducts',
      file: 'products.php',
    );

    List<FeaturedProducts> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(FeaturedProducts.fromJson(data[i]));
    }
    return productsList;
  }
}
