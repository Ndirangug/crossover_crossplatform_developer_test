import 'package:crossover_test/pallette.dart';
import 'package:flutter/material.dart';

class FlashcardAnswerConfidence extends StatefulWidget {
  final int id;
  const FlashcardAnswerConfidence({super.key, required this.id});

  @override
  State<FlashcardAnswerConfidence> createState() =>
      _FlashcardAnswerConfidenceState();
}

class _FlashcardAnswerConfidenceState extends State<FlashcardAnswerConfidence> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "How well did you know this?",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 15,
              color: Theme.of(context)
                  .extension<Pallette>()!
                  .normalText
                  .withOpacity(0.6)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 50,
          height: 52,
          color: Colors.green,
        )
      ],
    ));
  }
}
