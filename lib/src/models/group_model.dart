import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_management/src/data/local/drift_repository.dart';
import 'package:user_management/utils/date_time_converter.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
abstract class GroupModel with _$GroupModel {
  factory GroupModel({
    required String uid,
    required String name,
    required String? description,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeOrNullConverter() DateTime? updatedAt,
  }) = _GroupModel;
  const GroupModel._();

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);

  factory GroupModel.fromEntity(GroupEntityData entity) {
    return GroupModel(
      uid: entity.uid,
      name: entity.name,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  GroupEntityCompanion toEntity() {
    return GroupEntityCompanion(
      uid: drift.Value(uid),
      name: drift.Value(name),
      createdAt: drift.Value(createdAt),
      description: description != null
          ? drift.Value(description)
          : const drift.Value.absent(),
      updatedAt: updatedAt != null
          ? drift.Value(updatedAt)
          : const drift.Value.absent(),
    );
  }
}
