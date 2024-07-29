// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postal_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostalCodeModelImpl _$$PostalCodeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PostalCodeModelImpl(
      miejscowosc: json['miejscowosc'] as String,
      wojewodztwo: json['wojewodztwo'] as String,
      ulica: json['ulica'] as String? ?? '',
      numer: json['numer'] as String? ?? '',
    );

Map<String, dynamic> _$$PostalCodeModelImplToJson(
        _$PostalCodeModelImpl instance) =>
    <String, dynamic>{
      'miejscowosc': instance.miejscowosc,
      'wojewodztwo': instance.wojewodztwo,
      'ulica': instance.ulica,
      'numer': instance.numer,
    };
