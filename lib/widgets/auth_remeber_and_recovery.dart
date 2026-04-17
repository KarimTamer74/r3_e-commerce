// widgets/auth_remeber_and_recovery.dart
import 'package:first_app/widgets/custom_text_buton.dart';
import 'package:flutter/material.dart';

class AuthRememberAndRecovery extends StatefulWidget {
  const AuthRememberAndRecovery({super.key});

  @override
  State<AuthRememberAndRecovery> createState() =>
      _AuthRememberAndRecoveryState();
}

class _AuthRememberAndRecoveryState extends State<AuthRememberAndRecovery> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30,
          height: 30,

          child: Checkbox(
            checkColor: Colors.deepPurple,
            activeColor: Colors.white,
            side: BorderSide(color: Colors.white),
            value: isChecked,
            onChanged: (newVal) {
              isChecked = newVal;
              setState(() {});
            },
          ),
        ),
        SizedBox(width: 8),
        TextButton(
          onPressed: () {
            isChecked = !isChecked!;
            setState(() {});
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text(
            'Remember Me',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Spacer(),
        CustomTextButon(
          text: 'Forget Password',
          textColor: Colors.red,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Scaffold(body: Text("Forget Pass"));
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
