import 'package:demo_project/providers/navigator_bar_providers.dart';
import 'package:demo_project/screens/cart.dart';
import 'package:demo_project/screens/home.dart';
import 'package:demo_project/screens/logout.dart';
import 'package:demo_project/screens/ocaiaonss.dart';
import 'package:demo_project/screens/top_deal.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ButtonFixedNavigator extends StatelessWidget {
  ButtonFixedNavigator({super.key});

  List<Widget> screens = const [Home(), Ocaions(), TopDeal(), Cart(), Logout()];
  List<PersistentBottomNavBarItem> navigatorbaritem() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/Home.png'),
        title: 'Home',
        activeColorPrimary: Colors.orange,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
          icon: Image.asset('assets/images/Gift.png'),
          title: 'occasions',
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Image.asset('assets/images/TopDeal.png'),
          title: 'TopDeals',
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Image.asset('assets/images/cart.png'),
          title: 'cart',
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.black),
      PersistentBottomNavBarItem(
          icon: Image.asset('assets/images/Account.png'),
          title: 'account',
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.black)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Selector<BottomNavBarProvider, int>(
        selector: (p0, p1) => p1.selectedIndex,
        builder: (context, value, child) {
          return Scaffold(
            body: PersistentTabView(
              context,
              screens: screens,
              items: navigatorbaritem(),
            ),
          );
        });
  }
}
