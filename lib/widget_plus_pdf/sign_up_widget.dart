import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupWidget extends StatelessWidget{
  const SignupWidget({super.key,required this.text,required this.icon});
  final String text;
  final Icon icon;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height*.062,
                decoration: BoxDecoration(
                  color:const Color.fromARGB(1, 248, 248, 248).withOpacity(1)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                     icon,
                  const    SizedBox(width: 20,),
                  Text(text,style: GoogleFonts.jost(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1)
                  ),)
                    ],
                  ),
                ),
              ),
              
      ],
    );
  }
}