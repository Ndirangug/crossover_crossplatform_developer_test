import 'package:freezed_annotation/freezed_annotation.dart';

part 'mcqoption.freezed.dart';
part 'mcqoption.g.dart';

@freezed
class McqOption with _$McqOption {
  factory McqOption({required String id, required String answer}) = _McqOption;

  factory McqOption.fromJson(Map<String, dynamic> json) =>
      _$McqOptionFromJson(json);
}
