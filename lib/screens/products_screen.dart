// screens/products_screen.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_app/widgets/product_item.dart';
import 'package:first_app/widgets/product_model.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  @override
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> products = [];
  List<dynamic> categories = [];
  @override
  void initState() {
    super.initState();
    getCategoryData();
    getProducts();
  }

  Future<void> getCategoryData() async {
    final response = await dio.get(
      'https://api.escuelajs.co/api/v1/categories',
    );
    log(response.toString());
    categories = response.data;
    setState(() {});
  }

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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            categories[index]['image'],
                          ),
                        ),

                        Center(
                          child: Text(
                            categories[index]['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.6 / 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Dio dio = Dio();
  Future<void> getProducts() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/products');
    for (var element in response.data) {
      products.add(ProductModel.fromJson(element));
    }
    setState(() {});
  }
}
