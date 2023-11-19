import 'package:demo_project/widgets/design_contaier.dart';
import 'package:flutter/material.dart';

class DecorationDetails extends StatelessWidget {
  const DecorationDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            DesignContainer(color: const Color.fromARGB(1, 217, 217, 217)),
            const SizedBox(
              width: 10,
            ),
            DesignContainer(color: const Color.fromARGB(1, 234, 142, 108)),
            const SizedBox(
              width: 10,
            ),
            DesignContainer(color: const Color.fromARGB(1, 110, 122, 138)),
            const SizedBox(
              width: 10,
            ),
            DesignContainer(color: const Color.fromARGB(1, 63, 171, 174)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
