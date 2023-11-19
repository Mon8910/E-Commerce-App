import 'package:demo_project/screens/login.dart';
import 'package:demo_project/widget_plus_pdf/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/cadeau.png'),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Welcome to cadeau',
              style: GoogleFonts.jost(
                  color: const Color.fromARGB(1, 26, 26, 26),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Please choose your preferred sign up method',
              style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color.fromARGB(1, 26, 26, 26)),
            ),
            const SizedBox(
              height: 15,
            ),
            const SignupWidget(
                text: 'Continue with facebook',
                icon: Icon(
                  Icons.facebook,
                  color: Colors.blue,
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .062,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(1, 248, 248, 248)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Image.asset('assets/images/gmail.png'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Continue with google',
                      style: GoogleFonts.jost(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(1, 26, 26, 26)),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SignupWidget(
                text: 'Continue with Apple', icon: Icon(Icons.apple)),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .062,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(1, 248, 248, 248).withOpacity(1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Image.asset('assets/images/twitter.png'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Continue with twitter',
                      style: GoogleFonts.jost(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(1, 26, 26, 26)
                              .withOpacity(1)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color:
                        const Color.fromARGB(1, 110, 122, 138).withOpacity(.18),
                    thickness: 1.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Or',
                      style: GoogleFonts.jost(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(1, 110, 122, 138)
                              .withOpacity(1))),
                ),
                Expanded(
                  child: Divider(
                    color:
                        const Color.fromARGB(1, 110, 122, 138).withOpacity(.18),
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const SignupWidget(
                text: 'Create New account ',
                icon: Icon(Icons.account_circle_sharp)),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'By signing up you confirm that you agree to \n privacy policy & terms of use ',
                style: GoogleFonts.jost(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: const Color.fromARGB(0, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'You already have account  ?  ',
                  style: GoogleFonts.jost(
                      fontSize: 14,
                      color:
                          const Color.fromARGB(1, 26, 26, 26),
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  child: Text(
                    'Login',
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
}
