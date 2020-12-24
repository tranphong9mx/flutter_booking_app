import 'package:flutter_booking_app/src/business_logic/models/country.dart';

class AppData {
  final _defaultCountry =
      Country(name: 'Viet Nam', callingCodes: ['84'], alpha2Code: 'VN');
  static final AppData _appData = AppData._internal();
  String _phone;
  Country _country;
  factory AppData() => _appData;
  AppData._internal();

  String getPhone() => _phone;
  set setPhone(String phone) => this._phone = phone;
  void resetPhone() => this.setPhone = '';

  Country getCountry() => _country;
  set setCountry(Country instance) => this._country = instance;
  void resetCountry() => this._country = _defaultCountry;

  void reset() {
    resetPhone();
    resetCountry();
  }
}
