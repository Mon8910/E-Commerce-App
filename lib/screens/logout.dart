import 'package:demo_project/providers/logout_provider.dart';
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
  late final logoutProvider = context.read<LogoutProvider>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You are logged in.'),
              const Spacer(),
              Selector<LogoutProvider, bool>(
                  selector: (ctx, isloading) => isloading.isloading,
                  builder: (context, isloading, child) {
                    return ElevatedButton(
                      onPressed: () => isloading ? {} : _logut(),
                      child: isloading
                          ? const CircularProgressIndicator()
                          : const Text('Logout'),
                    );
                  })
            ],
          ),
        ));
  }

  Future<void> _logut() async {
    LogoutRepo logoutRepo = LogoutRepo();
    logoutProvider.setIsloading(true);
    final success = await logoutRepo.logout();
    logoutProvider.setIsloading(false);
    if (success) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => const Login())));
    }
  }
}
