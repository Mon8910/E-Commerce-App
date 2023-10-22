import 'package:demo_project/providers/auth_code.dart';
import 'package:demo_project/widgets/authcodewidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class AuthCode extends StatefulWidget {
  const AuthCode({super.key});

  @override
  State<AuthCode> createState() => _AuthCodeState();
}

class _AuthCodeState extends State<AuthCode> {
  final codess=TextEditingController();
  @override
  void dispose() {
    codess.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: (AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0.0,
      )),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const AuthcodeWidgets(),
             
              Form(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 6,
                    onCompleted: (value) {
                      
                    },
                    controller: codess,
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
              Consumer<AuthCodes>(builder: (context,authcode,child){
                return  ElevatedButton(
                    onPressed: () {
                      if(codess.text.isEmpty){}
                      else{
                        authcode.authcodess(code: codess.text, context: context);
                      }
                    
                     
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
                  );
              })
              
            ],
          ),
        ),
      ),
    );
  }
}
