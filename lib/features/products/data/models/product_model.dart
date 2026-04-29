// models/product_model.dart
class ProductModel {
  final String imageUrl, title, desc;
  final int price, id;
  final List<dynamic> images;
  ProductModel({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.desc,
    required this.id,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      imageUrl: json['category']['image'],
      title: json['title'],
      price: json['price'],
      desc: json['description'],
      images: json['images'],
    );
  }
}
