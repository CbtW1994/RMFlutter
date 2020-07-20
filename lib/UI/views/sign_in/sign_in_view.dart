import 'package:RMFlutter/UI/views/sign_in/sign_in_view_model.dart';
import 'package:RMFlutter/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mdi/mdi.dart';
import 'package:stacked/stacked.dart';

class SignInView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return ViewModelBuilder<SignInViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
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
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onChanged: viewModel.onEmailChanged,
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
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onChanged: viewModel.onPasswordChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: viewModel.signIn,
          icon: Icon(Mdi.login),
          label: Text('SIGN IN'),
        ),
      ),
      viewModelBuilder: () => locator<SignInViewModel>(),
    );
  }
}
