import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route/components/platform_alert_dialog.dart';
import 'package:route/services/auth.dart';

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
    return Scaffold(appBar: AppBar(title: Text('Home Page'), 
      actions: <Widget>[
        FlatButton(
          child: Text('Logout', style: TextStyle(fontSize: 18, color: Colors.white)), 
          onPressed: () => _confirmSignOut(context))
      ],
      ),
    );
  }
}