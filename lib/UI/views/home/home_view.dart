import 'package:RMFlutter/UI/views/home/home_view_model.dart';
import 'package:RMFlutter/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Mdi.logout),
              onPressed: viewModel.signOut,
            ),
          ],
        ),
        body: Center(
          child: Text(viewModel.user?.email ?? ''),
        ),
      ),
      viewModelBuilder: () => locator<HomeViewModel>(),
    );
  }
}
