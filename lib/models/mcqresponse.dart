import 'package:crossover_test/models/mcqoption.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mcqresponse.freezed.dart';
part 'mcqresponse.g.dart';

@freezed
class McqResponse with _$McqResponse {
  factory McqResponse(
      {required String id,
      required List<McqOption> correctOptions}) = _McqResponse;

  factory McqResponse.fromJson(Map<String, dynamic> json) =>
      _$McqResponseFromJson(json);
}
