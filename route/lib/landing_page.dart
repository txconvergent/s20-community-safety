import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/sign_in/email_sign_in.dart';
import 'services/auth.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User> (stream: auth.onAuthStateChanged, 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          // if(user == null) {
            return EmailSignIn();
           //} else {
             return HomePage(); 
           //}
         } else {
           return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        }); 
  }
}