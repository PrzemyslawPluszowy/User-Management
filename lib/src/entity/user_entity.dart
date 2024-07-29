//drift UserModel

import 'package:drift/drift.dart';

class UserEntity extends Table {
  TextColumn get uid => text()();
  TextColumn get name => text()();
  TextColumn get surName => text()();
  TextColumn get city => text()();
  TextColumn get houseNumber => text()();
  TextColumn get postalCode => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get street => text().nullable()();
  TextColumn get flatNumber => text().nullable()();

  @override
  Set<Column> get primaryKey => {uid};
}
