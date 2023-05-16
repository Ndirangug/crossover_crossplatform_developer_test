import 'dart:async';

import 'package:get/get.dart';

class ScreenTimeController extends GetxController {
  Timer? timer;
  final _timeOnScreen = 0.obs;
  bool _timerPaused = false;

  ScreenTimeController() {
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (!_timerPaused) _timeOnScreen.value++;
    });
  }

  void pauseTimer() {
    _timerPaused = true;
  }

  void resumeTimer() {
    _timerPaused = false;
  }

  int get timeOnScreen => _timeOnScreen.value;
}
