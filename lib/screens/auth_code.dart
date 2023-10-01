import 'package:demo_project/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class AuthCode extends StatelessWidget {
  const AuthCode({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_sharp)),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0.0,
      )),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  'assets/images/Message.png',
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
                    color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                  'We have sent the code to create \n Your account to mobile number',
                  style: GoogleFonts.jost(
                      color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
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
                    color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              Form(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 6,
                    onCompleted: (value) {
                      
                    },
                    defaultPinTheme: PinTheme(
                        width: 43,
                        height: 43,
                        textStyle: GoogleFonts.jost(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1)),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(1, 26, 26, 26)
                                  .withOpacity(1)),
                          shape: BoxShape.rectangle,
                        )),
                  )
                ],
              )),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Resend code',
                style: GoogleFonts.jost(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(1, 174, 190, 205).withOpacity(1)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '55 s',
                // de nfs el klam l7d ma abd2 fel otp
                
                style: GoogleFonts.jost(
                    color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
                    fontSize: 16,
                    fontWeight: FontWeight.w200),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *.17,
                
              ),
              ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                      ResetPassword()));
                     
                    },
                   
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .9, 64),
                        backgroundColor:const Color(0x3FABAE).withOpacity(1),
                        shape:const LinearBorder()),
                         child: Text(
                      'Next',
                      style:GoogleFonts.jost(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      )
      
                    ),
                  )
              
            ],
          ),
        ),
      ),
    );
  }
}
