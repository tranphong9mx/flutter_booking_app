import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_booking_app/src/business_logic/models/country.dart';
import 'package:http/http.dart' as HTTP;

class CountryHandle {
  static const String _BASEURL = 'https://restcountries.eu/rest/v2/region/asia';
  static const _TIMEOUT = Duration(seconds: 10);

  Future<List<Country>> getFutureListCountries() async {
    final response = await HTTP.get(_BASEURL).timeout(_TIMEOUT);
    List<Country> list;
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      list = parsed.map<Country>((json) => Country.fromJson(json)).toList();
      return list;
    } else {
      badStatusCode(response);
    }
    return list;
  }
}

badStatusCode(HTTP.Response response) {
  debugPrint('Bad status code ${response.statusCode} returned from server.');
  debugPrint('Response body ${response.body} returned from server.');
  throw Exception(
      'Bad status code ${response.statusCode} returned fromserver.');
}
