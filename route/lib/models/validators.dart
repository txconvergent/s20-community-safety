abstract class StringValidator {
  bool isValid(String text);
}

class Validator implements StringValidator {
    @override
    bool isValid (String text) {
      return text.isNotEmpty;
    }
}

class EmailPasswordsValidators {
  final StringValidator emailValidator = Validator();
  final StringValidator passwordValidator = Validator();
  final String invalidEmail = 'Email can\'t be empty';
  final String invalidPassword = 'Password can\'t be empty';
}