import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 14,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          width: 167,
          height: 64,
          child: Image.asset('assets/images/cadeau.png'),
        ),
        Text(
          'Welcome back ',
          style: GoogleFonts.jost(
              fontSize: 24,
              color: const Color.fromARGB(255, 26, 26, 26),
              fontWeight: FontWeight.w700
              //   fontWeight: FontWeight.bold de hna 3shan

              ),
          textAlign: TextAlign.center,
        ),
        Text(
          'log in ',
          style: GoogleFonts.jost(
              color: const Color.fromARGB(255, 26, 26, 26),
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
