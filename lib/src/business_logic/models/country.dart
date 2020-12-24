import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';
// flutter packages pub run build_runner build

@JsonSerializable()
class Country {
  final String name;
  @JsonKey(name: 'callingCodes')
  final String alpha2Code;
  @JsonKey(name: 'alpha2Code')
  final List<dynamic> callingCodes;
  @JsonKey(name: 'flag')
  final String flag;

  const Country({this.name, this.callingCodes, this.flag, this.alpha2Code})
      : assert(name != null),
        assert(callingCodes != null),
        assert(alpha2Code != null);

  @override
  String toString() =>
      'Country{name: $name\n, alpha2Code: $alpha2Code, callingCodes: $callingCodes\n, flag: $flag\n}';

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  Country copyWith(
          {String name,
          String alpha2Code,
          List<dynamic> callingCodes,
          String flag}) =>
      Country(
          name: name ?? this.name,
          alpha2Code: alpha2Code ?? this.alpha2Code,
          callingCodes: callingCodes ?? this.callingCodes,
          flag: flag ?? this.flag);
}
