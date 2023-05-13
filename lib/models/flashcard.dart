import 'package:crossover_test/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flashcard.freezed.dart';
part 'flashcard.g.dart';

@freezed
class FlashCard with _$FlashCard {
  factory FlashCard({
    required int id,
    required String playlist,
    required String flashbackFront,
    required String flashbackBack,
    required String description,
    required User user,
  }) = _FlashCard;

  factory FlashCard.fromJson(Map<String, dynamic> json) =>
      _$FlashCardFromJson(json);
}
