// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mcqresponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

McqResponse _$McqResponseFromJson(Map<String, dynamic> json) {
  return _McqResponse.fromJson(json);
}

/// @nodoc
mixin _$McqResponse {
  String get id => throw _privateConstructorUsedError;
  List<McqOption> get correctOptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $McqResponseCopyWith<McqResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $McqResponseCopyWith<$Res> {
  factory $McqResponseCopyWith(
          McqResponse value, $Res Function(McqResponse) then) =
      _$McqResponseCopyWithImpl<$Res, McqResponse>;
  @useResult
  $Res call({String id, List<McqOption> correctOptions});
}

/// @nodoc
class _$McqResponseCopyWithImpl<$Res, $Val extends McqResponse>
    implements $McqResponseCopyWith<$Res> {
  _$McqResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? correctOptions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      correctOptions: null == correctOptions
          ? _value.correctOptions
          : correctOptions // ignore: cast_nullable_to_non_nullable
              as List<McqOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_McqResponseCopyWith<$Res>
    implements $McqResponseCopyWith<$Res> {
  factory _$$_McqResponseCopyWith(
          _$_McqResponse value, $Res Function(_$_McqResponse) then) =
      __$$_McqResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, List<McqOption> correctOptions});
}

/// @nodoc
class __$$_McqResponseCopyWithImpl<$Res>
    extends _$McqResponseCopyWithImpl<$Res, _$_McqResponse>
    implements _$$_McqResponseCopyWith<$Res> {
  __$$_McqResponseCopyWithImpl(
      _$_McqResponse _value, $Res Function(_$_McqResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? correctOptions = null,
  }) {
    return _then(_$_McqResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      correctOptions: null == correctOptions
          ? _value._correctOptions
          : correctOptions // ignore: cast_nullable_to_non_nullable
              as List<McqOption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_McqResponse implements _McqResponse {
  _$_McqResponse(
      {required this.id, required final List<McqOption> correctOptions})
      : _correctOptions = correctOptions;

  factory _$_McqResponse.fromJson(Map<String, dynamic> json) =>
      _$$_McqResponseFromJson(json);

  @override
  final String id;
  final List<McqOption> _correctOptions;
  @override
  List<McqOption> get correctOptions {
    if (_correctOptions is EqualUnmodifiableListView) return _correctOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctOptions);
  }

  @override
  String toString() {
    return 'McqResponse(id: $id, correctOptions: $correctOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_McqResponse &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._correctOptions, _correctOptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_correctOptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_McqResponseCopyWith<_$_McqResponse> get copyWith =>
      __$$_McqResponseCopyWithImpl<_$_McqResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_McqResponseToJson(
      this,
    );
  }
}

abstract class _McqResponse implements McqResponse {
  factory _McqResponse(
      {required final String id,
      required final List<McqOption> correctOptions}) = _$_McqResponse;

  factory _McqResponse.fromJson(Map<String, dynamic> json) =
      _$_McqResponse.fromJson;

  @override
  String get id;
  @override
  List<McqOption> get correctOptions;
  @override
  @JsonKey(ignore: true)
  _$$_McqResponseCopyWith<_$_McqResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
