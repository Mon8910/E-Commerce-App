import 'package:demo_project/providers/timer_provider.dart';
import 'package:demo_project/providers/verify_otp_provider.dart';
import 'package:demo_project/repo/verify_otp_repo.dart';
import 'package:demo_project/screens/reset_newpassword_screen.dart';
import 'package:demo_project/widgets/auth_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class AuthCodeScreen extends StatefulWidget {
  const AuthCodeScreen({super.key});

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreenState();
}

class _AuthCodeScreenState extends State<AuthCodeScreen> {
  final codess = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final authProvider = context.read<VerifyOtpProvider>();
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
                                color: const Color.fromARGB(1, 26, 26, 26)),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromRGBO(1, 26, 26, 26)),
                              shape: BoxShape.rectangle,
                            )),
                      )
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Selector<CountdownProvider, int>(
                      selector: (_, countdownProvider) =>
                          countdownProvider.remainingSeconds,
                      builder: (context, remainingSeconds, _) {
                        return Column(
                          children: [
                            remainingSeconds == 0
                                ? Selector<VerifyOtpProvider, bool>(
                                    selector: (_, myType) => myType.isloading,
                                    builder: (context, isloading, child) {
                                      return InkWell(
                                        onTap: () =>
                                            isloading ? {} : verifyOtp(),
                                        child: Text(
                                          'Resend code',
                                          style: TextStyle(
                                              color: Colors.grey[400]),
                                        ),
                                      );
                                    },
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 20),
                            remainingSeconds != 0
                                ? Text('$remainingSeconds s')
                                :const SizedBox(),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .17,
              ),
              Selector<VerifyOtpProvider, bool>(
                selector: (ctx, isloading) => isloading.isloading,
                builder: (context, isloading, child) {
                  return ElevatedButton(
                    onPressed: () => isloading ? {} : verifyOtp(),
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .9, 64),
                        backgroundColor: const Color.fromARGB(1, 63, 171, 174),
                        shape: const LinearBorder()),
                    child: isloading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Next',
                            style: GoogleFonts.jost(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp() async {
    if (formKey.currentState!.validate()) {
      VerifyOtpRepo verifyOtpRepo = VerifyOtpRepo();
      authProvider.setIsloading(true);
      final success =
          await verifyOtpRepo.verifyOtpRepo(otp: codess.text.trim());
      authProvider.setIsloading(false);
      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const ResetPassword()));
      }
    }
  }
}
