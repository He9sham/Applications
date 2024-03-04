class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String image;
  final String description;
  final String category;
  final Rating rate;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
    required this.rate,
  });

 factory ProductModel.fromjson(Map<String, dynamic> jsonData) {
  return ProductModel(
    id: jsonData.containsKey('id') ? int.parse(jsonData['id'].toString()) :  0,
    title: jsonData.containsKey('title') ? jsonData['title'] : '',
    price: jsonData.containsKey('price') ? double.parse(jsonData['price'].toString()) :  0.0,
    image: jsonData.containsKey('image') ? jsonData['image'] : '',
    category: jsonData.containsKey('category') ? jsonData['category'] : '',
    description: jsonData.containsKey('description') ? jsonData['description'] : '',
    rate: jsonData.containsKey('rating') ? Rating.fromjson(jsonData['rating']) : Rating(rate:  0.0, count:  0),
  );
}
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

 factory Rating.fromjson(Map<String, dynamic> jsonData) {
  return Rating(
    rate: jsonData.containsKey('rate') ? double.parse(jsonData['rate'].toString()) :  0.0,
    count: jsonData.containsKey('count') ? int.parse(jsonData['count'].toString()) :  0,
  );
}
}
