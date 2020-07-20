import 'package:RMFlutter/UI/example_views/startup/startup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: Text('Startup View'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => viewModel.navigateToHome(),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
