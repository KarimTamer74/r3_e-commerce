// main.dart
import 'package:first_app/screens/products_screen.dart';
import 'package:first_app/widgets/profile_item_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});
  static List<ProfileItemModel> myItems = [
    ProfileItemModel(title: "Favorites", icon: Icons.favorite_border_outlined),
    ProfileItemModel(title: "Downloads", icon: Icons.location_on_outlined),
    ProfileItemModel(title: "Locations", icon: Icons.map),
    ProfileItemModel(title: "Subscription", icon: Icons.subscript),
    ProfileItemModel(title: "Display", icon: Icons.smart_display_outlined),
    ProfileItemModel(title: "Clean Cache", icon: Icons.cached_outlined),
    ProfileItemModel(title: "Clean Cache", icon: Icons.cached_outlined),
    ProfileItemModel(title: "Clean Cache", icon: Icons.cached_outlined),
    ProfileItemModel(title: "Clean Cache", icon: Icons.cached_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsScreen(),
    );
  }
}
//* Tree
//* GridView ( Product Item )
//* GridView.builder - Steps ( Item => .builder => model => List )
//* Product Details