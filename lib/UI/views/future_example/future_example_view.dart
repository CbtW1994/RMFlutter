import 'package:RMFlutter/UI/views/future_example/future_example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FutureExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FutureExampleViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        body: viewModel.hasError
            ? Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  'An exception has occurred while running the future',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Center(
                child: viewModel.isBusy
                    ? CircularProgressIndicator()
                    : Text(viewModel.data),
              ),
      ),
      viewModelBuilder: () => FutureExampleViewModel(),
    );
  }
}
