import 'package:crossover_test/api.dart';
import 'package:crossover_test/models/mcq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouController extends GetxController {
  late final PageController _pageController = PageController();
  late final Api _api;
  final _mcqs = <MCQ>[].obs;
  final _mcqStates = RxMap<int, Rx<MCQState>>.of({});

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
        _mcqStates[newItem.id] = (MCQState(
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
    getMCQState(id).isFlipped = !_mcqStates[id]!.value.isFlipped;
  }

  void toggleLiked(int id) {
    getMCQState(id).isLiked = !getMCQState(id).isLiked;

    if (getMCQState(id).isLiked) {
      getMCQState(id).likesCount++;
    } else {
      getMCQState(id).likesCount--;
    }
  }

  void toggleBookmarked(int id) {
    getMCQState(id).isBookmarked = !getMCQState(id).isBookmarked;

    if (getMCQState(id).isBookmarked) {
      getMCQState(id).bookmarksCount++;
    } else {
      getMCQState(id).bookmarksCount--;
    }
  }

  MCQState getMCQState(int id) {
    return _mcqStates[id]!.value;
  }

  PageController get forYouPageController => _pageController;
  List<MCQ> get mcqs => _mcqs.map((e) => e).toList();
   Map<int, MCQState> get mcqsState =>
      _mcqStates.map((key, value) => MapEntry(key, value.value));
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
}
