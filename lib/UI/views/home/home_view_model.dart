import 'package:RMFlutter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@injectable
class HomeViewModel extends ReactiveViewModel {
  final AuthService _authService;

  HomeViewModel(this._authService);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];

  FirebaseUser get user => _authService.user;
}
