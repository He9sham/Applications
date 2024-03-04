// ignore_for_file: missing_required_param

import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class ProductServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    

    List<ProductModel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(
          ProductModel.fromjson(data[i]),
      );
    }
    return productlist;
  }
}