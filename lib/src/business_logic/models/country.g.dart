// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name'] as String,
    alpha2Code: json['alpha2Code'] as String,
    callingCodes: json['callingCodes'] as List<dynamic>,
    flag: json['flag'] as String,
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'alpha2Code': instance.alpha2Code,
      'callingCodes': instance.callingCodes,
      'flag': instance.flag,
    };
