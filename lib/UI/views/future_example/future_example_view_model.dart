import 'package:stacked/stacked.dart';

class FutureExampleViewModel extends FutureViewModel<String> {
  Future<String> _getDataFromServer() async {
    await Future.delayed(const Duration(seconds: 3));
    throw Exception('This is an exception');
  }

  @override
  Future<String> futureToRun() => _getDataFromServer();

  @override
  void onError(dynamic error) {
    // error thrown above will be sent here
    // We can show a dialog, set the error message to show on the UI
    // the UI will be rebuilt after this is called so you can set properties.
  }
}
