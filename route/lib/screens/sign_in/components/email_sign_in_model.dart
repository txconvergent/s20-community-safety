

import '../../../models/validators.dart';

enum FormType {signIn, register}

class EmailSignInModel with EmailPasswordsValidators {
  final String email;
  final String password;
  final FormType formType;
  final bool isLoading;
  final bool submitted;

  EmailSignInModel({
  this.email = '', 
  this.password = '', 
  this.formType = FormType.signIn, 
  this.isLoading = false,
  this.submitted = false});


  String get primaryText {
    return formType == FormType.signIn ? 'Sign in': 'Create an account';
  }

  String get secondaryText {
    return formType == FormType.signIn ? 'Need an account? Register': 'Have an account? Sign in';
  }

  bool get isValid {
    return !isLoading && emailValidator.isValid(email) && 
                  passwordValidator.isValid(password);
  }

  String get errorEmailText {
    return submitted && !emailValidator.isValid(email) ? invalidEmail: null;
  }
  String get errorPasswordText {
    return submitted && !passwordValidator.isValid(password) ? invalidPassword: null;
  }

  EmailSignInModel update({String email, String password, FormType formType, bool isLoading, bool submitted}) {
    return EmailSignInModel(email: email ?? this.email, password: password ?? this.password, formType: formType ?? this.formType,
      isLoading: isLoading ?? this.isLoading, submitted: submitted ?? this.submitted);
  }
  
}