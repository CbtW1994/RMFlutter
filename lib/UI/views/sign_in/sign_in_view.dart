import 'package:RMFlutter/UI/views/sign_in/sign_in_view_model.dart';
import 'package:RMFlutter/UI/widgets/sign_in_form/sign_in_form.dart';
import 'package:RMFlutter/UI/widgets/sign_up_form/sign_up_form.dart';
import 'package:RMFlutter/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.nonReactive(
      builder: (context, viewModel, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("RMFlutter"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'SIGN IN',
                  icon: Icon(Mdi.login),
                ),
                Tab(
                  text: 'SIGN UP',
                  icon: Icon(Mdi.accountPlus),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SignInForm(),
              SignUpForm(),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => locator<SignInViewModel>(),
    );
  }
}
