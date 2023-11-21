import 'package:demo_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Splash1Screen extends StatelessWidget {
  Splash1Screen(this.nextpage, {super.key});
  PageController nextpage = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: PageView(
          controller: nextpage,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/post1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Browse gifts for any occasions \n and sent it to people you love ',
                  style: GoogleFonts.jost(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(1, 26, 26, 26),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          'Skip',
                          style: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(1, 26, 26, 26)),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            nextpage.animateToPage(1,
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeIn);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(1, 63, 171, 174)
                                     ,
                              shape: const RoundedRectangleBorder()),
                          child: Text(
                            'next',
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: const Color.fromARGB(1, 255, 255, 255),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/post2.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Style and wrap gifts \n as you want',
                  style: GoogleFonts.jost(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(1, 26, 26, 26),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 20),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          'Skip',
                          style: GoogleFonts.jost(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(1, 26, 26, 26)
                                  ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(1, 63, 171, 174)
                                      ,
                              shape: const RoundedRectangleBorder()),
                          child: Text(
                            'next',
                            style: GoogleFonts.jost(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: const Color.fromARGB(1, 255, 255, 255)
                                  ,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/post3.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Deliver it anywhere at \n anytime',
                  style: GoogleFonts.jost(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(1, 26, 26, 26),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .9, 64),
                        backgroundColor: const Color.fromARGB(0, 63, 171, 174),
                        shape: const LinearBorder()),
                    child: Text('Get Started',
                        style: GoogleFonts.jost(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
