import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../services/auth.dart';
import 'email_sign_in_model.dart';

class EmailSignInBloc {
  final StreamController<EmailSignInModel> _modelController = StreamController<EmailSignInModel>();
  final AuthBase auth;
  EmailSignInBloc({@required this.auth});
  Stream<EmailSignInModel> get modelStream => _modelController.stream;
  EmailSignInModel _model = EmailSignInModel();
  void dispose() {
    _modelController.close();
  }

  void toggleForm() => updateStream(email: '', password: '', 
                        formType: _model.formType == FormType.signIn ? FormType.register: FormType.signIn, 
                        submitted: false, isLoading: false);

  void updateEmail(String email) => updateStream(email: email);

  void updatePassword(String password) => updateStream(password: password);

  void updateStream({String email, String password, FormType formType, bool isLoading, bool submitted}) {
    _model = _model.update(email: email, password: password, formType: formType, isLoading: isLoading, submitted: submitted);
    _modelController.add(_model);
  }

  Future<void> submit() async {
    updateStream(isLoading: true, submitted: true);
    try{
      if(_model.formType == FormType.signIn) {
        await auth.signInEmail(_model.email, _model.password);
      } else {
        await auth.createUser(_model.email, _model.password);
      }
    } catch (e) {
      updateStream(isLoading: false);
      rethrow;
    }
  }
}