import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:demo_project/providers/login_provider.dart';
import 'package:demo_project/providers/logout_provider.dart';
import 'package:demo_project/providers/navigator_bar_providers.dart';
import 'package:demo_project/providers/occasions_provider.dart';
import 'package:demo_project/providers/product_details_provider.dart';
import 'package:demo_project/providers/product_provider.dart';
import 'package:demo_project/providers/reset_new_password_provider.dart';
import 'package:demo_project/providers/forget_password_provider.dart';
import 'package:demo_project/providers/show_occasion_types_provider.dart';
import 'package:demo_project/providers/counterdown_provider.dart';
import 'package:demo_project/providers/verify_otp_provider.dart';
import 'package:demo_project/providers/visiable_password.dart';
import 'package:demo_project/screens/login_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(builder: ((context) {
    return const MyApp();
  })));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => LogoutProvider()),
        ChangeNotifierProvider(create: (_) => ResetNewPasswordProvider()),
        ChangeNotifierProvider(create: (_) => VerifyOtpProvider()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordProviders()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(
          create: (_) => OccasionsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShowOccasionsProvider(),
          
        ),ChangeNotifierProvider(create: (_) => CountdownProvider()),
      ],
      child: MaterialApp(
          builder: DevicePreview.appBuilder,
          theme: ThemeData().copyWith(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 255, 255, 255)),
          ),
          home: AnimatedSplashScreen(
              splashIconSize: 500,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              splash: SizedBox(
                width: MediaQuery.sizeOf(context).width * .43,
                height: MediaQuery.sizeOf(context).height * .72,
                child: Image.asset('assets/images/cadeau logo.png'),
              ),
              nextScreen: const LoginScreen())),
    );
  }
}
