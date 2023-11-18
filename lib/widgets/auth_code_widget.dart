import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthcodeWidgets extends StatelessWidget{
  const AuthcodeWidgets({super.key});
  @override
  Widget build(BuildContext context) {
   return Column(
    children: [
       const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 38,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 148,
                height: 131.91,
                child: Image.asset(
                  'assets/images/message.png',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Code',
                style: GoogleFonts.jost(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(1, 26, 26, 26)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                  'We have sent the code to create \n Your account to mobile number',
                  style: GoogleFonts.jost(
                      color: const Color.fromARGB(1, 26, 26, 26),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 14,
              ),
              Text(
                '01022492218',
                // de l7d ma at3aml m3 el api3shan httb3t mn 5laloh.
                style: GoogleFonts.jost(
                    color: const Color.fromARGB(1, 26, 26, 26),
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
    ],
   );
  }
}