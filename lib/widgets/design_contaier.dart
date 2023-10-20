import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesignContainer extends StatelessWidget{
   DesignContainer({super.key ,required this.color,  });
  Color color;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:color
                                    ),
                                  ),
                                  
                                    
                                  
      ],
    );
}
}