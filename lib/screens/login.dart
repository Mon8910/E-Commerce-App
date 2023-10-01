import 'package:demo_project/screens/forget_password.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final countrypicker = const FlCountryCodePicker();

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
        appBar: (AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 0.0,
        )),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: SingleChildScrollView(
          child:
            Column(
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
                  width: 167,
                  height: 64,
                  child: Image.asset('assets/images/cadeau.png'),
                ),
                Text(
                  'Welcome back ',
                  style: GoogleFonts.jost(
                      fontSize: 24,
                      color: const Color.fromARGB(26, 26, 26, 1).withOpacity(1),
                      fontWeight: FontWeight.w700
                      //   fontWeight: FontWeight.bold de hna 3shan

                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'log in ',
                  style: GoogleFonts.jost(
                      color:
                          const Color.fromARGB(26, 26, 26, 1).withOpacity(.5),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 60,
                ),
                Align(
                  
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    child: Text('phone number',
                        style: GoogleFonts.jost(
                            fontSize: 14,
                            color: const Color.fromARGB(0, 0, 0, 0)
                                .withOpacity(.4),
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
                const SizedBox(
                  height: 18,
                ),
                Align(
                  
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('Password',
                        style: GoogleFonts.jost(
                            fontSize: 14,
                            color: const Color.fromARGB(0, 0, 0, 0)
                                .withOpacity(.4),
                            fontWeight: FontWeight.w500
                            //   fontWeight: FontWeight.bold de hna 3shan

                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'enter your password',
                        suffixIcon: Icon(Icons.visibility)),
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: true,
                  ),
                ),
             const   SizedBox(
                  height: 22,
                ),
                ElevatedButton(
                  onPressed: () {},
                 
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .9, 64),
                      backgroundColor:const Color(0x3FABAE).withOpacity(1),
                      shape:const LinearBorder()),
                       child: Text(
                    'Log in',
                    style:GoogleFonts.jost(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    )

                  ),
                ),
              const  SizedBox(height: 14,),
              Align(
                  
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 18),
                    child: InkWell(onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return  const ForgetPassword();

                      }));
                      
                    },
                      child: Text('Forget password ?',
                          style: GoogleFonts.jost(
                              fontSize: 12,
                              color: const Color.fromARGB(1, 26, 26, 26).withOpacity(.8)
                                ,
                              fontWeight: FontWeight.w500
                              //   fontWeight: FontWeight.bold de hna 3shan
                    
                              )),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.2,),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Text('You don’t have account ?',style: GoogleFonts.jost(
                      fontSize: 14,
                       color: const Color.fromARGB(1, 26, 26, 26).withOpacity(.8)
                                ,
                              fontWeight: FontWeight.w500

                     ),),
                     const SizedBox(
                      width: 4,
                     ),Text('Sign up',style: GoogleFonts.jost(
                      color: Color.fromARGB(1, 242, 85, 0).withOpacity(1)
                     ),)
                  ],
                ),
               
              
              ],
            ),
          ),
        );
  }
}
