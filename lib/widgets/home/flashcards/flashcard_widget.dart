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
    return Container(
      child: Obx(() =>
          _followingController.flashcardsState[flashCard.id]!.isFlipped
              ? const FlashcardFront()
              : const FlashcardBack()),
    );
  }
}
