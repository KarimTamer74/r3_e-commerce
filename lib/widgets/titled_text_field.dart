// titled_text_field.dart
import 'package:flutter/material.dart';

class TitledTextField extends StatefulWidget {
  const TitledTextField({super.key, required this.title});
  final String title;

  @override
  State<TitledTextField> createState() => _TitledTextFieldState();
}

class _TitledTextFieldState extends State<TitledTextField> {
  final TextEditingController myController = TextEditingController();
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff4E0189),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: isVisable,
          controller: myController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                isVisable = !isVisable;
                setState(() {});
              },
              icon: Icon(Icons.visibility),
            ),
            hintText: 'Please Enter Your ${widget.title}',
            hintStyle: TextStyle(fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.deepPurpleAccent),
            ),
          ),
        ),
      ],
    );
  }
}
