import 'package:demo_project/providers/auth_provider.dart';
import 'package:demo_project/repo/logout_repo.dart';
import 'package:demo_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  late final logoutProvider = context.read<AuthProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body:
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text('You are logged in.'),
                  const Spacer(),
                  Selector<AuthProvider,bool>( selector: (ctx,isloading)=>isloading.isloading,builder: (context,isloading,child){
                    return ElevatedButton(
                    onPressed:_logut,
                    child: isloading?const CircularProgressIndicator(): const Text('Logout'),
                  );
                  })
                  
                ],
              ),
            )
          );
    
  }

  Future<void> _logut()async{
    LogoutRepo logoutRepo=LogoutRepo();
    logoutProvider.setaIsdloading(true);
    final success=await logoutRepo.logout();
    logoutProvider.setaIsdloading(false);
    if(success){
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Login())));
    }
    

  }
}
