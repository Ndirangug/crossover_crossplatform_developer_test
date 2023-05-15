import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';

class FlashcardFront extends StatelessWidget {
  final String question;
  const FlashcardFront({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Center(
                child: Text(
                  question,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:
                            Theme.of(context).extension<Pallette>()!.normalText,
                        fontSize: 21,
                      ),
                ),
              ),
            ));
  }
}
