import 'package:crossover_test/api.dart';
import 'package:crossover_test/controllers/feed_controller.dart';
import 'package:crossover_test/models/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowingController extends GetxController implements FeedController {
  //late final PageController _pageController = PageController();
  late final Api _api;
  final _flashCards = <FlashCard>[].obs;
  final _flashCardStates = <Rx<int>, Rx<FlashCardState>>{}.obs;

  FollowingController() {
    //_pageController.addListener(pageViewControllerListener);
    _api = Get.find();
    fetchMore(2);
  }

  // void pageViewControllerListener() {
  //   if (_flashCards.length.toDouble() - (_pageController.page ?? 0) <= 3) {
  //     fetchMore(1);
  //   }
  // }

  @override
  Future<void> fetchMore(int count) async {
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
    var currentState = getFlashcardState(id);

    _flashCardStates[id.obs]!.value = currentState.copyWith(
      answerConfidence: confidence,
    );
  }

  @override
  void toggleFlipCard(int id) {
    var currentState = getFlashcardState(id);

    _flashCardStates[id.obs]!.value = currentState.copyWith(
      isFlipped: !currentState.isFlipped,
    );
  }

  @override
  void toggleLiked(int id) {
    var currentState = getFlashcardState(id);

    if (currentState.isLiked) {
      _flashCardStates[id.obs]!.value = currentState.copyWith(
        isLiked: !currentState.isLiked,
        likesCount: currentState.likesCount + 1,
      );
    } else {
      _flashCardStates[id.obs]!.value = currentState.copyWith(
        isLiked: !currentState.isLiked,
        likesCount: currentState.likesCount - 1,
      );
    }
  }

  @override
  void toggleBookmarked(int id) {
    var currentState = getFlashcardState(id);

    if (currentState.isBookmarked) {
      _flashCardStates[id.obs]!.value = currentState.copyWith(
        isBookmarked: !currentState.isBookmarked,
        bookmarksCount: currentState.bookmarksCount + 1,
      );
    } else {
      _flashCardStates[id.obs]!.value = currentState.copyWith(
        isBookmarked: !currentState.isBookmarked,
        bookmarksCount: currentState.bookmarksCount - 1,
      );
    }
  }

  FlashCardState getFlashcardState(int id) {
    return _flashCardStates[id.obs]!.value;
  }

  //PageController get followingPageController => _pageController;
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

  FlashCardState copyWith(
      {bool? isFlipped,
      bool? isLiked,
      bool? isBookmarked,
      int? answerConfidence,
      int? likesCount,
      int? bookmarksCount}) {
    return FlashCardState(
        isFlipped: isFlipped ?? this.isFlipped,
        isLiked: isLiked ?? this.isLiked,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        answerConfidence: answerConfidence ?? this.answerConfidence,
        likesCount: likesCount ?? this.likesCount,
        bookmarksCount: bookmarksCount ?? this.bookmarksCount);
  }
}
