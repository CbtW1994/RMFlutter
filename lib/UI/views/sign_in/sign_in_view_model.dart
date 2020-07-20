import 'package:RMFlutter/app/router.gr.dart';
import 'package:RMFlutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class SignInViewModel extends ReactiveViewModel {
  final AuthService _authService;
  final DialogService _dialogService;
  final NavigationService _navigationService;

  String _email;
  String _password;

  SignInViewModel(
    this._authService,
    this._dialogService,
    this._navigationService,
  );

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  FirebaseUser get user => _authService.user;

  void onEmailChanged(String email) {
    _email = email;
    notifyListeners();
  }

  void onPasswordChanged(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> signIn() async {
    try {
      await _authService.signInWithEmailAndPassword(_email, _password);
      await _navigationService.replaceWith(Routes.homeView);
    } catch (_) {
      await _dialogService.showDialog(
        title: 'Error',
        description: 'You done forked up kid!',
      );
    }
  }
}
