import 'package:demo_project/providers/auth_forgetpassword.dart';
//import 'package:demo_project/screens/auth_code.dart';
import 'package:demo_project/widgets/forgetpasswordwidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() {
    return _ForgetPasswordState();
  }
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String? codes;
  final phone=TextEditingController();
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
          const  ForgetpasswordWidget(),
           
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
                    Row(
                    children: [
                      CountryCodePicker(
                        boxDecoration:const BoxDecoration(
                          border: Border(
                            bottom: BorderSide()
                          ),
                          
                        ),
                        onChanged: (value) {
                          codes=value.dialCode;
                          
                        },
                      ),
                     const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration:const InputDecoration(
                            labelText: 'phone',
                      
                          ),
                          controller: phone,
                      
                      
                        ),
                      )
                    ],
                  )
                  ],
                )),
            
                SizedBox(height: MediaQuery.of(context).size.height *.05,),
              Consumer<AuthForgetpassword>(builder: (context,authforget,child){
                return ElevatedButton(
                  onPressed: () {
                      if(phone.text.isEmpty){

        }else{

          authforget.forgetpassword(phone: phone.text, code: codes!,context: context);
         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthCode()));

         //de hna 3shan bs a7dd hnsht8l ezay w t3ml navigator  ll b3dha.
        }
                   
                  },
                 
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .9, 64),
                      backgroundColor:phone.text.isEmpty?  Color.fromARGB(1, 26, 26, 26):   Color(0x3FABAE).withOpacity(1),
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
                ;
              })
          ],
        ),
      )),
    );
  }
}
