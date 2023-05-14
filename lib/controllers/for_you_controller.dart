import 'package:crossover_test/api.dart';
import 'package:crossover_test/models/mcq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForYouController extends GetxController {
  late final PageController _forYouPageController = PageController();
  late final Api _api;
  final _mcqs = <MCQ>[].obs;

  ForYouController() {
    _forYouPageController.addListener(() {
      //if there are less than 3 invisible items left, fetch more
      if (_mcqs.length.toDouble() - (_forYouPageController.page ?? 0) <= 3) {
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
      }
    } catch (error) {
      //probably snackbar
    }
  }

  PageController get forYouPageController => _forYouPageController;
  List<MCQ> get mcqs => _mcqs.map((e) => e).toList();
}
