// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mcq.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MCQ _$MCQFromJson(Map<String, dynamic> json) {
  return _MCQ.fromJson(json);
}

/// @nodoc
mixin _$MCQ {
  int get id => throw _privateConstructorUsedError;
  String get playlist => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  List<McqOption> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MCQCopyWith<MCQ> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MCQCopyWith<$Res> {
  factory $MCQCopyWith(MCQ value, $Res Function(MCQ) then) =
      _$MCQCopyWithImpl<$Res, MCQ>;
  @useResult
  $Res call(
      {int id,
      String playlist,
      String description,
      String question,
      User user,
      List<McqOption> options});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MCQCopyWithImpl<$Res, $Val extends MCQ> implements $MCQCopyWith<$Res> {
  _$MCQCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playlist = null,
    Object? description = null,
    Object? question = null,
    Object? user = null,
    Object? options = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<McqOption>,
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
abstract class _$$_MCQCopyWith<$Res> implements $MCQCopyWith<$Res> {
  factory _$$_MCQCopyWith(_$_MCQ value, $Res Function(_$_MCQ) then) =
      __$$_MCQCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String playlist,
      String description,
      String question,
      User user,
      List<McqOption> options});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_MCQCopyWithImpl<$Res> extends _$MCQCopyWithImpl<$Res, _$_MCQ>
    implements _$$_MCQCopyWith<$Res> {
  __$$_MCQCopyWithImpl(_$_MCQ _value, $Res Function(_$_MCQ) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playlist = null,
    Object? description = null,
    Object? question = null,
    Object? user = null,
    Object? options = null,
  }) {
    return _then(_$_MCQ(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<McqOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MCQ implements _MCQ {
  _$_MCQ(
      {required this.id,
      required this.playlist,
      required this.description,
      required this.question,
      required this.user,
      required final List<McqOption> options})
      : _options = options;

  factory _$_MCQ.fromJson(Map<String, dynamic> json) => _$$_MCQFromJson(json);

  @override
  final int id;
  @override
  final String playlist;
  @override
  final String description;
  @override
  final String question;
  @override
  final User user;
  final List<McqOption> _options;
  @override
  List<McqOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'MCQ(id: $id, playlist: $playlist, description: $description, question: $question, user: $user, options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MCQ &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playlist, playlist) ||
                other.playlist == playlist) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, playlist, description,
      question, user, const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MCQCopyWith<_$_MCQ> get copyWith =>
      __$$_MCQCopyWithImpl<_$_MCQ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MCQToJson(
      this,
    );
  }
}

abstract class _MCQ implements MCQ {
  factory _MCQ(
      {required final int id,
      required final String playlist,
      required final String description,
      required final String question,
      required final User user,
      required final List<McqOption> options}) = _$_MCQ;

  factory _MCQ.fromJson(Map<String, dynamic> json) = _$_MCQ.fromJson;

  @override
  int get id;
  @override
  String get playlist;
  @override
  String get description;
  @override
  String get question;
  @override
  User get user;
  @override
  List<McqOption> get options;
  @override
  @JsonKey(ignore: true)
  _$$_MCQCopyWith<_$_MCQ> get copyWith => throw _privateConstructorUsedError;
}
