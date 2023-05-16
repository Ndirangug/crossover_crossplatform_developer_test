import 'package:crossover_test/controllers/following_controller.dart';
import 'package:crossover_test/models/flashcard.dart';
import 'package:crossover_test/widgets/home/flashcards/flashcard_back.dart';
import 'package:crossover_test/widgets/home/flashcards/flashcard_front.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlashCardWidget extends StatelessWidget {
  final FlashCard flashCard;
  final FollowingController _followingController = Get.find();
  FlashCardWidget({super.key, required this.flashCard});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((context, constraints) => SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: GestureDetector(
                onTap: () {
                  _followingController.toggleFlipCard(flashCard.id);
                },
                child: Obx(() => AnimatedCrossFade(
                    firstChild: SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: FlashcardFront(
                        question: flashCard.flashbackFront,
                      ),
                    ),
                    secondChild: SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: FlashcardBack(
                        id: flashCard.id,
                        question: flashCard.flashbackFront,
                        answer: flashCard.flashbackBack,
                      ),
                    ),
                    crossFadeState: _followingController
                            .flashcardsState[flashCard.id]!.isFlipped
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 500))),
              ),
            )));
  }
}
