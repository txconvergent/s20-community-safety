import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:route/components/platform_widgets.dart';

class PlatformAlert extends PlatformWidget {
  final String title;
  final String content;
  final String cancelLabel;
  final String actionLabel;

  PlatformAlert({
    @required this.title,
    @required this.content,
              this.cancelLabel: 'Cancel',
              this.actionLabel: 'Ok'
  }): assert (title != null), assert (content != null), assert (actionLabel != null);

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS ? 
      await showCupertinoDialog<bool>(context: context, builder: (context) => this) :
      await showDialog<bool>(context: context, barrierDismissible: true, builder: (context) => this);
  }
  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAlertDialog(title: Text(title), 
          content: Text(content), 
          actions: _buildActions(context));
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return AlertDialog(title: Text(title), 
          content: Text(content), 
          actions: _buildActions(context));
  }

  List<Widget> _buildActions (BuildContext context) {
    List<Widget> actions = [PlatformAction(child: Text('Ok'), 
            onPressed: () => Navigator.of(context).pop(true))];
    if(cancelLabel != null) {
      actions.insert(0, PlatformAction(child: Text(cancelLabel), 
            onPressed: () => Navigator.of(context).pop(false)));
    }
    return actions;
  }
}

class PlatformAction extends PlatformWidget {
  final Widget child;
  final VoidCallback onPressed;

  PlatformAction({
    @required this.child,
    @required this.onPressed
  }) : assert (child != null), assert (onPressed != null);

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoDialogAction(child: child, onPressed: onPressed);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return FlatButton(child: child, onPressed: onPressed);
  }

}