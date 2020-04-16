import 'package:flutter/material.dart';
import 'package:route/assets/style.dart';

import 'components/email_sign_in_form.dart';

class EmailSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Sign in'), elevation: 2), 
            body: SingleChildScrollView(
              child: Padding(padding: const EdgeInsets.all(16.0), 
                child: Card(
                  child: EmailForm.create(context))
                )
              ),
            backgroundColor: appTheme().backgroundColor,
    );
  }
}