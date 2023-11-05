import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/res/component/app_images.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
import 'package:flutter_application_1/view_model/viewmodel/custombutton.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTP extends StatefulWidget {
  final String userEmail;
  const OTP({super.key, required this.userEmail});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otpEditingController = TextEditingController();
  final int pinLength = 4;
  final _formKey = GlobalKey<FormState>();
  final otpController = TextEditingController(); // Set the expected PIN length

  @override
  Widget build(BuildContext context) {
    debugPrint("--------------------------\n${widget.userEmail}");
    final authViewModel1 = Provider.of<AuthViewModel>(context);
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace this with your Lottie animation
              Container(child: Lottie.asset(AppImage.otpimage)),
              Pinput(
                length: 4,
                autofocus: true,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: otpController,
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: 50,
                      width: 150,
                      child: CustomButton(
                          title: "resent otp",
                          onPress: () {
                            Map data = {
                              "email": widget.userEmail,
                            };
                            authViewModel1.resendOtp(data, context);
                          })),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: CustomButton(
                      loading: authViewModel1.loading,
                      title: "Verify",
                      onPress: () {
                        debugPrint(otpController.text);
                        if (otpController.text.isNotEmpty) {
                          // Map data={

                          // }

                          Map data = {
                            "email": widget.userEmail,
                            "otp": otpController.text.toString(),
                          };
                          authViewModel1.verifyOtp1(data, context);

                          // Navigator.pushNamed(context, RoutesName.login);
                        }
                        if (otpController.text.isEmpty) {
                          Utils.toastMessage("Please Enter Your Otp");
                        }
                        if (isOTPValid(otpController.text)) {
                          // OTP is valid
                          // Continue with your logic
                        } else {
                          // OTP is invalid, clear the input fields
                          otpEditingController.clear();
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Replace this function with your OTP validation logic
  bool isOTPValid(String otp) {
    // Example: Check if OTP is "1234"
    return otp == '1234';
    //== '1234';
  }
}
