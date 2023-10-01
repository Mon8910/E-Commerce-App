import 'package:flutter/material.dart';

class AuthCode extends StatelessWidget{
  const AuthCode({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back_sharp)),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 0.0,
        )),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body:Center(
          child: Column(
            children: [
              
            ],
          ),
        ) ,
        
    );
  }
}