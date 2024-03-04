import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
   String? ProductName, image, dec;
    String? price;
  StoreCubit() : super(StoreInitial());
 
Future<ProductModel> someMethod(BuildContext context) async {
  // Now context is available here
  ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
  // Perform any necessary modifications to the product object here
  return product; // Return the modified or retrieved ProductModel object
}
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
   Future<void> UpdateProductService(ProductModel product) async {
    
    await UpdateProduct().updateproducte(
        id: product.id,
        title: ProductName == null ? product.title : ProductName!,
        price: price == null ? product.price.toString() : price!,
        description: dec == null ? product.description : dec!,
        image: image == null ? product.image : image!,
        category: product.category);
  }


}
