// import 'package:flutter/material.dart';

// class CustomTextField extends StatefulWidget {
//   final String hintText;
//   final BorderRadius borderRadius;
//   final Color? borderColor;
//   final TextEditingController controller;
//   final Function(String)? onTextChanged;
//   final String? Function(String?)? validator;
//   final Icon? icon;
//   final FocusNode? nextFocus;
//   final TextInputAction textInputAction;
//   final TextInputType keyboardType;

//   // Add nextFocus parameter

//   const CustomTextField({
//     Key? key,
//     required this.hintText,
//     required this.borderRadius,
//     this.borderColor,
//     this.onTextChanged,
//     this.validator,
//     required this.icon,
//     this.nextFocus,
//     required this.controller,
//     this.textInputAction = TextInputAction.next,
//     this.keyboardType = TextInputType.text, // Pass the nextFocus parameter
//   }) : super(key: key);

//   @override
//   CustomTextFieldState createState() => CustomTextFieldState();
// }

// class CustomTextFieldState extends State<CustomTextField> {
//   late TextEditingController _textEditingController;
//   late FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _textEditingController = TextEditingController();
//     _focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: _textEditingController,
//       focusNode: _focusNode,
//       keyboardType: widget.keyboardType,
//       maxLength: 100,
//       onChanged: widget.onTextChanged,
//       validator: widget.validator,
//       inputFormatters: [],
//       onFieldSubmitted: (String value) {
//         // Move to the next field if nextFocus is provided
//         if (widget.nextFocus != null) {
//           FocusScope.of(context).requestFocus(widget.nextFocus);
//         }
//       },
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         prefixIcon: widget.icon,
//         border: OutlineInputBorder(
//           borderRadius: widget.borderRadius,
//           borderSide: BorderSide(
//             width: 2.0,
//           ),
//         ),
//         labelStyle: TextStyle(
//           color: _focusNode.hasFocus || _textEditingController.text.isNotEmpty
//               ? Theme.of(context).primaryColor
//               : Colors.blue,
//         ),
//         contentPadding: EdgeInsets.only(top: 35.0),
//         counterText: '',
//       ),
//       textInputAction: widget.textInputAction,
//     );
//   }
// }



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