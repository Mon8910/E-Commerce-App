import 'package:demo_project/widgets/design_contaier.dart';
import 'package:flutter/material.dart';

class DecorationDetails extends StatelessWidget{
  const DecorationDetails({super.key});
  @override
  Widget build(BuildContext context) {
   return Column(
    children: [
       Row(
                            children: [
                              DesignContainer(color:const Color.fromARGB(1,217 , 217, 217).withOpacity(1)),
                             const SizedBox(width: 10,),
                              DesignContainer(color:const Color.fromARGB(1,234 , 142, 108).withOpacity(1)),
                              const SizedBox(width: 10,),
                              DesignContainer(color:const Color.fromARGB(1,110 , 122, 138).withOpacity(1)),
                              const SizedBox(width: 10,),
                              DesignContainer(color:const Color.fromARGB(1,63 , 171, 174).withOpacity(1)),




                            ],
                            
                          )
                        ,const  SizedBox(height: 20,),
                       

    ],
   );
  }
}