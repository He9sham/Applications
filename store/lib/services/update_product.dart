import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateproducte(
      {required String title,
      required String price,
      required String description,
      required String image,
      required int id,
      required String category}) async {
    print('priduct id = $id');
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().put(uri: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return ProductModel.fromjson(data);
  }
}
