import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/passwordVisibility.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
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
  final passwordFocusNode = FocusNode();

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
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when the user taps outside the text fields
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                CustomTextField(
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Enter Your Email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }

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
                Consumer<PasswordVisibilityNotifier>(
                  builder: (context, passwordVisibilityNotifier, child) {
                    return CustomTextField(
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                      obscureText:
                          !passwordVisibilityNotifier.isPassword1Visible,
                      focusNode: passwordFocusNode,
                      hintText: "Enter Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your password";
                        }
                        // if (!passwordRegex.hasMatch(value)) {
                        //   return "Password must contain at least one lowercase letter,\n one uppercase letter, one number, one special character, and be at least 6 characters long.";
                        // }
                        return null;
                      },
                      onTap: () {
                        passwordFocusNode.requestFocus();
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          passwordVisibilityNotifier
                              .togglePassword1Visibility();
                        },
                        child: Icon(
                          passwordVisibilityNotifier.isPassword1Visible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    );
                  },
                ),
                // CustomTextField(
                //   prefixIcon: Icons.lock,
                //   hintText: "Password",
                //   //keyboardType:TextInputType.name,

                //   controller: passwordController,
                //   //obscureText: true,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       // Utils.toastMessage("Please fill Password");
                //       return 'Password cannot be empty';
                //     }
                //     // You can add more password validation logic if needed
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomRoundButton(
                  loading: authViewModel.loading,
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
                    Navigator.pushReplacementNamed(
                        context, RoutesName.signupscreen);
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
      ),
    );
  }
}
