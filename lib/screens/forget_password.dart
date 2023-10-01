import 'package:demo_project/screens/auth_code.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() {
    return _ForgetPasswordState();
  }
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final countrypicker=const FlCountryCodePicker();
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
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Image.asset('assets/images/Group.png'),
            ),
            Text(
              'Forget Password',
              style: GoogleFonts.jost(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                 color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1)
              ),
              textAlign: TextAlign.center,
            ),
            Text('Enter phone number to receive \n code on it',
                style:
                    GoogleFonts.jost(fontSize: 12, 
                    fontWeight: FontWeight.w400,
                    color:const Color.fromARGB(1, 146, 159, 177).withOpacity(1)
                    ),
                textAlign: TextAlign.center),
                const SizedBox(
                  height: 80,
                ),
                Align(
                  
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    child: Text('phone number',
                        style: GoogleFonts.jost(
                            fontSize: 12,
                            color: const Color.fromARGB(0, 0, 0, 0)
                                .withOpacity(.5),
                            fontWeight: FontWeight.w500
                            //   fontWeight: FontWeight.bold de hna 3shan

                            )),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              prefixIcon: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                       await countrypicker
                                            .showPicker(context: context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6),
                                        child: const Text(
                                          "20",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 110, 107, 107)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                    )
                  ],
                )),
            
                SizedBox(height: MediaQuery.of(context).size.height *.05,),
               ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                   AuthCode() ));
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
                ),
          ],
        ),
      )),
    );
  }
}
