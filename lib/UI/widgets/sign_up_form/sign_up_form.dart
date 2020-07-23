import 'package:RMFlutter/UI/widgets/sign_up_form/sign_up_form_view_model.dart';
import 'package:RMFlutter/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:stacked/stacked.dart';

class SignUpForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpFormViewModel>.reactive(
      builder: (context, viewModel, child) => Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onSaved: viewModel.onEmailSaved,
                validator: viewModel.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 8.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                onSaved: viewModel.onPasswordSaved,
                validator: viewModel.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 8.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: RaisedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    await viewModel.signUp();
                  }
                },
                icon: Icon(Mdi.accountPlus),
                label: Text('SIGN UP'),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => locator<SignUpFormViewModel>(),
    );
  }
}
