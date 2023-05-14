import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedActionsController extends GetxController {
  final _likes = 17.obs;
  final _bookmarks = 234.obs;

  final _isLiked = false.obs;
  final _isBookmarked = false.obs;
  late final TabController tabController;

  void toggleLike() {
    _isLiked.value = !_isLiked.value;
    if (_isLiked.value) {
      _likes.value++;
    } else {
      _likes.value--;
    }
  }

  void toggleBookmark() {
    _isBookmarked.value = !_isBookmarked.value;
    if (_isBookmarked.value) {
      _bookmarks.value++;
    } else {
      _bookmarks.value--;
    }
  }

  int get likes => _likes.value;
  int get bookmarks => _bookmarks.value;
  bool get isLiked => _isLiked.value;
  bool get isBookmarked => _isBookmarked.value;
}
