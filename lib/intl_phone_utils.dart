import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';

/// Returns the country code based on the provided complete phone number.
String getCountryCodeByPhoneNumber(String completePhoneNumber) {
  for (var country in countries) {
    final String dialCode = "+${country.dialCode}";
    if (completePhoneNumber.startsWith(dialCode) &&
        (completePhoneNumber.length - dialCode.length) <= country.maxLength) {
      return country.code;
    }
  }
  return '';
}

/// Returns the country flag based on the provided complete phone number.
String getCountryFlagWidgetByPhoneNumber(String completePhoneNumber) {
  String flag = '';
  for (var country in countries) {
    final String dialCode = "+${country.dialCode}";
    if (completePhoneNumber.startsWith(dialCode) &&
        (completePhoneNumber.length - dialCode.length) <= country.maxLength) {
      flag = country.flag;
      break;
    }
  }
  return flag;
}

/// Returns the number without the country dial code based on the provided complete phone number.
String getNumberByCountryDialCode(String completePhoneNumber) {
  for (var country in countries) {
    final String dialCode = "+${country.dialCode}";
    if (completePhoneNumber.startsWith(dialCode) &&
        (completePhoneNumber.length - dialCode.length) <= country.maxLength) {
      return completePhoneNumber.replaceFirst(dialCode, '');
    }
  }
  return completePhoneNumber;
}

/// A utility class for handling phone numbers with intl_phone_field.
class IntlPhoneUtils {
  /// Returns the country code based on the provided complete phone number.
  static String getCountryCode(String completePhoneNumber) {
    // Add your implementation here or call the existing function getCountryCodeByPhoneNumber
    return getCountryCodeByPhoneNumber(completePhoneNumber);
  }

  /// Returns the country flag based on the provided complete phone number.
  static String getCountryFlag(String completePhoneNumber) {
    // Add your implementation here or call the existing function getCountryFlagWidgetByPhoneNumber
    return getCountryFlagWidgetByPhoneNumber(completePhoneNumber);
  }

  /// Returns the number without the country dial code based on the provided complete phone number.
  static String getNumberByCountryDialCode(String completePhoneNumber) {
    // Add your implementation here or call the existing function getNumberByCountryDialCode
    return getNumberByCountryDialCode(completePhoneNumber);
  }
}

class ImageFlag extends StatelessWidget {
  const ImageFlag({Key? key, required this.completePhoneNumber, this.width})
      : super(key: key);

  final String completePhoneNumber;
  final double? width;

  @override
  Widget build(BuildContext context) {
    String flag = getCountryCodeByPhoneNumber(completePhoneNumber);
    return Image.asset(
      'assets/flags/$flag.png',
      package: 'intl_phone_field',
      width: width ?? 32,
    );
  }
}
