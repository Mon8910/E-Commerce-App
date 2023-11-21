import 'package:demo_project/providers/forget_password_provider.dart';
import 'package:demo_project/repo/forget_password_repo.dart';
import 'package:demo_project/screens/verify_otp_screen.dart';
import 'package:demo_project/widgets/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String? codes;
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late final sendRestProvider = context.read<ForgetPasswordProviders>();

  @override
  void dispose() {
    phone.dispose();

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
            const ForgetPasswordWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text('phone number',
                    style: GoogleFonts.jost(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500
                        //   fontWeight: FontWeight.bold de hna 3shan

                        )),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CountryCodePicker(
                          boxDecoration: const BoxDecoration(
                            border: Border(bottom: BorderSide()),
                          ),
                          onChanged: (value) {
                            codes = value.dialCode;
                          },
                           showFlag: false
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'phone',
                            ),
                            controller: phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your phone';
                              }else {
                                    return null;
                                  }
                            },
                          ),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Selector<ForgetPasswordProviders, bool>(
              selector: (context, provider) => provider.isloading,
              builder: (context, isloading, child) {
                return ElevatedButton(
                  onPressed: () => isloading ? {} : _sendResetPassword(),
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .9, 64),
                      backgroundColor: phone.text.isEmpty
                          ? const Color.fromARGB(1, 26, 26, 26)
                          : const Color.fromARGB(254, 63, 171, 174),
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
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _sendResetPassword() async {
    if (formKey.currentState!.validate()) {
      ForgetPasswordRepo forgetPasswordRepo = ForgetPasswordRepo();
      sendRestProvider.setIsloading(true);
      final success = await forgetPasswordRepo.forgetPasswordRepo(
          phone: phone.text.trim(), code: codes!);
      sendRestProvider.setIsloading(false);
      if (success) {
        print('is very ok');
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const VerifyOtpScreen()));
      }
    }
  }
}
