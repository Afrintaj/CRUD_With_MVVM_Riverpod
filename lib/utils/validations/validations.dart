import 'package:intl/intl.dart';
import 'package:riverpod_mvvm_crud/utils/constants/string_constants.dart';

class Validations {
  String? validateUPI(String value) {
    if (value.isEmpty) return StringConstants.emptyEmailError;
    final RegExp emailRegEx =
        RegExp(r"^[a-zA-Z0-9\.\-]{2,256}\@[a-zA-Z][a-zA-Z]{2,64}");
    if (!emailRegEx.hasMatch(value.trim())) {
      return StringConstants.upiValidateError;
    }
    return null;
  }

  static bool isEmail(String value) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return StringConstants.emptyUsernameError;
    } else if (value.trim().length < 3) {
      return StringConstants.userNameSmallLengthValidateError;
    } else if (value.trim().length > 59) {
      return StringConstants.userNameLargeLengthValidateError;
    } else if (value.contains(' ')) {
      return StringConstants.userNameSpaceValidateError;
    } else {
      return null;
    }
  }

  static String? validateFullName(String value) {
    if (value.isEmpty) {
      return StringConstants.emptyFullnameError;
    } else {
      return null;
    }
  }

  int validateDateOfBirth(String value) {
    DateFormat format =  DateFormat('dd-MM-yyyy');
    Duration duration = DateTime.now().difference(format.parse(value));
    int differenceInYears = (duration.inDays / 365).floor();
    return differenceInYears;
  }

  static String? validatePhoneNumber(String text) {
    if (text.length < 10) {
      return 'Phone Number cannot be less than 10 digits';
    } else if (text.contains(' ')) {}
    return null;
  }

  static bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'password cannot be empty';
    } else if (value.length >= 8 &&
        RegExp(r'[a-z]').hasMatch(value) &&
        RegExp(r'[1-9]').hasMatch(value) &&
        RegExp(r'[A-Z]').hasMatch(value)) {
      return null;
    } else {
      return 'Incorrect Password';
    }
  }

  String? validateEmailOrNumber(String value) {
    if (value.isEmpty) {
      return 'Please Enter Phone Number or Email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      if (value.length >= 9 && double.tryParse(value) != null) {
        print('number entered');
        return 'NumberEntered';
      } else {
        return 'Incorrect phone number or email';
      }
    } else if (value.length < 10) {
      print('error in reg num');
      return 'Incorrect phone number or email';
    }
    return null;
  }
}
