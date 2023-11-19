import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordWidgets extends StatelessWidget {
  const ResetPasswordWidgets({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 15,
            height: 16,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(1, 174, 190, 205)),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.check,
              color: Color.fromARGB(1, 174, 190, 205),
              size: 10,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '8 to 20 Character',
            style: GoogleFonts.jost(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(1, 146, 159, 177)),
          )
        ]),
        const SizedBox(
          height: 6,
        ),
        Row(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 15,
            height: 16,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(1, 174, 190, 205)),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.check,
              color: Color.fromARGB(1, 174, 190, 205),
              size: 10,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Letters , numbers and special characters',
            style: GoogleFonts.jost(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(1, 146, 159, 177)),
          )
        ])
      ],
    );
  }
}
