import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
//import 'package:flutter_application_1/view/forget_password.dart';
//import 'package:flutter_application_1/view/sign_up.dart';
//import 'package:flutter_application_1/view_model/widget/auth_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //final authviewmode = Provider.of<AuthViewModel>(context);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    //final authviewmode = Provider.of<AuthViewModel>(context);
    //final authviewmode = Provider<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Lottie.asset(
                AppImage.loginimage,
                width: MediaQuery.of(context).size.height * 1,
                height: MediaQuery.of(context).size.height * .29,
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              // CustomTextField(
              //   hintText: "Enter Your Email",
              //   borderRadius: BorderRadius.circular(20),
              //   icon: Icon(Icons.email),
              //   controller: _emailController,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       // Utils.toastMessage("Please enter your Email");
              //       return 'Email cannot be empty';
              //     }
              //     // You can add more email validation logic if needed
              //     return null;
              //   },
              // ),
              CustomTextField(
                prefixIcon: Icons.email,
                hintText: "Enter Your Email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  // Regular expression for basic email validation
                  // String emailPattern =
                  //     r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(?:\.[a-zA-Z]{2,})?$';
                  // final emailRegex =
                  //     RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                  // RegExp regex = RegExp(emailPattern);
                  final emailRegex =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              CustomTextField(
                prefixIcon: Icons.lock,
                hintText: "Password",

                controller: passwordController,
                //obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // Utils.toastMessage("Please fill Password");
                    return 'Password cannot be empty';
                  }
                  // You can add more password validation logic if needed
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              CustomRoundButton(
                title: "Login",
                onPress: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Map<String, dynamic> data = {
                      //"username": usernameController.text,
                      "email": emailController.text,
                      "password": passwordController.text,
                    };
                    authViewModel.loginApi(data, context);
                    print("api hit");
                    debugPrint(emailController.text);
                    debugPrint(passwordController.text);

                    //authViewModel.logi
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, RoutesName.homepage, (route) => false);
                  }
                  // Form is valid, proceed with login logic
                  // Implement your login logic here
                  // } else if (_emailController.text.isEmpty &&
                  //     _passwordController.text.isEmpty) {
                  //   Utils.toastMessage("Enter credentials");
                  // } else if (_emailController.text.isEmpty) {
                  //   Utils.toastMessage("Enter email");
                  // } else if (_passwordController.text.isEmpty) {
                  //   Utils.toastMessage("Enter password");
                  // } else {
                  //   // Both email and password are provided, proceed to the home page
                  //   // Navigator.pushNamedAndRemoveUntil(
                  //   //     context, RoutesName.homepage, (route) => false);
                  // }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.forgetpassword);
                },
                child: const Text("Forget Password"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .0009,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signupscreen);
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Don't have an account ?",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .018,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: " Sign Up",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .02,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(String email, String password) {
    // Simulating a login request. Replace this with your actual authentication logic.
    // For example, you might call an API endpoint to authenticate the user.

    // In this example, we are using hardcoded email and password for demonstration purposes.
    String validEmail = "user@example.com";
    String validPassword = "password123";

    if (email == validEmail && password == validPassword) {
      // Login successful
      Utils.toastMessage("Login successful!");
      // Navigate to the home screen or perform other actions upon successful login
      // For example:
      // Navigator.pushNamed(context, RoutesName.home);
    } else {
      // Login failed
      Utils.toastMessage("Invalid email or password. Please try again.");
    }
  }
}
