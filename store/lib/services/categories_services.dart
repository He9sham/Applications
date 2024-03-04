import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> GetCategoriesProduct(
      {required String categorieName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categorieName');

    List<ProductModel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(ProductModel.fromjson(data[i]));
    }

    return productlist;
  }
}
