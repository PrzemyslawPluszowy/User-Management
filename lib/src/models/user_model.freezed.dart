// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surName => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get houseNumber => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeOrNullConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get flatNumber => throw _privateConstructorUsedError;
  List<GroupModel> get groups => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String surName,
      String city,
      String houseNumber,
      String postalCode,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeOrNullConverter() DateTime? updatedAt,
      String? street,
      String? flatNumber,
      List<GroupModel> groups});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? surName = null,
    Object? city = null,
    Object? houseNumber = null,
    Object? postalCode = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? street = freezed,
    Object? flatNumber = freezed,
    Object? groups = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surName: null == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber: null == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String surName,
      String city,
      String houseNumber,
      String postalCode,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeOrNullConverter() DateTime? updatedAt,
      String? street,
      String? flatNumber,
      List<GroupModel> groups});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? surName = null,
    Object? city = null,
    Object? houseNumber = null,
    Object? postalCode = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? street = freezed,
    Object? flatNumber = freezed,
    Object? groups = null,
  }) {
    return _then(_$UserModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surName: null == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber: null == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      flatNumber: freezed == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
    ));
  }
}

/// @nodoc

class _$UserModelImpl extends _UserModel {
  _$UserModelImpl(
      {required this.uid,
      required this.name,
      required this.surName,
      required this.city,
      required this.houseNumber,
      required this.postalCode,
      @DateTimeConverter() required this.createdAt,
      @DateTimeOrNullConverter() this.updatedAt,
      this.street,
      this.flatNumber,
      final List<GroupModel> groups = const <GroupModel>[]})
      : _groups = groups,
        super._();

  @override
  final String uid;
  @override
  final String name;
  @override
  final String surName;
  @override
  final String city;
  @override
  final String houseNumber;
  @override
  final String postalCode;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @DateTimeOrNullConverter()
  final DateTime? updatedAt;
  @override
  final String? street;
  @override
  final String? flatNumber;
  final List<GroupModel> _groups;
  @override
  @JsonKey()
  List<GroupModel> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, surName: $surName, city: $city, houseNumber: $houseNumber, postalCode: $postalCode, createdAt: $createdAt, updatedAt: $updatedAt, street: $street, flatNumber: $flatNumber, groups: $groups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surName, surName) || other.surName == surName) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.flatNumber, flatNumber) ||
                other.flatNumber == flatNumber) &&
            const DeepCollectionEquality().equals(other._groups, _groups));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      surName,
      city,
      houseNumber,
      postalCode,
      createdAt,
      updatedAt,
      street,
      flatNumber,
      const DeepCollectionEquality().hash(_groups));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);
}

abstract class _UserModel extends UserModel {
  factory _UserModel(
      {required final String uid,
      required final String name,
      required final String surName,
      required final String city,
      required final String houseNumber,
      required final String postalCode,
      @DateTimeConverter() required final DateTime createdAt,
      @DateTimeOrNullConverter() final DateTime? updatedAt,
      final String? street,
      final String? flatNumber,
      final List<GroupModel> groups}) = _$UserModelImpl;
  _UserModel._() : super._();

  @override
  String get uid;
  @override
  String get name;
  @override
  String get surName;
  @override
  String get city;
  @override
  String get houseNumber;
  @override
  String get postalCode;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @DateTimeOrNullConverter()
  DateTime? get updatedAt;
  @override
  String? get street;
  @override
  String? get flatNumber;
  @override
  List<GroupModel> get groups;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
