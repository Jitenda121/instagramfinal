import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/res/component/round_button.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
//import 'package:flutter_application_1/view/new_password_screen.dart';
//import 'package:flutter_application_1/view/otp_screen.dart';
import 'package:flutter_application_1/view_model/viewmodel/custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
 // final token;
  const ForgetPassword({super.key, });

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>(); // Add this line
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  bool isOtpEntered = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel2 = Provider.of<AuthViewModel>(context);
    final authViewModel3 = Provider.of<AuthViewModel>(context);
    final authViewModel4 = Provider.of<AuthViewModel>(context);
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
              Container(child: Lottie.asset(AppImage.forgetpasswordimage)),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                prefixIcon: Icons.email,
                hintText: "Enter Your Email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // CustomRoundButton(
              //     title: "Resend OTP", onPress: () {}),
              CustomRoundButton(
                title: "Send OTP",
                onPress: () {
                  String email = emailController.text.toString().trim();

                  debugPrint(emailController.text.toString().trim());
                  if (email.isNotEmpty) {
                    Map<String, dynamic> data = {
                      "email": email,
                    };

                    authViewModel2.forgetPassword(data, context);
                  }

                  if (_formKey.currentState!.validate()) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      //isDismissible: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0))),
                      builder: (BuildContext context) {
                        return Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .44,
                              width: MediaQuery.of(context).size.width * .9,
                              child: Lottie.asset(AppImage.forgetotp),
                            ),
                            const Icon(
                              Icons.verified,
                              color: Colors.green,
                              size: 38,
                            ),
                            const Text(
                                "Enter OTP Sent To Your Registered Email"),
                            const SizedBox(
                              height: 20,
                            ),
                            Pinput(
                              length: 4,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: otpController,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: CustomRoundButton(
                                      title: "resend ",
                                      onPress: () {
                                        Map data = {
                                          "email":
                                              emailController.text.toString(),
                                        };

                                        authViewModel4.resendOtp(data, context);
                                      }),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 50,
                                  child: CustomRoundButton(
                                      title: "Verify",
                                      onPress: () {
                                        if (otpController.text.isNotEmpty) {
                                          //                 if (_formKey.currentState?.validate() ?? false) {
                                          //   // Form is valid, proceed with signup logic
                                          //   // Implement your signup logic here
                                          //  // Navigator.pushNamed(context, RoutesName.);
                                          // }
                                          // Map data = {
                                          //   "email": emailController.text
                                          //       .toString()
                                          //       .trim(),
                                          //   "otp":
                                          //       otpController.text.toString(),
                                          // };
                                          // authViewModel2.verifyOtp(
                                          //     data, context);

                                          // Navigator.pushNamed(
                                          //     context, RoutesName.reset);
                                          Map data = {
                                            "email":
                                                emailController.text.toString(),
                                            "otp":
                                                otpController.text.toString(),
                                          };
                                          authViewModel3.verifyOtp(
                                              data, context);
                                            // print(data[])
                                              //debugPrint(["data"]["resetpassword"])
                                        } else {
                                          // Show error message indicating OTP is required
                                          Utils.toastMessage("OTP is required");
                                        }
                                      }),
                                ),
                              ],
                            )
                            // Add more widgets as needed for your bottom sheet content
                          ],
                        );
                      },
                    );
                    // AuthViewModel
                    // Map data = {"email": emailController.toString()};
                    // authViewModel2.forgetPasswordApi(data as String, context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
