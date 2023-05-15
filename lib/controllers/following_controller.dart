import 'package:crossover_test/api.dart';
import 'package:crossover_test/models/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowingController extends GetxController {
  late final PageController _pageController = PageController();
  late final Api _api;
  final _flashCards = <FlashCard>[].obs;
  final _flashCardStates = <Rx<int>, Rx<FlashCardState>>{}.obs;

  FollowingController() {
    _pageController.addListener(() {
      //if there are less than 3 invisible items left, fetch more
      if (_flashCards.length.toDouble() - (_pageController.page ?? 0) <= 3) {
        _fetchMore(1);
      }
    });
    _api = Get.find();
    _fetchMore(2);
  }

  Future<void> _fetchMore(int count) async {
    try {
      for (var i = 0; i < count; i++) {
        final newItem = await _api.fetchNextFollowing();
        _flashCards.add(newItem);

        //dummy state
        _flashCardStates[newItem.id.obs] = (FlashCardState(
                bookmarksCount: 234,
                likesCount: 17,
                isBookmarked: false,
                isLiked: false,
                isFlipped: false))
            .obs;
      }
    } catch (error) {
      //probably snackbar
      print(error);
    }
  }

  void setAnswerConfidence({required int id, required int confidence}) {
    getFlashcardState(id).answerConfidence = confidence;
  }

  void toggleFlipCard(int id) {
    getFlashcardState(id).isFlipped = !_flashCardStates[id]!.value.isFlipped;
  }

  void toggleLiked(int id) {
    getFlashcardState(id).isLiked = !getFlashcardState(id).isLiked;

    if (getFlashcardState(id).isLiked) {
      getFlashcardState(id).likesCount++;
    } else {
      getFlashcardState(id).likesCount--;
    }
  }

  void toggleBookmarked(int id) {
    getFlashcardState(id).isBookmarked = !getFlashcardState(id).isBookmarked;

    if (getFlashcardState(id).isBookmarked) {
      getFlashcardState(id).bookmarksCount++;
    } else {
      getFlashcardState(id).bookmarksCount--;
    }
  }

  FlashCardState getFlashcardState(int id) {
    return _flashCardStates[id.obs]!.value;
  }

  PageController get followingPageController => _pageController;
  List<FlashCard> get flashCards => _flashCards.map((e) => e).toList();
  Map<int, FlashCardState> get flashcardsState =>
      _flashCardStates.map((key, value) => MapEntry(key.value, value.value));
}

class FlashCardState {
  bool isFlipped;
  bool isLiked;
  bool isBookmarked;
  int? answerConfidence;
  int likesCount;
  int bookmarksCount;
  FlashCardState({
    required this.isFlipped,
    required this.isLiked,
    required this.isBookmarked,
    this.answerConfidence,
    required this.likesCount,
    required this.bookmarksCount,
  });
}
