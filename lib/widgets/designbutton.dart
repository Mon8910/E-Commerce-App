import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DesignButton extends StatelessWidget {
  DesignButton({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        side: BorderSide(
            width: 1.5,
            color: const Color.fromARGB(1, 151, 151, 151).withOpacity(1)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.jost(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(1, 151, 151, 151).withOpacity(1)),
      ),
    );
  }
}
