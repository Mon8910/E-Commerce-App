
import 'package:demo_project/providers/login_provider.dart';
import 'package:demo_project/repo/verify_otp_repo.dart';
import 'package:demo_project/screens/reset_newpassword_screen.dart';
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
  final codess = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final authProvider = context.read<AuthProvider>();
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
                  key: formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pinput(
                        length: 6,
                        onCompleted: (value) {},
                        controller: codess,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter the code';
                          }
                        },
                        defaultPinTheme: PinTheme(
                            width: 43,
                            height: 43,
                            textStyle: GoogleFonts.jost(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(1, 26, 26, 26)
                                    .withOpacity(1)),
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
                    color:
                        const Color.fromARGB(1, 174, 190, 205).withOpacity(1)),
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
                height: MediaQuery.of(context).size.height * .17,
              ),
              Selector<AuthProvider,bool>( selector: (ctx,isloading)=>isloading.isloading,builder: (context, isloading, child) {
                return ElevatedButton(
                onPressed: verifyOtp,
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * .9, 64),
                    backgroundColor: const Color(0x3FABAE).withOpacity(1),
                    shape: const LinearBorder()),
                child:isloading? const CircularProgressIndicator(color: Colors.white,):Text('Next',
                    style: GoogleFonts.jost(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              );
                
              },)
              
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp() async {
    if (formKey.currentState!.validate()) {
      VerifyOtpRepo verifyOtpRepo = VerifyOtpRepo();
      authProvider.setaIsdloading(true);
      final success =
          await verifyOtpRepo.verifyOtpRepo(otp: codess.text.trim());
      authProvider.setaIsdloading(false);
      if (success) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const ResetPassword()));
      }
    }
  }
}
