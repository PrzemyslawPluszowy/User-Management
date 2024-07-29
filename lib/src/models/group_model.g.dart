// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupModelImpl _$$GroupModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupModelImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: const DateTimeConverter()
          .fromJson((json['createdAt'] as num).toInt()),
      updatedAt: const DateTimeOrNullConverter()
          .fromJson((json['updatedAt'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$GroupModelImplToJson(_$GroupModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'description': instance.description,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeOrNullConverter().toJson(instance.updatedAt),
    };
