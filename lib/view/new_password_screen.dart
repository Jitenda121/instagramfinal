import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
//import 'package:flutter_application_1/view/login_screen.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
 // final String token;
  //String token = '';
  //String token = '';
  ChangePasswordScreen({
    super.key, 
  });

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  dynamic confirmPass;
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("Assets/animation_lnqb8lc4.json"),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  prefixIcon: Icons.password,
                  hintText: "Enter New Password",
                  controller: password,
                  //debug
                  validator: (value) {
                    confirmPass = value;
                    //debugPrint(password.text);
                    //debugPrint("fhbf");
                    //debugPrint(value);
                    //debugPrint("122");
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                prefixIcon: Icons.password,
                hintText: "Confirm Password",
                controller: confirmPassword,
                validator: (value) {
                  // debugPrint(value);
                  //debugPrint(password.text);
                  //debugPrint(confirmPassword.text);
                  //debugPrint(confirmPass);

                  if (value == null || value.isEmpty) {
                    return "Confirm Password cannot be empty";
                  }
                  if (value != confirmPass) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomRoundButton(
                title: "Reset Password ",
                // onPress: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (builder) => LoginScreen()));
                // }
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    // Passwords are valid, proceed with reset logic

                    // Navigator.pushNamed(context, RoutesName.loginscreen);
                    String newpassword = password.text.toString().trim();
                    authViewModel.resetPassword(newpassword, context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
