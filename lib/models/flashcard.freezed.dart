// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlashCard _$FlashCardFromJson(Map<String, dynamic> json) {
  return _FlashCard.fromJson(json);
}

/// @nodoc
mixin _$FlashCard {
  int get id => throw _privateConstructorUsedError;
  String get playlist => throw _privateConstructorUsedError;
  String get flashbackFront => throw _privateConstructorUsedError;
  String get flashbackBack => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashCardCopyWith<FlashCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashCardCopyWith<$Res> {
  factory $FlashCardCopyWith(FlashCard value, $Res Function(FlashCard) then) =
      _$FlashCardCopyWithImpl<$Res, FlashCard>;
  @useResult
  $Res call(
      {int id,
      String playlist,
      String flashbackFront,
      String flashbackBack,
      String description,
      User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$FlashCardCopyWithImpl<$Res, $Val extends FlashCard>
    implements $FlashCardCopyWith<$Res> {
  _$FlashCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playlist = null,
    Object? flashbackFront = null,
    Object? flashbackBack = null,
    Object? description = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as String,
      flashbackFront: null == flashbackFront
          ? _value.flashbackFront
          : flashbackFront // ignore: cast_nullable_to_non_nullable
              as String,
      flashbackBack: null == flashbackBack
          ? _value.flashbackBack
          : flashbackBack // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FlashCardCopyWith<$Res> implements $FlashCardCopyWith<$Res> {
  factory _$$_FlashCardCopyWith(
          _$_FlashCard value, $Res Function(_$_FlashCard) then) =
      __$$_FlashCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String playlist,
      String flashbackFront,
      String flashbackBack,
      String description,
      User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_FlashCardCopyWithImpl<$Res>
    extends _$FlashCardCopyWithImpl<$Res, _$_FlashCard>
    implements _$$_FlashCardCopyWith<$Res> {
  __$$_FlashCardCopyWithImpl(
      _$_FlashCard _value, $Res Function(_$_FlashCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playlist = null,
    Object? flashbackFront = null,
    Object? flashbackBack = null,
    Object? description = null,
    Object? user = null,
  }) {
    return _then(_$_FlashCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as String,
      flashbackFront: null == flashbackFront
          ? _value.flashbackFront
          : flashbackFront // ignore: cast_nullable_to_non_nullable
              as String,
      flashbackBack: null == flashbackBack
          ? _value.flashbackBack
          : flashbackBack // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlashCard implements _FlashCard {
  _$_FlashCard(
      {required this.id,
      required this.playlist,
      required this.flashbackFront,
      required this.flashbackBack,
      required this.description,
      required this.user});

  factory _$_FlashCard.fromJson(Map<String, dynamic> json) =>
      _$$_FlashCardFromJson(json);

  @override
  final int id;
  @override
  final String playlist;
  @override
  final String flashbackFront;
  @override
  final String flashbackBack;
  @override
  final String description;
  @override
  final User user;

  @override
  String toString() {
    return 'FlashCard(id: $id, playlist: $playlist, flashbackFront: $flashbackFront, flashbackBack: $flashbackBack, description: $description, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlashCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playlist, playlist) ||
                other.playlist == playlist) &&
            (identical(other.flashbackFront, flashbackFront) ||
                other.flashbackFront == flashbackFront) &&
            (identical(other.flashbackBack, flashbackBack) ||
                other.flashbackBack == flashbackBack) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, playlist, flashbackFront,
      flashbackBack, description, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashCardCopyWith<_$_FlashCard> get copyWith =>
      __$$_FlashCardCopyWithImpl<_$_FlashCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlashCardToJson(
      this,
    );
  }
}

abstract class _FlashCard implements FlashCard {
  factory _FlashCard(
      {required final int id,
      required final String playlist,
      required final String flashbackFront,
      required final String flashbackBack,
      required final String description,
      required final User user}) = _$_FlashCard;

  factory _FlashCard.fromJson(Map<String, dynamic> json) =
      _$_FlashCard.fromJson;

  @override
  int get id;
  @override
  String get playlist;
  @override
  String get flashbackFront;
  @override
  String get flashbackBack;
  @override
  String get description;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_FlashCardCopyWith<_$_FlashCard> get copyWith =>
      throw _privateConstructorUsedError;
}
