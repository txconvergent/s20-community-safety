import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route/components/platform_alert_dialog.dart';
import 'package:route/screens/floating_search_bar.dart';
import 'package:route/services/auth.dart';
import 'package:route/theme/style.dart';

class HomePage extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    try {
      await Provider.of<AuthBase>(context).signOut(); 
    } catch (e) {
       print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool confirmSignOut = await PlatformAlert(title: 'Logout', content: 'Are you sure you want to sign out?', cancelLabel: 'Cancel', actionLabel: 'Logout').show(context);
    if(confirmSignOut) {
      _signOut(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: FloatingAppBar(),
      floatingActionButton: RaisedButton(child: Text('+', style: TextStyle(color: Colors.white, fontSize: 20.0)),
        color: appTheme().buttonColor, shape: CircleBorder(side: BorderSide(width: 100.0)), padding: EdgeInsets.all(20.0), onPressed: () => {}),
    );
  }
}