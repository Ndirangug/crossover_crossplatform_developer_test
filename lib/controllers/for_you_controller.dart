import 'package:crossover_test/api.dart';
import 'package:crossover_test/models/mcq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouController extends GetxController {
  late final PageController _pageController = PageController();
  late final Api _api;
  final _mcqs = <MCQ>[].obs;
  final _mcqStates = <Rx<int>, Rx<MCQState>>{}.obs;

  ForYouController() {
    _pageController.addListener(() {
      //if there are less than 3 invisible items left, fetch more
      if (_mcqs.length.toDouble() - (_pageController.page ?? 0) <= 3) {
        _fetchMore(1);
      }
    });
    _api = Get.find();

    _fetchMore(2);
  }

  Future<void> _fetchMore(int count) async {
    try {
      for (var i = 0; i < count; i++) {
        final newItem = await _api.fetchNextForYou();
        _mcqs.add(newItem);

        //dummy state
        _mcqStates[newItem.id.obs] = (MCQState(
                bookmarksCount: 234,
                likesCount: 17,
                isBookmarked: false,
                isLiked: false,
                isFlipped: false))
            .obs;
      }
    } catch (error) {
      //probably snackbar
    }
  }

  void toggleFlipCard(int id) {
    var currentState = getMcqState(id);

    _mcqStates[id.obs]!.value = currentState.copyWith(
      isFlipped: !currentState.isFlipped,
    );
  }

  void toggleLiked(int id) {
    var currentState = getMcqState(id);

    if (currentState.isLiked) {
      _mcqStates[id.obs]!.value = currentState.copyWith(
        isLiked: !currentState.isLiked,
        likesCount: currentState.likesCount + 1,
      );
    } else {
      _mcqStates[id.obs]!.value = currentState.copyWith(
        isLiked: !currentState.isLiked,
        likesCount: currentState.likesCount - 1,
      );
    }
  }

  void toggleBookmarked(int id) {
    var currentState = getMcqState(id);

    if (currentState.isBookmarked) {
      _mcqStates[id.obs]!.value = currentState.copyWith(
        isBookmarked: !currentState.isBookmarked,
        bookmarksCount: currentState.bookmarksCount + 1,
      );
    } else {
      _mcqStates[id.obs]!.value = currentState.copyWith(
        isBookmarked: !currentState.isBookmarked,
        bookmarksCount: currentState.bookmarksCount - 1,
      );
    }
  }

  MCQState getMcqState(int id) {
    return _mcqStates[id.obs]!.value;
  }

  PageController get forYouPageController => _pageController;
  List<MCQ> get mcqs => _mcqs.map((e) => e).toList();
  Map<int, MCQState> get mcqsState =>
      _mcqStates.map((key, value) => MapEntry(key.value, value.value));
}

class MCQState {
  bool isFlipped;
  bool isLiked;
  bool isBookmarked;
  int? answerConfidence;
  int likesCount;
  int bookmarksCount;
  MCQState({
    required this.isFlipped,
    required this.isLiked,
    required this.isBookmarked,
    this.answerConfidence,
    required this.likesCount,
    required this.bookmarksCount,
  });

  MCQState copyWith(
      {bool? isFlipped,
      bool? isLiked,
      bool? isBookmarked,
      int? answerConfidence,
      int? likesCount,
      int? bookmarksCount}) {
    return MCQState(
        isFlipped: isFlipped ?? this.isFlipped,
        isLiked: isLiked ?? this.isLiked,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        answerConfidence: answerConfidence ?? this.answerConfidence,
        likesCount: likesCount ?? this.likesCount,
        bookmarksCount: bookmarksCount ?? this.bookmarksCount);
  }
}
