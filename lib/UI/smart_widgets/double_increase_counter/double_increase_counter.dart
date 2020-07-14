import 'package:RMFlutter/UI/smart_widgets/double_increase_counter/double_increase_counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DoubleIncreaseCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DoubleIncreaseCounterViewModel>.reactive(
      builder: (context, viewModel, child) => GestureDetector(
        onTap: viewModel.updateCounter,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Tap to increment the Counter',
                textAlign: TextAlign.center,
              ),
              Text(viewModel.counter.toString())
            ],
          ),
        ),
      ),
      viewModelBuilder: () => DoubleIncreaseCounterViewModel(),
    );
  }
}
