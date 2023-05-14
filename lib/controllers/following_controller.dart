import 'package:crossover_test/api.dart';
import 'package:crossover_test/models/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowingController extends GetxController {
  late final PageController _followingPageController = PageController();
  late final Api _api;
  final _flashCards = <FlashCard>[].obs;

  FollowingController() {
    _followingPageController.addListener(() {
      //if there are less than 3 invisible items left, fetch more
      if (_flashCards.length.toDouble() -
              (_followingPageController.page ?? 0) <=
          3) {
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
      }
    } catch (error) {
      //probably snackbar
      print(error);
    }
  }

  PageController get followingPageController => _followingPageController;
  List<FlashCard> get flashCards => _flashCards.map((e) => e).toList();
}
