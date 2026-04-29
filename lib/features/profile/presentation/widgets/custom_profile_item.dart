// custom_profile_item.dart
import 'package:flutter/material.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 30),
        SizedBox(width: 44),
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Spacer(),

        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right, size: 30)),
      ],
    );
  }
}
