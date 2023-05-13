import 'package:crossover_test/models/mcqoption.dart';
import 'package:crossover_test/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mcq.freezed.dart';
part 'mcq.g.dart';

@freezed
class MCQ with _$MCQ {

  factory MCQ({
    required int id,
    required String playlist,
    required String description,
    required String question,
    required User user,
    required List<McqOption> options,
  }) = _MCQ;

  factory MCQ.fromJson(Map<String, dynamic> json) => _$MCQFromJson(json);
}
