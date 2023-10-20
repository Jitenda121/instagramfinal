import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/auth_provider.dart';
import 'package:flutter_application_1/provider/imagedelete.dart';
import 'package:flutter_application_1/provider/sign_up.dart';
import 'package:flutter_application_1/utils/routes/routes.dart';
import 'package:flutter_application_1/utils/routes/routes_name.dart';
import 'package:flutter_application_1/view/complete_profile.dart';
import 'package:flutter_application_1/view/forget_password.dart';
//import 'package:flutter_application_1/view/forget_password.dart';

import 'package:flutter_application_1/view/homepage.dart';
import 'package:flutter_application_1/view/login_screen.dart';
import 'package:flutter_application_1/view/new_password_screen.dart';
import 'package:flutter_application_1/view/otp_screen.dart';
import 'package:flutter_application_1/view/sign_up.dart';
import 'package:flutter_application_1/view_model/viewmodel/auth_view_model.dart';
//import 'package:flutter_application_1/view/login_screen.dart';
//import 'package:flutter_application_1/view/otp_screen.dart';
//import 'package:flutter_application_1/view/owner_profile.dart';
//import 'package:flutter_application_1/view/search_page.dart';
//import 'package:flutter_application_1/view/sign_up.dart';
//import 'package:flutter_application_1/view/splash_screen.dart';
//import 'package:flutter_application_1/view/tutorial1.dart';

import 'package:provider/provider.dart';

late Size mq;
void main() {
  //late Size mq;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => CountProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => ExampleTwoProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => SignUpScreen(),
        // ),

        ChangeNotifierProvider(create: (context) => ImageProviderModel()),
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider1(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          onGenerateRoute: Routes.MaterialPageRoutegenerateRoute),
    );
    // return MaterialApp(
    //   home: CountExample(),
    // );
  }
}
