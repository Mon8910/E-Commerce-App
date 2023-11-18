import 'package:country_code_picker/country_code_picker.dart';
import 'package:demo_project/providers/login_provider.dart';
import 'package:demo_project/providers/visiable_password.dart';
import 'package:demo_project/repo/login_repo.dart';
import 'package:demo_project/screen_plus_pdf/sign_up.dart';
import 'package:demo_project/screens/navigator_bar.dart';
import 'package:demo_project/screens/send_reset_password_info_screen.dart';
import 'package:demo_project/widgets/loginwidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String? codes;
  final phone = TextEditingController();
  final password = TextEditingController();
  late final loginProvider = context.read<LoginProvider>();

  @override
  void dispose() {
    super.dispose();
    phone.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0.0,
      )),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text('phone number',
                    style: GoogleFonts.jost(
                        fontSize: 14,
                        color: const Color.fromARGB(0, 0, 0, 0),
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
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            CountryCodePicker(
                              onChanged: (value) {
                                codes = value.dialCode;
                              },
                              showFlag: false,
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
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter the phone number';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            )
                          ],
                        ))
                  ],
                )),
            const SizedBox(
              height: 18,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Password',
                    style: GoogleFonts.jost(
                        fontSize: 14,
                        color: const Color.fromARGB(0, 0, 0, 0),
                        fontWeight: FontWeight.w500
                        //   fontWeight: FontWeight.bold de hna 3shan

                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Selector<PasswordVisibilityProvider, bool>(
                selector: (context, provider) => provider.isPasswordVisible,
                builder: (context, isPasswordVisible, child) {
                  return TextFormField(
                    decoration: InputDecoration(
                        hintText: 'enter your password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              final passwordProvider =
                                  Provider.of<PasswordVisibilityProvider>(
                                      context,
                                      listen: false);
                              passwordProvider.togglePasswordVisibility();
                            },
                            icon: Icon(isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility))),
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: !isPasswordVisible,
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter password';
                      } else {
                        return null;
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Selector<LoginProvider, bool>(
              selector: (ctx, isloadin) => isloadin.isloading,
              builder: (context, issloading, child) {
                return ElevatedButton(
                  onPressed: () => issloading ? {} : _login(),
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .9, 64),
                      backgroundColor:
                          phone.text.isEmpty || password.text.isEmpty
                              ? const Color.fromARGB(1, 26, 26, 26)
                              : const Color.fromARGB(1, 171, 174, 63),
                      shape: const LinearBorder()),
                  child: issloading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text('Log in',
                          style: GoogleFonts.jost(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                );
              },
            ),
            const SizedBox(
              height: 14,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ForgetPassword();
                    }));
                  },
                  child: Text('Forget password ?',
                      style: GoogleFonts.jost(
                          fontSize: 12,
                          color: const Color.fromARGB(1, 26, 26, 26)
                              ,
                          fontWeight: FontWeight.w500
                          //   fontWeight: FontWeight.bold de hna 3shan

                          )),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You don’t have account ?',
                  style: GoogleFonts.jost(
                      fontSize: 14,
                      color:
                          const Color.fromARGB(1, 26, 26, 26).withOpacity(.8),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: ((context) => const SignupScreen()));
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.jost(
                        color:
                            const Color.fromARGB(1, 242, 85, 0)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (formKey.currentState!.validate()) {
      LoginRepo loginRepo = LoginRepo();
      loginProvider.setIsloading(true);
      final success = await loginRepo.login(
          phone: phone.text.trim(), password: password.text, code: codes!);
      loginProvider.setIsloading(false);
      if (success) {
        
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => ButtonFixedNavigator()));
      }
    }
  }
}
