// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcqresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_McqResponse _$$_McqResponseFromJson(Map<String, dynamic> json) =>
    _$_McqResponse(
      id: json['id'] as String,
      correctOptions: (json['correctOptions'] as List<dynamic>)
          .map((e) => McqOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_McqResponseToJson(_$_McqResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correctOptions': instance.correctOptions,
    };
