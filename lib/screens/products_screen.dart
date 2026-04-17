// screens/products_screen.dart
import 'package:first_app/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});
  static List<Map<String, String>> products = [
    {'title': 'Airpods 1', 'image': 'assets/images/airpods.jpg', 'price': '30'},
    {'title': 'Airpods 2', 'image': 'assets/images/airpods.jpg', 'price': '30'},
    {'title': 'Airpods 3', 'image': 'assets/images/airpods.jpg', 'price': '30'},
    {'title': 'Airpods 4', 'image': 'assets/images/airpods.jpg', 'price': '30'},
    {'title': 'Airpods 5', 'image': 'assets/images/airpods.jpg', 'price': '30'},
    {'title': 'Airpods 6', 'image': 'assets/images/airpods.jpg', 'price': '30'},
    {'title': 'Airpods 7', 'image': 'assets/images/airpods.jpg', 'price': '30'},
    {'title': 'Airpods 8', 'image': 'assets/images/airpods.jpg', 'price': '30'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          "Products",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.6 / 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(
                    image: products[index]['image']!,
                    title: products[index]['title']!,
                    price: products[index]['price']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
