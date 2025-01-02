import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategorieServices {
  Future<List<ProductModel>> getAllProducts(
      {required String categorieName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categorieName');

    List<ProductModel> productList = [];
    for (var i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
