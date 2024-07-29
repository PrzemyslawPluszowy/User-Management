import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, int> {
  const DateTimeConverter();

  @override
  DateTime fromJson(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time);
  }

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}

class DateTimeOrNullConverter implements JsonConverter<DateTime?, int?> {
  const DateTimeOrNullConverter();

  @override
  DateTime? fromJson(int? time) {
    return time != null ? DateTime.fromMillisecondsSinceEpoch(time) : null;
  }

  @override
  int? toJson(DateTime? date) => date?.millisecondsSinceEpoch;
}
