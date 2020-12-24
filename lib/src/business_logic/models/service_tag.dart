import 'package:flutter/material.dart';

class ServiceTag {
  final String name;
  final String iconUrl;
  final Color color;

  const ServiceTag({this.name, this.iconUrl, this.color})
      : assert(name != null),
        assert(iconUrl != null);

  @override
  String toString() =>
      'Service{name: $name\n, iconUrl: $iconUrl\n, color: $color}';

  ServiceTag copyWith({String name, String iconUrl, Color color}) => ServiceTag(
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      color: color ?? this.color);
}
