import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const CustomButton(
      {Key? key,
      required this.title,
      this.loading = false,
      required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 100,
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: AppColors.whiteColor,
                  )
                : Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor),
                  )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: AppColors.buttoncolor),
      ),
    );
  }
}
