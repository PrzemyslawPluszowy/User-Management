// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_repository.dart';

// ignore_for_file: type=lint
class $UserEntityTable extends UserEntity
    with TableInfo<$UserEntityTable, UserEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _surNameMeta =
      const VerificationMeta('surName');
  @override
  late final GeneratedColumn<String> surName = GeneratedColumn<String>(
      'sur_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _houseNumberMeta =
      const VerificationMeta('houseNumber');
  @override
  late final GeneratedColumn<String> houseNumber = GeneratedColumn<String>(
      'house_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
      'street', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _flatNumberMeta =
      const VerificationMeta('flatNumber');
  @override
  late final GeneratedColumn<String> flatNumber = GeneratedColumn<String>(
      'flat_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        uid,
        name,
        surName,
        city,
        houseNumber,
        postalCode,
        createdAt,
        updatedAt,
        street,
        flatNumber
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_entity';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sur_name')) {
      context.handle(_surNameMeta,
          surName.isAcceptableOrUnknown(data['sur_name']!, _surNameMeta));
    } else if (isInserting) {
      context.missing(_surNameMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('house_number')) {
      context.handle(
          _houseNumberMeta,
          houseNumber.isAcceptableOrUnknown(
              data['house_number']!, _houseNumberMeta));
    } else if (isInserting) {
      context.missing(_houseNumberMeta);
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    } else if (isInserting) {
      context.missing(_postalCodeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('street')) {
      context.handle(_streetMeta,
          street.isAcceptableOrUnknown(data['street']!, _streetMeta));
    }
    if (data.containsKey('flat_number')) {
      context.handle(
          _flatNumberMeta,
          flatNumber.isAcceptableOrUnknown(
              data['flat_number']!, _flatNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  UserEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntityData(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      surName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sur_name'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
      houseNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}house_number'])!,
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      street: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}street']),
      flatNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}flat_number']),
    );
  }

  @override
  $UserEntityTable createAlias(String alias) {
    return $UserEntityTable(attachedDatabase, alias);
  }
}

class UserEntityData extends DataClass implements Insertable<UserEntityData> {
  final String uid;
  final String name;
  final String surName;
  final String city;
  final String houseNumber;
  final String postalCode;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? street;
  final String? flatNumber;
  const UserEntityData(
      {required this.uid,
      required this.name,
      required this.surName,
      required this.city,
      required this.houseNumber,
      required this.postalCode,
      required this.createdAt,
      this.updatedAt,
      this.street,
      this.flatNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['name'] = Variable<String>(name);
    map['sur_name'] = Variable<String>(surName);
    map['city'] = Variable<String>(city);
    map['house_number'] = Variable<String>(houseNumber);
    map['postal_code'] = Variable<String>(postalCode);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    if (!nullToAbsent || street != null) {
      map['street'] = Variable<String>(street);
    }
    if (!nullToAbsent || flatNumber != null) {
      map['flat_number'] = Variable<String>(flatNumber);
    }
    return map;
  }

  UserEntityCompanion toCompanion(bool nullToAbsent) {
    return UserEntityCompanion(
      uid: Value(uid),
      name: Value(name),
      surName: Value(surName),
      city: Value(city),
      houseNumber: Value(houseNumber),
      postalCode: Value(postalCode),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      street:
          street == null && nullToAbsent ? const Value.absent() : Value(street),
      flatNumber: flatNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(flatNumber),
    );
  }

  factory UserEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntityData(
      uid: serializer.fromJson<String>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      surName: serializer.fromJson<String>(json['surName']),
      city: serializer.fromJson<String>(json['city']),
      houseNumber: serializer.fromJson<String>(json['houseNumber']),
      postalCode: serializer.fromJson<String>(json['postalCode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      street: serializer.fromJson<String?>(json['street']),
      flatNumber: serializer.fromJson<String?>(json['flatNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'name': serializer.toJson<String>(name),
      'surName': serializer.toJson<String>(surName),
      'city': serializer.toJson<String>(city),
      'houseNumber': serializer.toJson<String>(houseNumber),
      'postalCode': serializer.toJson<String>(postalCode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'street': serializer.toJson<String?>(street),
      'flatNumber': serializer.toJson<String?>(flatNumber),
    };
  }

  UserEntityData copyWith(
          {String? uid,
          String? name,
          String? surName,
          String? city,
          String? houseNumber,
          String? postalCode,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          Value<String?> street = const Value.absent(),
          Value<String?> flatNumber = const Value.absent()}) =>
      UserEntityData(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        surName: surName ?? this.surName,
        city: city ?? this.city,
        houseNumber: houseNumber ?? this.houseNumber,
        postalCode: postalCode ?? this.postalCode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        street: street.present ? street.value : this.street,
        flatNumber: flatNumber.present ? flatNumber.value : this.flatNumber,
      );
  UserEntityData copyWithCompanion(UserEntityCompanion data) {
    return UserEntityData(
      uid: data.uid.present ? data.uid.value : this.uid,
      name: data.name.present ? data.name.value : this.name,
      surName: data.surName.present ? data.surName.value : this.surName,
      city: data.city.present ? data.city.value : this.city,
      houseNumber:
          data.houseNumber.present ? data.houseNumber.value : this.houseNumber,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      street: data.street.present ? data.street.value : this.street,
      flatNumber:
          data.flatNumber.present ? data.flatNumber.value : this.flatNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityData(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('surName: $surName, ')
          ..write('city: $city, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('postalCode: $postalCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('street: $street, ')
          ..write('flatNumber: $flatNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, name, surName, city, houseNumber,
      postalCode, createdAt, updatedAt, street, flatNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntityData &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.surName == this.surName &&
          other.city == this.city &&
          other.houseNumber == this.houseNumber &&
          other.postalCode == this.postalCode &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.street == this.street &&
          other.flatNumber == this.flatNumber);
}

class UserEntityCompanion extends UpdateCompanion<UserEntityData> {
  final Value<String> uid;
  final Value<String> name;
  final Value<String> surName;
  final Value<String> city;
  final Value<String> houseNumber;
  final Value<String> postalCode;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<String?> street;
  final Value<String?> flatNumber;
  final Value<int> rowid;
  const UserEntityCompanion({
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.surName = const Value.absent(),
    this.city = const Value.absent(),
    this.houseNumber = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.street = const Value.absent(),
    this.flatNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserEntityCompanion.insert({
    required String uid,
    required String name,
    required String surName,
    required String city,
    required String houseNumber,
    required String postalCode,
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.street = const Value.absent(),
    this.flatNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        name = Value(name),
        surName = Value(surName),
        city = Value(city),
        houseNumber = Value(houseNumber),
        postalCode = Value(postalCode),
        createdAt = Value(createdAt);
  static Insertable<UserEntityData> custom({
    Expression<String>? uid,
    Expression<String>? name,
    Expression<String>? surName,
    Expression<String>? city,
    Expression<String>? houseNumber,
    Expression<String>? postalCode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? street,
    Expression<String>? flatNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (surName != null) 'sur_name': surName,
      if (city != null) 'city': city,
      if (houseNumber != null) 'house_number': houseNumber,
      if (postalCode != null) 'postal_code': postalCode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (street != null) 'street': street,
      if (flatNumber != null) 'flat_number': flatNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserEntityCompanion copyWith(
      {Value<String>? uid,
      Value<String>? name,
      Value<String>? surName,
      Value<String>? city,
      Value<String>? houseNumber,
      Value<String>? postalCode,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<String?>? street,
      Value<String?>? flatNumber,
      Value<int>? rowid}) {
    return UserEntityCompanion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      surName: surName ?? this.surName,
      city: city ?? this.city,
      houseNumber: houseNumber ?? this.houseNumber,
      postalCode: postalCode ?? this.postalCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      street: street ?? this.street,
      flatNumber: flatNumber ?? this.flatNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surName.present) {
      map['sur_name'] = Variable<String>(surName.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (houseNumber.present) {
      map['house_number'] = Variable<String>(houseNumber.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (flatNumber.present) {
      map['flat_number'] = Variable<String>(flatNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserEntityCompanion(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('surName: $surName, ')
          ..write('city: $city, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('postalCode: $postalCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('street: $street, ')
          ..write('flatNumber: $flatNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupEntityTable extends GroupEntity
    with TableInfo<$GroupEntityTable, GroupEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [uid, name, description, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_entity';
  @override
  VerificationContext validateIntegrity(Insertable<GroupEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  GroupEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupEntityData(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $GroupEntityTable createAlias(String alias) {
    return $GroupEntityTable(attachedDatabase, alias);
  }
}

class GroupEntityData extends DataClass implements Insertable<GroupEntityData> {
  final String uid;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const GroupEntityData(
      {required this.uid,
      required this.name,
      this.description,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  GroupEntityCompanion toCompanion(bool nullToAbsent) {
    return GroupEntityCompanion(
      uid: Value(uid),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory GroupEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupEntityData(
      uid: serializer.fromJson<String>(json['uid']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  GroupEntityData copyWith(
          {String? uid,
          String? name,
          Value<String?> description = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      GroupEntityData(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  GroupEntityData copyWithCompanion(GroupEntityCompanion data) {
    return GroupEntityData(
      uid: data.uid.present ? data.uid.value : this.uid,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupEntityData(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, name, description, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupEntityData &&
          other.uid == this.uid &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GroupEntityCompanion extends UpdateCompanion<GroupEntityData> {
  final Value<String> uid;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const GroupEntityCompanion({
    this.uid = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupEntityCompanion.insert({
    required String uid,
    required String name,
    this.description = const Value.absent(),
    required DateTime createdAt,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        name = Value(name),
        createdAt = Value(createdAt);
  static Insertable<GroupEntityData> custom({
    Expression<String>? uid,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupEntityCompanion copyWith(
      {Value<String>? uid,
      Value<String>? name,
      Value<String?>? description,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return GroupEntityCompanion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupEntityCompanion(')
          ..write('uid: $uid, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserGroupEntityTable extends UserGroupEntity
    with TableInfo<$UserGroupEntityTable, UserGroupEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserGroupEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES user_entity (uid)'));
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES group_entity (uid)'));
  @override
  List<GeneratedColumn> get $columns => [userId, groupId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_group_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserGroupEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId, groupId};
  @override
  UserGroupEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserGroupEntityData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
    );
  }

  @override
  $UserGroupEntityTable createAlias(String alias) {
    return $UserGroupEntityTable(attachedDatabase, alias);
  }
}

class UserGroupEntityData extends DataClass
    implements Insertable<UserGroupEntityData> {
  final String userId;
  final String groupId;
  const UserGroupEntityData({required this.userId, required this.groupId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['group_id'] = Variable<String>(groupId);
    return map;
  }

  UserGroupEntityCompanion toCompanion(bool nullToAbsent) {
    return UserGroupEntityCompanion(
      userId: Value(userId),
      groupId: Value(groupId),
    );
  }

  factory UserGroupEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserGroupEntityData(
      userId: serializer.fromJson<String>(json['userId']),
      groupId: serializer.fromJson<String>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'groupId': serializer.toJson<String>(groupId),
    };
  }

  UserGroupEntityData copyWith({String? userId, String? groupId}) =>
      UserGroupEntityData(
        userId: userId ?? this.userId,
        groupId: groupId ?? this.groupId,
      );
  UserGroupEntityData copyWithCompanion(UserGroupEntityCompanion data) {
    return UserGroupEntityData(
      userId: data.userId.present ? data.userId.value : this.userId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserGroupEntityData(')
          ..write('userId: $userId, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserGroupEntityData &&
          other.userId == this.userId &&
          other.groupId == this.groupId);
}

class UserGroupEntityCompanion extends UpdateCompanion<UserGroupEntityData> {
  final Value<String> userId;
  final Value<String> groupId;
  final Value<int> rowid;
  const UserGroupEntityCompanion({
    this.userId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserGroupEntityCompanion.insert({
    required String userId,
    required String groupId,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        groupId = Value(groupId);
  static Insertable<UserGroupEntityData> custom({
    Expression<String>? userId,
    Expression<String>? groupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (groupId != null) 'group_id': groupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserGroupEntityCompanion copyWith(
      {Value<String>? userId, Value<String>? groupId, Value<int>? rowid}) {
    return UserGroupEntityCompanion(
      userId: userId ?? this.userId,
      groupId: groupId ?? this.groupId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserGroupEntityCompanion(')
          ..write('userId: $userId, ')
          ..write('groupId: $groupId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftRepository extends GeneratedDatabase {
  _$DriftRepository(QueryExecutor e) : super(e);
  $DriftRepositoryManager get managers => $DriftRepositoryManager(this);
  late final $UserEntityTable userEntity = $UserEntityTable(this);
  late final $GroupEntityTable groupEntity = $GroupEntityTable(this);
  late final $UserGroupEntityTable userGroupEntity =
      $UserGroupEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userEntity, groupEntity, userGroupEntity];
}

typedef $$UserEntityTableCreateCompanionBuilder = UserEntityCompanion Function({
  required String uid,
  required String name,
  required String surName,
  required String city,
  required String houseNumber,
  required String postalCode,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> street,
  Value<String?> flatNumber,
  Value<int> rowid,
});
typedef $$UserEntityTableUpdateCompanionBuilder = UserEntityCompanion Function({
  Value<String> uid,
  Value<String> name,
  Value<String> surName,
  Value<String> city,
  Value<String> houseNumber,
  Value<String> postalCode,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<String?> street,
  Value<String?> flatNumber,
  Value<int> rowid,
});

class $$UserEntityTableTableManager extends RootTableManager<
    _$DriftRepository,
    $UserEntityTable,
    UserEntityData,
    $$UserEntityTableFilterComposer,
    $$UserEntityTableOrderingComposer,
    $$UserEntityTableCreateCompanionBuilder,
    $$UserEntityTableUpdateCompanionBuilder> {
  $$UserEntityTableTableManager(_$DriftRepository db, $UserEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> surName = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<String> houseNumber = const Value.absent(),
            Value<String> postalCode = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> flatNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserEntityCompanion(
            uid: uid,
            name: name,
            surName: surName,
            city: city,
            houseNumber: houseNumber,
            postalCode: postalCode,
            createdAt: createdAt,
            updatedAt: updatedAt,
            street: street,
            flatNumber: flatNumber,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required String name,
            required String surName,
            required String city,
            required String houseNumber,
            required String postalCode,
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<String?> street = const Value.absent(),
            Value<String?> flatNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserEntityCompanion.insert(
            uid: uid,
            name: name,
            surName: surName,
            city: city,
            houseNumber: houseNumber,
            postalCode: postalCode,
            createdAt: createdAt,
            updatedAt: updatedAt,
            street: street,
            flatNumber: flatNumber,
            rowid: rowid,
          ),
        ));
}

class $$UserEntityTableFilterComposer
    extends FilterComposer<_$DriftRepository, $UserEntityTable> {
  $$UserEntityTableFilterComposer(super.$state);
  ColumnFilters<String> get uid => $state.composableBuilder(
      column: $state.table.uid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get surName => $state.composableBuilder(
      column: $state.table.surName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get city => $state.composableBuilder(
      column: $state.table.city,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get houseNumber => $state.composableBuilder(
      column: $state.table.houseNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get postalCode => $state.composableBuilder(
      column: $state.table.postalCode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get street => $state.composableBuilder(
      column: $state.table.street,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get flatNumber => $state.composableBuilder(
      column: $state.table.flatNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter userGroupEntityRefs(
      ComposableFilter Function($$UserGroupEntityTableFilterComposer f) f) {
    final $$UserGroupEntityTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uid,
            referencedTable: $state.db.userGroupEntity,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder, parentComposers) =>
                $$UserGroupEntityTableFilterComposer(ComposerState($state.db,
                    $state.db.userGroupEntity, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$UserEntityTableOrderingComposer
    extends OrderingComposer<_$DriftRepository, $UserEntityTable> {
  $$UserEntityTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uid => $state.composableBuilder(
      column: $state.table.uid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get surName => $state.composableBuilder(
      column: $state.table.surName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get city => $state.composableBuilder(
      column: $state.table.city,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get houseNumber => $state.composableBuilder(
      column: $state.table.houseNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get postalCode => $state.composableBuilder(
      column: $state.table.postalCode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get street => $state.composableBuilder(
      column: $state.table.street,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get flatNumber => $state.composableBuilder(
      column: $state.table.flatNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$GroupEntityTableCreateCompanionBuilder = GroupEntityCompanion
    Function({
  required String uid,
  required String name,
  Value<String?> description,
  required DateTime createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$GroupEntityTableUpdateCompanionBuilder = GroupEntityCompanion
    Function({
  Value<String> uid,
  Value<String> name,
  Value<String?> description,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

class $$GroupEntityTableTableManager extends RootTableManager<
    _$DriftRepository,
    $GroupEntityTable,
    GroupEntityData,
    $$GroupEntityTableFilterComposer,
    $$GroupEntityTableOrderingComposer,
    $$GroupEntityTableCreateCompanionBuilder,
    $$GroupEntityTableUpdateCompanionBuilder> {
  $$GroupEntityTableTableManager(_$DriftRepository db, $GroupEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GroupEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GroupEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupEntityCompanion(
            uid: uid,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required String name,
            Value<String?> description = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupEntityCompanion.insert(
            uid: uid,
            name: name,
            description: description,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$GroupEntityTableFilterComposer
    extends FilterComposer<_$DriftRepository, $GroupEntityTable> {
  $$GroupEntityTableFilterComposer(super.$state);
  ColumnFilters<String> get uid => $state.composableBuilder(
      column: $state.table.uid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter userGroupEntityRefs(
      ComposableFilter Function($$UserGroupEntityTableFilterComposer f) f) {
    final $$UserGroupEntityTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.uid,
            referencedTable: $state.db.userGroupEntity,
            getReferencedColumn: (t) => t.groupId,
            builder: (joinBuilder, parentComposers) =>
                $$UserGroupEntityTableFilterComposer(ComposerState($state.db,
                    $state.db.userGroupEntity, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$GroupEntityTableOrderingComposer
    extends OrderingComposer<_$DriftRepository, $GroupEntityTable> {
  $$GroupEntityTableOrderingComposer(super.$state);
  ColumnOrderings<String> get uid => $state.composableBuilder(
      column: $state.table.uid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UserGroupEntityTableCreateCompanionBuilder = UserGroupEntityCompanion
    Function({
  required String userId,
  required String groupId,
  Value<int> rowid,
});
typedef $$UserGroupEntityTableUpdateCompanionBuilder = UserGroupEntityCompanion
    Function({
  Value<String> userId,
  Value<String> groupId,
  Value<int> rowid,
});

class $$UserGroupEntityTableTableManager extends RootTableManager<
    _$DriftRepository,
    $UserGroupEntityTable,
    UserGroupEntityData,
    $$UserGroupEntityTableFilterComposer,
    $$UserGroupEntityTableOrderingComposer,
    $$UserGroupEntityTableCreateCompanionBuilder,
    $$UserGroupEntityTableUpdateCompanionBuilder> {
  $$UserGroupEntityTableTableManager(
      _$DriftRepository db, $UserGroupEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserGroupEntityTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserGroupEntityTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<String> groupId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserGroupEntityCompanion(
            userId: userId,
            groupId: groupId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String groupId,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserGroupEntityCompanion.insert(
            userId: userId,
            groupId: groupId,
            rowid: rowid,
          ),
        ));
}

class $$UserGroupEntityTableFilterComposer
    extends FilterComposer<_$DriftRepository, $UserGroupEntityTable> {
  $$UserGroupEntityTableFilterComposer(super.$state);
  $$UserEntityTableFilterComposer get userId {
    final $$UserEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.userEntity,
        getReferencedColumn: (t) => t.uid,
        builder: (joinBuilder, parentComposers) =>
            $$UserEntityTableFilterComposer(ComposerState($state.db,
                $state.db.userEntity, joinBuilder, parentComposers)));
    return composer;
  }

  $$GroupEntityTableFilterComposer get groupId {
    final $$GroupEntityTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $state.db.groupEntity,
        getReferencedColumn: (t) => t.uid,
        builder: (joinBuilder, parentComposers) =>
            $$GroupEntityTableFilterComposer(ComposerState($state.db,
                $state.db.groupEntity, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$UserGroupEntityTableOrderingComposer
    extends OrderingComposer<_$DriftRepository, $UserGroupEntityTable> {
  $$UserGroupEntityTableOrderingComposer(super.$state);
  $$UserEntityTableOrderingComposer get userId {
    final $$UserEntityTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.userEntity,
        getReferencedColumn: (t) => t.uid,
        builder: (joinBuilder, parentComposers) =>
            $$UserEntityTableOrderingComposer(ComposerState($state.db,
                $state.db.userEntity, joinBuilder, parentComposers)));
    return composer;
  }

  $$GroupEntityTableOrderingComposer get groupId {
    final $$GroupEntityTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $state.db.groupEntity,
        getReferencedColumn: (t) => t.uid,
        builder: (joinBuilder, parentComposers) =>
            $$GroupEntityTableOrderingComposer(ComposerState($state.db,
                $state.db.groupEntity, joinBuilder, parentComposers)));
    return composer;
  }
}

class $DriftRepositoryManager {
  final _$DriftRepository _db;
  $DriftRepositoryManager(this._db);
  $$UserEntityTableTableManager get userEntity =>
      $$UserEntityTableTableManager(_db, _db.userEntity);
  $$GroupEntityTableTableManager get groupEntity =>
      $$GroupEntityTableTableManager(_db, _db.groupEntity);
  $$UserGroupEntityTableTableManager get userGroupEntity =>
      $$UserGroupEntityTableTableManager(_db, _db.userGroupEntity);
}
