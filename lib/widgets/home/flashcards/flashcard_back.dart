import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/flashcards/flashcard_answer_confidence.dart';
import 'package:flutter/material.dart';

class FlashcardBack extends StatelessWidget {
  final String answer;
  final String question;
  final int id;
  const FlashcardBack(
      {super.key,
      required this.answer,
      required this.question,
      required this.id});

  @override
  Widget build(BuildContext context) {
    // return Text('back');
    return LayoutBuilder(builder: ((context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).extension<Pallette>()!.normalText,
                    fontSize: 21,
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 2,
                          color: Theme.of(context)
                              .extension<Pallette>()!
                              .normalText
                              .withOpacity(0.2)))),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: Text(
                "Answer",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).extension<Pallette>()!.tertiary5,
                    fontSize: 13,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              //color: Colors.black.withOpacity(0.2),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  answer,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context)
                            .extension<Pallette>()!
                            .normalText
                            .withOpacity(0.7),
                        fontSize: 21,
                      ),
                ),
              ),
            )),
            Container(
              width: constraints.maxWidth,
              child: FlashcardAnswerConfidence(
                id: id,
              ),
            )
          ],
        ),
      );
    }));
  }
}
