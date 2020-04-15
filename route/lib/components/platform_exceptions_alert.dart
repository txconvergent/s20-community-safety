import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_alert_dialog.dart';
class PlatformExceptionAlert extends PlatformAlert {
  final PlatformException exception;
  final String title;
  
  PlatformExceptionAlert({
    @required this.title,
    @required this.exception
  }) : super (
    title: title,
    content: _message(exception), 
    actionLabel: 'Ok'
  );

  static String _message(PlatformException exception) {
    return errors[exception.message] ?? exception.message;
  }

  static Map<String, String> errors = {
  'ERROR_WEAK_PASSWORD' : 'The password is not strong enough.',
  'ERROR_INVALID_EMAIL' : 'The email is invalid.',
  'ERROR_EMAIL_ALREADY_IN_USE' : 'The email is already in use.',
  'ERROR_WRONG_PASSWORD' : 'The password is invalid',
  'ERROR_USER_NOT_FOUND' : 'The user could not be found.',
  'ERROR_USER_DISABLED' : 'The user is disabled',
  'ERROR_TOO_MANY_REQUESTS' : 'There were too many attempts to sign in as this user.',
  'ERROR_OPERATION_NOT_ALLOWED' : 'Indicates that Email & Password accounts are not enabled.'
  };
}