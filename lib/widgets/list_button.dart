import 'package:demo_project/widgets/designbutton.dart';
import 'package:flutter/material.dart';

class ListButtons extends StatelessWidget{
  const ListButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return   Row(
                          children: [
                            DesignButton(text: 'small'),
                              const SizedBox(width: 5,),

                             DesignButton(text: 'medium'),
                              const SizedBox(width: 5,),

                            DesignButton(text: 'large'),
                             const SizedBox(width: 5,),
                            DesignButton(text: 'Xlarge'),



                            

                            
                          ],
                        );
  }
}