// features/auth/presentation/screens/login_screen.dart

import 'dart:developer';

import 'package:first_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:first_app/features/auth/presentation/cubits/auth_states.dart';
import 'package:first_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:first_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:first_app/features/auth/presentation/widgets/auth_remeber_and_recovery.dart';
import 'package:first_app/features/products/presentation/cubits/categories_cubit.dart/categories_cubit.dart';
import 'package:first_app/features/products/presentation/screens/products_screen.dart';
import 'package:first_app/utils/shared_widgets/custom_elvated_button.dart';
import 'package:first_app/utils/shared_widgets/custom_text_buton.dart';
import 'package:first_app/utils/shared_widgets/titled_text_field.dart';
import 'package:first_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> myKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 40),
          child: SingleChildScrollView(
            child: Form(
              key: myKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(
                    title: "Hi, Wecome Back! 👋",
                    subTitle: "Hello again, you’ve been missed!",
                  ),
                  SizedBox(height: 51),
                  TitledTextField(
                    title: 'Email',
                    controller: emailController,
                    validator: (emailVal) {
                      return Validator.validateEmail(emailVal ?? '');
                    },
                  ),
                  SizedBox(height: 20),
                  TitledTextField(
                    title: 'Password',
                    controller: passwordController,
                    validator: (passVal) {
                      return Validator.validatePassword(passVal ?? '');
                    },
                  ),
                  SizedBox(height: 20),
                  AuthRememberAndRecovery(),
                  SizedBox(height: 20),

                  BlocConsumer<AuthCubit, AuthStates>(
                    listener: (context, state) {
                      if (state is LoginLoadingState) {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return Center(child: CircularProgressIndicator());
                        //   },
                        // );
                      } else if (state is LoginFailureState) {
                        // Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Failure"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        log("Failure", name: 'UI');
                      } else if (state is LoginSuccessState) {
                        // Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Success"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => CategoriesCubit(),
                              child: ProductsScreen(),
                            ),
                          ),
                        );
                        log('Success', name: 'UI');
                      }
                    },

                    builder: (context, state) {
                      return state is LoginLoadingState
                          ? ElevatedButton(
                              onPressed: () {},
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : CustomElevatedButton(
                              title: 'Login',
                              onPressed: () async {
                                if (myKey.currentState!.validate()) {
                                  log(
                                    "Email: ${emailController.text}, Password: ${passwordController.text}",
                                  );
                                  await BlocProvider.of<AuthCubit>(
                                    context,
                                  ).login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            );
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 2),
                      ),
                      Text(
                        "  Or With  ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.grey, thickness: 2),
                      ),
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
