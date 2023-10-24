import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:demo_project/providers/auth_code.dart';
import 'package:demo_project/providers/auth_forgetpassword.dart';
import 'package:demo_project/providers/auth_provider.dart';
import 'package:demo_project/providers/logout_provider.dart';
import 'package:demo_project/providers/navigator_bar_providers.dart';
import 'package:demo_project/providers/product_occaisons.dart';
import 'package:demo_project/providers/product_occaisons_details.dart';
import 'package:demo_project/providers/visiable_password.dart';
import 'package:demo_project/screens/login.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(builder: ((context) {
      return  const MyApp();
      
    }))
     
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Authentication()),
    ChangeNotifierProvider(create: (_) => AuthForgetpassword()),
    ChangeNotifierProvider(create: (_) => AuthCodes()),
    ChangeNotifierProvider(create: (_) => ProductOccaisons()),
    ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
    ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
    ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
    ChangeNotifierProvider(create: (_) => AuthLogout())
   
   ],
   child: MaterialApp(builder: DevicePreview.appBuilder
      ,theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          
          
            seedColor:const Color.fromARGB(255, 255, 255, 255)),
      ),
      
     
      home :AnimatedSplashScreen(
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Theme.of(context).colorScheme.onPrimary
        ,splash: SizedBox(
        width: MediaQuery.sizeOf(context).width*.43,
        height: MediaQuery.sizeOf(context).height*.72,
        child: Image.asset('assets/images/Cadeau logo.png'),
      ), nextScreen:const Login())
    ),);
  }
}