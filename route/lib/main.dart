import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route/assets/style.dart';
import 'landing_page.dart';
import 'services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(create: (context) => Auth(),
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(), 
        home: LandingPage(),
        ),
    );
  }

}
