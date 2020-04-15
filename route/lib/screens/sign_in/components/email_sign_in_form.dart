import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';


import '../../../components/formButton.dart';
import '../../../components/platform_exceptions_alert.dart';
import '../../../services/auth.dart';
import 'email_sign_in_bloc.dart';
import 'email_sign_in_model.dart';


class EmailForm extends StatefulWidget {
  final EmailSignInBloc bloc;

  @override
  EmailForm({@required this.bloc});

  static Widget create(BuildContext context) {
    return Provider<EmailSignInBloc>(
      create: (_) => EmailSignInBloc(auth: Provider.of<AuthBase>(context)),
      dispose: (context, bloc) => bloc.dispose(),
      child: Consumer<EmailSignInBloc>(builder: (context, bloc, _) => EmailForm(bloc: bloc))
    );
  }
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try{
      await widget.bloc.submit();
      Navigator.of(context).pop();
    } on PlatformException catch (e) {
      PlatformExceptionAlert(title: 'Sign in failed', exception: e).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EmailSignInModel> (
      stream: widget.bloc.modelStream,
      initialData: EmailSignInModel(),
      builder: (context, snapshot) {
        return Padding(padding: const EdgeInsets.all(16.0),  
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildChildren(snapshot.data))
        );
      }
    );
    
  }


  void _switchFocus(EmailSignInModel model) {
    final newFocus = model.emailValidator.isValid(model.email) ? _passwordNode: _emailNode;
    FocusScope.of(context).requestFocus(newFocus);
  }
  void _toggleForm () {
    widget.bloc.toggleForm();
    _emailController.clear();
    _passwordController.clear();
  }


  List<Widget> _buildChildren(EmailSignInModel model) {
    return [_buildEmail(model),
            SizedBox(height: 8),
            _buildPassword(model),
            SizedBox(height: 8),
            FormButton(text: model.primaryText, onPressed: model.isValid ? _submit: null),
            SizedBox(height: 8),
            FlatButton(child: Text(model.secondaryText) , onPressed: !model.isLoading ? _toggleForm: null)];
  }

  TextField _buildEmail(EmailSignInModel model) {
    return TextField(controller: _emailController, focusNode: _emailNode,
              decoration: InputDecoration(labelText: 'Email', hintText: 'example@example.com', errorText: model.errorEmailText),
              autocorrect: false, keyboardType: TextInputType.emailAddress, textInputAction: TextInputAction.next, 
              onChanged: widget.bloc.updateEmail, enabled: model.isLoading == false,
              onEditingComplete: () => _switchFocus(model));
  }

  TextField _buildPassword(EmailSignInModel model) {
    return TextField(controller: _passwordController, focusNode: _passwordNode,
                        decoration: InputDecoration(labelText: 'Password', errorText: model.errorPasswordText), 
                        obscureText: true, textInputAction: TextInputAction.done,
                        onChanged:  widget.bloc.updatePassword, enabled: model.isLoading == false,
                        onEditingComplete: _submit);
  }
}