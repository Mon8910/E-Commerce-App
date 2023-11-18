import 'package:demo_project/providers/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownWidget extends StatelessWidget{
  const CountDownWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return   Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<CountdownProvider, int>(
                selector: (_, countdownProvider) =>
                    countdownProvider.remainingSeconds,
                builder: (context, remainingSeconds, _) {
                  return Column(
                    children: [
                      remainingSeconds == 0
                          ? InkWell(
                              onTap: () {
                                
                              },
                              child: Text(
                                'Resend code',
                                style: TextStyle(color: Colors.grey[400]),
                              ),
                            )
                          :const SizedBox(),
                    const  SizedBox(height: 20),
                      remainingSeconds != 0 ? Text('$remainingSeconds s') : SizedBox(),
                    ],
                  );
                },
              ),
            ],
          ),
        );
  }
  
}