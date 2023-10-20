import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/sign_up.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/respository/auth_respository.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
//import 'package:flutter_application_1/view/login_screen.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';
import 'package:flutter_application_1/view_model/viewmodel/make_apirequest.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>(); // Add this line

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    //final authProvider = Provider.of<AuthProvider1>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        // Wrap your content with Form widget and provide the key
        key: _formKey, // Assign the key to the Form widget
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Lottie.asset(
                AppImage.signupimage,
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .7,
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              CustomTextField(
                hintText: "Enter Username",
                controller: usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Username cannot be empty";
                  }
                  return null;
                },
                prefixIcon: Icons.account_box,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .015,
              ),
              CustomTextField(
                hintText: "Enter Your Email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  return null;
                  // Add email validation logic here
                },
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .013,
              ),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password cannot be empty";
                  }
                  return null;
                  // return null;
                  // Add password validation logic here
                },
                prefixIcon: Icons.lock,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .010,
              ),
              CustomRoundButton(
                loading: authViewModel.signuploading,
                title: "Sign Up",
                onPress: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Map data = {
                      "username": usernameController.text,
                      "email": emailController.text,
                      "password": passwordController.text,
                    };

                    authViewModel.signupApi(data, context);
                    print("api hit");
                    debugPrint(emailController.text);
                    Navigator.pushNamed(context, RoutesName.otp,arguments: emailController.text,);
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .020,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Already have an account ?",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .018,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: " Login",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .02,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
