// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postal_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostalCodeModel _$PostalCodeModelFromJson(Map<String, dynamic> json) {
  return _PostalCodeModel.fromJson(json);
}

/// @nodoc
mixin _$PostalCodeModel {
  String get miejscowosc => throw _privateConstructorUsedError;
  String get wojewodztwo => throw _privateConstructorUsedError;
  String? get ulica => throw _privateConstructorUsedError;
  String? get numer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostalCodeModelCopyWith<PostalCodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostalCodeModelCopyWith<$Res> {
  factory $PostalCodeModelCopyWith(
          PostalCodeModel value, $Res Function(PostalCodeModel) then) =
      _$PostalCodeModelCopyWithImpl<$Res, PostalCodeModel>;
  @useResult
  $Res call(
      {String miejscowosc, String wojewodztwo, String? ulica, String? numer});
}

/// @nodoc
class _$PostalCodeModelCopyWithImpl<$Res, $Val extends PostalCodeModel>
    implements $PostalCodeModelCopyWith<$Res> {
  _$PostalCodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? miejscowosc = null,
    Object? wojewodztwo = null,
    Object? ulica = freezed,
    Object? numer = freezed,
  }) {
    return _then(_value.copyWith(
      miejscowosc: null == miejscowosc
          ? _value.miejscowosc
          : miejscowosc // ignore: cast_nullable_to_non_nullable
              as String,
      wojewodztwo: null == wojewodztwo
          ? _value.wojewodztwo
          : wojewodztwo // ignore: cast_nullable_to_non_nullable
              as String,
      ulica: freezed == ulica
          ? _value.ulica
          : ulica // ignore: cast_nullable_to_non_nullable
              as String?,
      numer: freezed == numer
          ? _value.numer
          : numer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostalCodeModelImplCopyWith<$Res>
    implements $PostalCodeModelCopyWith<$Res> {
  factory _$$PostalCodeModelImplCopyWith(_$PostalCodeModelImpl value,
          $Res Function(_$PostalCodeModelImpl) then) =
      __$$PostalCodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String miejscowosc, String wojewodztwo, String? ulica, String? numer});
}

/// @nodoc
class __$$PostalCodeModelImplCopyWithImpl<$Res>
    extends _$PostalCodeModelCopyWithImpl<$Res, _$PostalCodeModelImpl>
    implements _$$PostalCodeModelImplCopyWith<$Res> {
  __$$PostalCodeModelImplCopyWithImpl(
      _$PostalCodeModelImpl _value, $Res Function(_$PostalCodeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? miejscowosc = null,
    Object? wojewodztwo = null,
    Object? ulica = freezed,
    Object? numer = freezed,
  }) {
    return _then(_$PostalCodeModelImpl(
      miejscowosc: null == miejscowosc
          ? _value.miejscowosc
          : miejscowosc // ignore: cast_nullable_to_non_nullable
              as String,
      wojewodztwo: null == wojewodztwo
          ? _value.wojewodztwo
          : wojewodztwo // ignore: cast_nullable_to_non_nullable
              as String,
      ulica: freezed == ulica
          ? _value.ulica
          : ulica // ignore: cast_nullable_to_non_nullable
              as String?,
      numer: freezed == numer
          ? _value.numer
          : numer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostalCodeModelImpl implements _PostalCodeModel {
  _$PostalCodeModelImpl(
      {required this.miejscowosc,
      required this.wojewodztwo,
      this.ulica = '',
      this.numer = ''});

  factory _$PostalCodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostalCodeModelImplFromJson(json);

  @override
  final String miejscowosc;
  @override
  final String wojewodztwo;
  @override
  @JsonKey()
  final String? ulica;
  @override
  @JsonKey()
  final String? numer;

  @override
  String toString() {
    return 'PostalCodeModel(miejscowosc: $miejscowosc, wojewodztwo: $wojewodztwo, ulica: $ulica, numer: $numer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostalCodeModelImpl &&
            (identical(other.miejscowosc, miejscowosc) ||
                other.miejscowosc == miejscowosc) &&
            (identical(other.wojewodztwo, wojewodztwo) ||
                other.wojewodztwo == wojewodztwo) &&
            (identical(other.ulica, ulica) || other.ulica == ulica) &&
            (identical(other.numer, numer) || other.numer == numer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, miejscowosc, wojewodztwo, ulica, numer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostalCodeModelImplCopyWith<_$PostalCodeModelImpl> get copyWith =>
      __$$PostalCodeModelImplCopyWithImpl<_$PostalCodeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostalCodeModelImplToJson(
      this,
    );
  }
}

abstract class _PostalCodeModel implements PostalCodeModel {
  factory _PostalCodeModel(
      {required final String miejscowosc,
      required final String wojewodztwo,
      final String? ulica,
      final String? numer}) = _$PostalCodeModelImpl;

  factory _PostalCodeModel.fromJson(Map<String, dynamic> json) =
      _$PostalCodeModelImpl.fromJson;

  @override
  String get miejscowosc;
  @override
  String get wojewodztwo;
  @override
  String? get ulica;
  @override
  String? get numer;
  @override
  @JsonKey(ignore: true)
  _$$PostalCodeModelImplCopyWith<_$PostalCodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
