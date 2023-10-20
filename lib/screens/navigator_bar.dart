import 'package:demo_project/screens/ocaiaonss.dart';
import 'package:demo_project/screens/occaisons_list_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavigationScreen extends StatefulWidget{
  BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
int selectedindex=0;

  void selectedindexs(int index){
    setState(() {
      selectedindex=index;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage=OccaionsListScreen(

    );

    
   return Scaffold(body: Ocaions()
   ,bottomNavigationBar: BottomNavigationBar(onTap: selectedindexs,items:const [
    BottomNavigationBarItem(icon:Icon(Icons.home_outlined) ,label: 'Home'),
    BottomNavigationBarItem(icon:Icon(Icons.card_giftcard_outlined) ,label: 'Occasions'),
    BottomNavigationBarItem(icon:Icon(Icons.discount_outlined) ,label: 'TopDeals'),
    BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_outlined) ,label: 'Cart'),
    BottomNavigationBarItem(icon:Icon(Icons.account_box_outlined) ,label: 'Account'),



        

   ]),);
  }
}