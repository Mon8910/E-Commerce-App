import 'package:demo_project/screens/login.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';




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

    return MaterialApp(builder: DevicePreview.appBuilder
      ,theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          
            seedColor:const Color.fromARGB(255, 255, 255, 255)),
      ),
      
     
      home: Login()
    );
  }
}