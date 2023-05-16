import 'package:crossover_test/api.dart';
import 'package:crossover_test/controllers/feed_controller.dart';
import 'package:crossover_test/models/mcq.dart';
import 'package:crossover_test/models/mcqoption.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AnswerState { correct, wrong, unmarked }

class ForYouController extends GetxController implements FeedController {
  late final PageController _pageController = PageController();
  late final Api _api;
  final _mcqs = <MCQ>[].obs;
  final _mcqStates = <Rx<int>, Rx<MCQState>>{}.obs;
  final _answerLoading = false.obs;

  ForYouController() {
    _pageController.addListener(() {
      //if there are less than 3 invisible items left, fetch more
      if (_mcqs.length.toDouble() - (_pageController.page ?? 0) <= 3) {
        fetchMore(1);
      }
    });
    _api = Get.find();

    fetchMore(2);
  }

  @override
  Future<void> fetchMore(int count) async {
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

  Future<List<McqOption>?> fetchAnswer(int questionId) async {
    try {
      answerLoading = true;
      final answer = await _api.fetchMcqAnswer(questionId);
      return answer.correctOptions;
    } catch (error) {
      print(error);
      return null;
      //probably snackbar
    } finally {
      answerLoading = false;
    }
  }

  AnswerState getAnswerState(
      {required int questionId, required String givenAnswerId}) {
    var currentState = getMcqState(questionId);
    if (currentState.correctAnswers == null) {
      return AnswerState.unmarked;
    }

    bool givenCorrectAnswer = currentState.correctAnswers!
        .any((option) => option.id == givenAnswerId);

    if (givenCorrectAnswer) {
      return AnswerState.correct;
    } else if (givenAnswerId == currentState.givenAnswer &&
        !givenCorrectAnswer) {
      return AnswerState.wrong;
    } else {
      return AnswerState.unmarked;
    }
  }

  @override
  Future<void> toggleFlipCard(int id) async {
    var currentState = getMcqState(id);
    List<McqOption>? answers = null;

    if (currentState.correctAnswers == null) {
      answers = await fetchAnswer(id);
    }

    _mcqStates[id.obs]!.value = currentState.copyWith(
        isFlipped: !currentState.isFlipped, correctAnswers: answers);
  }

  void supplyAnswer({required int questionId, required String answerId}) {
    var currentState = getMcqState(questionId);
    _mcqStates[questionId.obs]!.value =
        currentState.copyWith(givenAnswer: answerId);
  }

  @override
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

  @override
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
  bool get answerLoading => _answerLoading.value;
  set answerLoading(bool value) => _answerLoading.value = value;
}

class MCQState {
  bool isFlipped;
  bool isLiked;
  bool isBookmarked;
  String? givenAnswer;
  List<McqOption>? correctAnswers;
  int likesCount;
  int bookmarksCount;
  MCQState({
    required this.isFlipped,
    required this.isLiked,
    required this.isBookmarked,
    this.givenAnswer,
    this.correctAnswers,
    required this.likesCount,
    required this.bookmarksCount,
  });

  MCQState copyWith(
      {bool? isFlipped,
      bool? isLiked,
      bool? isBookmarked,
      String? givenAnswer,
      List<McqOption>? correctAnswers,
      int? likesCount,
      int? bookmarksCount}) {
    return MCQState(
        isFlipped: isFlipped ?? this.isFlipped,
        isLiked: isLiked ?? this.isLiked,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        givenAnswer: givenAnswer ?? this.givenAnswer,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        likesCount: likesCount ?? this.likesCount,
        bookmarksCount: bookmarksCount ?? this.bookmarksCount);
  }
}
