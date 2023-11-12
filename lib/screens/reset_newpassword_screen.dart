import 'package:demo_project/providers/auth_provider.dart';
import 'package:demo_project/providers/visiable_password.dart';
import 'package:demo_project/repo/reset_new_password_repo.dart';
import 'package:demo_project/screens/login.dart';
import 'package:demo_project/widgets/reset_passwordwidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ResetPasswordState();
  }
}

class _ResetPasswordState extends State<ResetPassword> {
    final formKey = GlobalKey<FormState>();
    final password = TextEditingController();
  final confermationPassword = TextEditingController();
   late final resetProvider = context.read<AuthProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height *.01,),
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
            
              Text('Set New Password',style: GoogleFonts.jost(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1)
              ),
              textAlign: TextAlign.center,),
              SizedBox(height: MediaQuery.of(context).size.height *.1,),
              Form(key: formKey,
                child: Column(
                children: [
                   Align(
                    
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('New Password',
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
                    child: Selector<PasswordVisibilityProvider,bool>(
                      selector: (context, provider) => provider.isPasswordVisible,
                      builder: (context,isPasswordVisible , child) {
                        return TextFormField(
                      decoration:  InputDecoration(
                          hintText: 'Enter at least 8 characters',hintStyle: GoogleFonts.jost(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0x00000040).withOpacity(.2)
                          )
                          ,
                       
                          suffixIcon:IconButton(
                        onPressed: () {
                           final passwordProvider =
                            Provider.of<PasswordVisibilityProvider>(
                                context,
                                listen: false);
                        passwordProvider.togglePasswordVisibility();
                        

                        },
                        icon: Icon( isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility))),
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: !isPasswordVisible,validator: (value) {
                        if(value==null||value.isEmpty){
                          return "please enter the password";
                        }
                      },
                      controller: password,
                    );
                      },
                    )
                  ),
        
                ],
              )),
             const SizedBox(height: 12),
             Align(
              alignment: Alignment.centerLeft,
              child: Text('Your password Must have :',style: GoogleFonts.jost(
              fontSize:12 ,
              fontWeight: FontWeight.w500,
              color:const Color.fromARGB(1, 26, 26, 26).withOpacity(.7) ,

             )),
             )  ,
             const SizedBox(height: 6,),
             ConfirmPassword(),
            const SizedBox(height: 18,),
            Form(child: Column(
                children: [
                   Align(
                    
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('New Password',
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
                    child: Selector<PasswordVisibilityProvider,bool>(
                      selector: (context, provider) => provider.isPasswordVisible,
                      builder: (context,isPasswordVisible , child) {
                        return TextFormField(
                      decoration:  InputDecoration(
                          hintText: 'Enter at least 8 characters',hintStyle: GoogleFonts.jost(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0x00000040).withOpacity(.2)
                          )
                          ,
                       
                          suffixIcon:IconButton(
                        onPressed: () {
                           final passwordProvider =
                            Provider.of<PasswordVisibilityProvider>(
                                context,
                                listen: false);
                        passwordProvider.togglePasswordVisibility();

                        },
                        icon: Icon( isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility))),
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: !isPasswordVisible,
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return "please enter the password";
                        }
                      },
                      controller: confermationPassword,
                    );
                      },
                    )
                  ),
        
                ],
              )),
             const SizedBox(height: 30,),
             Selector<AuthProvider,bool>( selector: (ctx,isloading)=>isloading.isloading,builder: (context,isloading,child){
              return ElevatedButton(
                  onPressed: _resetpassword,

                 
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * .9, 64),
                      backgroundColor:const Color(0x3FABAE).withOpacity(1),
                      shape:const LinearBorder()),
                       child:isloading?
                      const CircularProgressIndicator(color: Colors.white,):  Text(
                    'Done',
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
      ),
    );

  }
  Future<void> _resetpassword()async{
    if(formKey.currentState!.validate()){
      ResetNewPasswordRepo resetRepo=ResetNewPasswordRepo();
      resetProvider.setaIsdloading(true);
      final success=await resetRepo.resetNewPasswords(password: password.text, confermtionPassword: confermationPassword.text);
      resetProvider.setaIsdloading(false);
      if(success){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Login()));
      }

    }

  }
}
