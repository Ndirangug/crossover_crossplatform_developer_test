// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mcqoption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

McqOption _$McqOptionFromJson(Map<String, dynamic> json) {
  return _McqOption.fromJson(json);
}

/// @nodoc
mixin _$McqOption {
  String get id => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $McqOptionCopyWith<McqOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $McqOptionCopyWith<$Res> {
  factory $McqOptionCopyWith(McqOption value, $Res Function(McqOption) then) =
      _$McqOptionCopyWithImpl<$Res, McqOption>;
  @useResult
  $Res call({String id, String answer});
}

/// @nodoc
class _$McqOptionCopyWithImpl<$Res, $Val extends McqOption>
    implements $McqOptionCopyWith<$Res> {
  _$McqOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_McqOptionCopyWith<$Res> implements $McqOptionCopyWith<$Res> {
  factory _$$_McqOptionCopyWith(
          _$_McqOption value, $Res Function(_$_McqOption) then) =
      __$$_McqOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String answer});
}

/// @nodoc
class __$$_McqOptionCopyWithImpl<$Res>
    extends _$McqOptionCopyWithImpl<$Res, _$_McqOption>
    implements _$$_McqOptionCopyWith<$Res> {
  __$$_McqOptionCopyWithImpl(
      _$_McqOption _value, $Res Function(_$_McqOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
  }) {
    return _then(_$_McqOption(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_McqOption implements _McqOption {
  _$_McqOption({required this.id, required this.answer});

  factory _$_McqOption.fromJson(Map<String, dynamic> json) =>
      _$$_McqOptionFromJson(json);

  @override
  final String id;
  @override
  final String answer;

  @override
  String toString() {
    return 'McqOption(id: $id, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_McqOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_McqOptionCopyWith<_$_McqOption> get copyWith =>
      __$$_McqOptionCopyWithImpl<_$_McqOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_McqOptionToJson(
      this,
    );
  }
}

abstract class _McqOption implements McqOption {
  factory _McqOption({required final String id, required final String answer}) =
      _$_McqOption;

  factory _McqOption.fromJson(Map<String, dynamic> json) =
      _$_McqOption.fromJson;

  @override
  String get id;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_McqOptionCopyWith<_$_McqOption> get copyWith =>
      throw _privateConstructorUsedError;
}
