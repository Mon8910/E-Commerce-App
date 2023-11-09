import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:demo_project/providers/login_provider.dart';
import 'package:demo_project/providers/get_Occaisons_provider.dart';
import 'package:demo_project/providers/logout_provider.dart';
import 'package:demo_project/providers/navigator_bar_providers.dart';
import 'package:demo_project/providers/occaisons_provider.dart';
import 'package:demo_project/providers/prooduct_list.dart';
import 'package:demo_project/providers/product_list_details.dart';
import 'package:demo_project/providers/visiable_password.dart';
import 'package:demo_project/screens/login.dart';
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
        ChangeNotifierProvider(create: (_) => AuthProvider()),
       
        ChangeNotifierProvider(create: (_) => ProductOccaisons()),
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (_) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthLogout(),
        ),
        ChangeNotifierProvider(
          create: (_) => Occaisonsprovider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetOccaisonsprovider(),
        )
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
              nextScreen: const Login())),
    );
  }
}
