import 'package:demo_project/providers/logout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Logout extends StatelessWidget{
  const Logout({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Theme.of(context).colorScheme.onPrimary
      , body: Selector<AuthLogout,bool>( selector: (context,p1)=>p1.isLoggedIn,builder: (contetx,provider,child){
         return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (provider)
                  Text('You are logged in.'),
                  Spacer(),
                ElevatedButton(
                  onPressed: () {
                    final authState =
                        Provider.of<AuthLogout>(context, listen: false);
                    authState.logout();
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
          );
       }),
    );
  }
}