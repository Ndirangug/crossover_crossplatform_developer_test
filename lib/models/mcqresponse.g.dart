// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcqresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_McqResponse _$$_McqResponseFromJson(Map<String, dynamic> json) =>
    _$_McqResponse(
      id: json['id'] as int,
      correctOptions: (json['correct_options'] as List<dynamic>)
          .map((e) => McqOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_McqResponseToJson(_$_McqResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correct_options': instance.correctOptions,
    };
