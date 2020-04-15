import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    final this.child,
    final this.color,
    final this.borderRadius: 2.0,
    final this.height: 50.0,
    final this.onPressed,
  }) : assert(borderRadius != null);
  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child:RaisedButton(
        child: child, 
        color: color, disabledColor: color, onPressed: onPressed, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius)))
        ));
  }
}