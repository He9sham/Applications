


import 'package:store/helper/api.dart';

class AllCategories {
  Future<List> GetAllCategories() async {
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories');
   
     
      return data;
    
  }
}
