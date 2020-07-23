import 'package:RMFlutter/app/router.gr.dart';
import 'package:RMFlutter/services/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SignInFormViewModel extends ReactiveViewModel {
  final AuthService _authService;
  String _email;
  final NavigationService _navigationService;
  String _password;

  SignInFormViewModel(
    this._authService,
    this._navigationService,
  );

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  void onEmailSaved(String value) {
    _email = value;
    notifyListeners();
  }

  void onPasswordSaved(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> signIn() async {
    await _authService.signInWithEmailAndPassword(_email, _password);
    await _navigationService.pushNamedAndRemoveUntil(
      Routes.homeView,
      predicate: (route) => false,
    );
  }

  String validator(String value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter a value.';
    } else {
      return null;
    }
  }
}
