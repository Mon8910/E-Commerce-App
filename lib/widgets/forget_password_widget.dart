import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordWidget extends StatelessWidget{
  const ForgetPasswordWidget({super.key});
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
              width: 66,
              height: 76,
              child: Image.asset('assets/images/group.png'),
            ),
            Text(
              'Forget Password',
              style: GoogleFonts.jost(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                 color:const Color.fromARGB(255, 26, 26, 26)
              ),
              textAlign: TextAlign.center,
            ),
            Text('Enter phone number to receive \n code on it',
                style:
                    GoogleFonts.jost(fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color:const Color.fromARGB(255, 146, 159, 177)
                    ),
                textAlign: TextAlign.center),
                const SizedBox(
                  height: 80,
                ),
      ],
    );
  }
}