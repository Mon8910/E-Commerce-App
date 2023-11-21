import 'package:demo_project/providers/navigator_bar_providers.dart';
import 'package:demo_project/screens/logout_screen.dart';
import 'package:demo_project/screens/occasion_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ButtonFixedNavigatorScreen extends StatelessWidget {
  ButtonFixedNavigatorScreen({super.key});

  List<Widget> screens = const [ OccasionsScreen(), LogoutScreen()];
  

  @override
  Widget build(BuildContext context) {
    return Selector<BottomNavBarProvider, int>(
        selector: (context, provider) => provider.selectedIndex,
        builder: (context, value, child) {
          return Scaffold(
            body: PersistentTabView(
              context,
              screens: screens,
              items: [
      PersistentBottomNavBarItem(
          icon:const Icon(Icons.card_giftcard_sharp),
          title: 'occasions',
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon:const Icon(Icons.account_box_outlined),
          title: 'account',
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.black)
    ],
              decoration:const  NavBarDecoration(
              ),
              navBarStyle: NavBarStyle.style6,
            ),
          );
        });
  }
}
