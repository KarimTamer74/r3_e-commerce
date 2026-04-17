// screens/login_screen.dart
import 'package:first_app/widgets/auth_header.dart';
import 'package:first_app/widgets/auth_remeber_and_recovery.dart';
import 'package:first_app/widgets/custom_elvated_button.dart';
import 'package:first_app/widgets/custom_text_buton.dart';
import 'package:first_app/widgets/titled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                title: "Hi, Wecome Back! 👋",
                subTitle: "Hello again, you’ve been missed!",
              ),
              SizedBox(height: 51),
              TitledTextField(title: 'Email'),
              SizedBox(height: 20),
              TitledTextField(title: 'Password'),
              SizedBox(height: 20),
              AuthRememberAndRecovery(),
              SizedBox(height: 20),

              CustomElevatedButton(
                title: 'Login',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 2)),
                  Text(
                    "  Or With  ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 2)),
                ],
              ),

              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        spacing: 10,
                        children: [
                          SvgPicture.asset('assets/icons/github.svg'),
                          Text(
                            "Github",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          SvgPicture.asset('assets/icons/gitlab.svg'),
                          Text(
                            "Gitlab",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account ? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextButon(
                    text: "Sign Up",
                    textColor: Color(0xff4E0189),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
