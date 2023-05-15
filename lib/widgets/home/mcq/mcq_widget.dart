import 'package:crossover_test/models/mcq.dart';
import 'package:flutter/material.dart';

class MCQWidget extends StatelessWidget {
  final MCQ mcq;
  const MCQWidget({super.key, required this.mcq});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Placeholder(),
            ));
  }
}
