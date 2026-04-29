// features/products/presentation/screens/add_product_screen.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_app/utils/shared_widgets/custom_elvated_button.dart';
import 'package:first_app/utils/shared_widgets/titled_text_field.dart';
import 'package:first_app/features/products/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    priceController.dispose();
    descController.dispose();
  }

  final Dio dio = Dio();
  Future<void> addProduct() async {
    try {
      final Response response = await dio.post(
        'https://api.escuelajs.co/api/v1/products/',
        data: {
          "title": titleController.text,
          "price": priceController.text,
          "description": descController.text,
          "categoryId": 2,
          "images": ["https://placehold.co/600x400"],
        },
      );
      log("Response: ${response.data}, Status Code: ${response.statusCode}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Add product Success"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductsScreen()),
      );
    } on DioException catch (e) {
      log("Error: ${e.response?.data ?? 'Failure'}");
      var errorMessage = e.response?.data['message'];
      String message = '';
      if (errorMessage is List) {
        for (var element in errorMessage) {
          message += '$element \n';
        }
      } else {
        message = errorMessage;
      }
      log(message);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } on Exception catch (e) {
      log("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            spacing: 20,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    TitledTextField(
                      title: "Title",
                      controller: titleController,
                    ),
                    TitledTextField(
                      title: "Price",
                      controller: priceController,
                    ),
                    TitledTextField(
                      title: "Description",
                      controller: descController,
                    ),

                    SizedBox(height: 100),
                  ],
                ),
              ),

              CustomElevatedButton(
                title: 'Add Product',
                onPressed: () async {
                  await addProduct();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
