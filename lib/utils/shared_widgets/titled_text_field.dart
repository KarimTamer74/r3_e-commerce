// utils/shared_widgets/titled_text_field.dart
import 'package:flutter/material.dart';

class TitledTextField extends StatefulWidget {
  const TitledTextField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
  });
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<TitledTextField> createState() => _TitledTextFieldState();
}

class _TitledTextFieldState extends State<TitledTextField> {
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
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.title == 'Password' ? isVisable : false,
          decoration: InputDecoration(
            
            suffixIcon: widget.title == 'Password'
                ? IconButton(
                    onPressed: () {
                      isVisable = !isVisable;
                      setState(() {});
                    },
                    icon: Icon(
                      isVisable ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
