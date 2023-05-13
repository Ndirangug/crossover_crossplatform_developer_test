// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlashCard _$$_FlashCardFromJson(Map<String, dynamic> json) => _$_FlashCard(
      id: json['id'] as int,
      playlist: json['playlist'] as String,
      flashbackFront: json['flashbackFront'] as String,
      flashbackBack: json['flashbackBack'] as String,
      description: json['description'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FlashCardToJson(_$_FlashCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playlist': instance.playlist,
      'flashbackFront': instance.flashbackFront,
      'flashbackBack': instance.flashbackBack,
      'description': instance.description,
      'user': instance.user,
    };
