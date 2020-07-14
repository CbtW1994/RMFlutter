import 'package:RMFlutter/UI/views/stream_example/stream_example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StreamExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamExampleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title),
        ),
        floatingActionButton: MaterialButton(
          child: Text('Change Stream Srouces'),
          onPressed: model.swapSources,
        ),
      ),
      viewModelBuilder: () => StreamExampleViewModel(),
    );
  }
}
