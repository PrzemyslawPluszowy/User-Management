import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/src/data/local/drift_repository.dart';

import 'package:user_management/src/models/group_model.dart';
import 'package:user_management/utils/date_time_converter.dart';

part 'user_model.freezed.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    required String uid,
    required String name,
    required String surName,
    required String city,
    required String houseNumber,
    required String postalCode,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeOrNullConverter() DateTime? updatedAt,
    String? street,
    String? flatNumber,
    @Default(<GroupModel>[]) List<GroupModel> groups,
  }) = _UserModel;
  const UserModel._();

  UserEntityCompanion toEntity() {
    return UserEntityCompanion(
      uid: drift.Value(uid),
      name: drift.Value(name),
      surName: drift.Value(surName),
      city: drift.Value(city),
      houseNumber: drift.Value(houseNumber),
      postalCode: drift.Value(postalCode),
      createdAt: drift.Value(createdAt),
      updatedAt: updatedAt != null
          ? drift.Value(updatedAt)
          : const drift.Value.absent(),
      street: street != null ? drift.Value(street) : const drift.Value.absent(),
      flatNumber: flatNumber != null
          ? drift.Value(flatNumber)
          : const drift.Value.absent(),
    );
  }
}
