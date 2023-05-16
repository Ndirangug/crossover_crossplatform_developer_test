// ignore_for_file: invalid_annotation_target

import 'package:crossover_test/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard.freezed.dart';
part 'flashcard.g.dart';

@freezed
class FlashCard with _$FlashCard {
  factory FlashCard({
    required int id,
    required String playlist,
    @JsonKey(name: 'flashcard_front') required String flashbackFront,
    @JsonKey(name: 'flashcard_back') required String flashbackBack,
    required String description,
    required User user,
  }) = _FlashCard;

  factory FlashCard.fromJson(Map<String, dynamic> json) =>
      _$FlashCardFromJson(json);
}
