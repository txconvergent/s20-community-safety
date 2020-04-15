import 'package:flutter/material.dart';
import 'package:route/components/raised_button.dart';


class FormButton extends CustomRaisedButton {
  FormButton ({
    @required String text,
    VoidCallback onPressed, 
  }) : super (child: Text(text, style: TextStyle(color: Colors.white, fontSize: 20.0)),
              height: 44,
              color: Colors.indigo, 
              borderRadius: 4.0,
              onPressed: onPressed
              ); 
}