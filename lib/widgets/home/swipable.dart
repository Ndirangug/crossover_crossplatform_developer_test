import 'package:flutter/material.dart';

class Swippable extends StatelessWidget {
  const Swippable({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Container(color: Colors.white),
            ));
  }
}
