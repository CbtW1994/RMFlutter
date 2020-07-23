import 'package:RMFlutter/app/router.gr.dart';
import 'package:RMFlutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class HomeViewModel extends ReactiveViewModel {
  final AuthService _authService;
  final NavigationService _navigationService;

  HomeViewModel(this._authService, this._navigationService);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  FirebaseUser get user => _authService.user;

  Future<void> signOut() async {
    await _authService.signOut();
    await _navigationService.pushNamedAndRemoveUntil(
      Routes.signInView,
      predicate: (route) => false,
    );
  }
}
