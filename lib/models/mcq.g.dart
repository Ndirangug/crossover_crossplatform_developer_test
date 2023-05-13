// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mcq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MCQ _$$_MCQFromJson(Map<String, dynamic> json) => _$_MCQ(
      id: json['id'] as int,
      playlist: json['playlist'] as String,
      description: json['description'] as String,
      question: json['question'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      options: (json['options'] as List<dynamic>)
          .map((e) => McqOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MCQToJson(_$_MCQ instance) => <String, dynamic>{
      'id': instance.id,
      'playlist': instance.playlist,
      'description': instance.description,
      'question': instance.question,
      'user': instance.user,
      'options': instance.options,
    };
