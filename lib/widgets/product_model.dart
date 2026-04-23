// widgets/product_model.dart
class ProductModel {
  final String imageUrl, title,desc;
  final int price,id;
  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.desc
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      imageUrl: json['category']['image'],
      title: json['title'],
      price: json['price'],
      desc: json['description']
    );
  }
}
