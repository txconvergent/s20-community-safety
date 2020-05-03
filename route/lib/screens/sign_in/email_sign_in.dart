import 'package:flutter/material.dart';
import 'package:route/theme/style.dart';

import 'components/email_sign_in_form.dart';

class EmailSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(appBar: AppBar(elevation: 2), 
            body: SingleChildScrollView(
              child: Padding(padding: EdgeInsets.symmetric(vertical: 150, horizontal: 20), 
              child:Column(
                children: <Widget>[ 
                  Text("roUTe", style: TextStyle(fontFamily: 'Hind', fontSize: 60, color: Colors.white)),
                  Card(
                  child: EmailForm.create(context))
            ]))),
            backgroundColor: appTheme().backgroundColor,   
        );
  }
}