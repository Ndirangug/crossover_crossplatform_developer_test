import 'package:crossover_test/controllers/following_controller.dart';
import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/widgets/home/flashcards/answer_confidence_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class FlashcardAnswerConfidence extends StatefulWidget {
  final int id;
  const FlashcardAnswerConfidence({super.key, required this.id});

  @override
  State<FlashcardAnswerConfidence> createState() =>
      _FlashcardAnswerConfidenceState();
}

class _FlashcardAnswerConfidenceState extends State<FlashcardAnswerConfidence> {
  final FollowingController _followingController = Get.find();
  final _options = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((context, constraints) => Column(
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
                LayoutBuilder(
                    builder: ((context, constraints) => Obx(
                          () {
                            var score = _followingController
                                .getFlashcardState(widget.id)
                                .answerConfidence;

                            return Container(
                                margin: const EdgeInsets.only(top: 5),
                                height: 52,
                                width: constraints.maxWidth,
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: _options
                                        .map((i) => AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: (250)),
                                              width: score == null
                                                  ? constraints.maxWidth / 5
                                                  : (score == i
                                                      ? constraints.maxWidth
                                                      : 0),
                                              child: AnimatedOpacity(
                                                duration: const Duration(
                                                    milliseconds: (250)),
                                                opacity: score == null
                                                    ? 1
                                                    : (score == i ? 1 : 0),
                                                child: AnswerConfidenceTile(
                                                    id: widget.id, score: i),
                                              ),
                                            ))
                                        .toList()));
                          },
                        )))
              ],
            )));
  }
}
