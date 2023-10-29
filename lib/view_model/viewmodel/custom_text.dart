
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 final String? label;
 final TextEditingController controller;
 final TextInputType keyboardType;
 final IconData prefixIcon;
 final Widget? suffixIcon;
 final VoidCallback? onTap;
 final bool obscureText;
 final FocusNode? focusNode;
 final String? hintText;
 final Function(String)? onChanged;
 final Function(String)? onSubmitted;
 final String? Function(String?)? validator;
 final TextInputAction textInputAction;

 const CustomTextField({
 super.key,
 this.hintText,
 this.label,
 required this.controller,
 this.keyboardType = TextInputType.text,
 required this.prefixIcon,
 this.obscureText = false,
 this.onChanged,
 this.onSubmitted,
 this.validator,
 this.textInputAction = TextInputAction.next,
 this.focusNode,
 this.onTap,
 this.suffixIcon,
 });

 @override
 Widget build(BuildContext context) {
 return TextFormField(
 controller: controller,
 keyboardType: keyboardType,
 obscureText: obscureText,
 onChanged: onChanged,
 focusNode: focusNode,
 onFieldSubmitted: onSubmitted,
 decoration: InputDecoration(
 labelText: label,
 hintText: hintText,
 suffixIcon: suffixIcon,
 prefixIcon: Icon(prefixIcon),
 border: OutlineInputBorder(
 borderRadius: BorderRadius.circular(25),
 ),
 ),
 onTap: onTap,
 validator: validator,
 textInputAction: textInputAction,
 );
 }
}