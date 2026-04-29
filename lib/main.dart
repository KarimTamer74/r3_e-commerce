// main.dart
import 'package:first_app/features/products/presentation/cubits/categories_cubit.dart/categories_cubit.dart';
import 'package:first_app/features/products/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CategoriesCubit(),
        child: ProductsScreen(),
      ),
    );
  }
}
