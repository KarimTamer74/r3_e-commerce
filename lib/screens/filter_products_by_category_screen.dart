// screens/filter_products_by_category_screen.dart
import 'package:dio/dio.dart';
import 'package:first_app/widgets/product_item.dart';
import 'package:first_app/widgets/product_model.dart';
import 'package:flutter/material.dart';

class FilterProductsByCategoryScreen extends StatefulWidget {
  const FilterProductsByCategoryScreen({super.key, required this.name});
  final String name;
  @override
  State<FilterProductsByCategoryScreen> createState() =>
      _FilterProductsByCategoryScreenState();
}

class _FilterProductsByCategoryScreenState
    extends State<FilterProductsByCategoryScreen> {
  List<ProductModel> productsFiltered = [];

  @override
  void initState() {
    super.initState();
    filterProductsByCat(name: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${widget.name}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: productsFiltered.isEmpty
              ? Center(child: Text('No Products Found'))
              : GridView.builder(
                  itemCount: productsFiltered.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.6 / 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(product: productsFiltered[index]);
                  },
                ),
        ),
      ),
    );
  }

  final Dio dio = Dio();

  Future<void> filterProductsByCat({required String name}) async {
    final Response response = await dio.get(
      'https://api.escuelajs.co/api/v1/products/?categorySlug=$name',
    );

    for (var element in response.data) {
      final ProductModel product = ProductModel.fromJson(element);
      productsFiltered.add(product);
    }
    setState(() {});
  }
}
