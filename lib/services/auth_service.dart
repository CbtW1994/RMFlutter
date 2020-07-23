import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class AuthService with ReactiveServiceMixin {
  FirebaseUser _user;

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthService(this._firebaseAuth, this._googleSignIn);

  FirebaseUser get user => _user;

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    _user = result.user;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _signInWithCredential(credential);
  }

  Future<void> _signInWithCredential(AuthCredential credential) async {
    final result = await _firebaseAuth.signInWithCredential(credential);

    _user = result.user;
    notifyListeners();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();

    _user = null;
    notifyListeners();
  }

  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    _user = result.user;
    notifyListeners();
  }
}
