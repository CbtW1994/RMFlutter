// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:RMFlutter/services/api.dart';
import 'package:RMFlutter/services/counter_service.dart';
import 'package:RMFlutter/modules/third_party_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:RMFlutter/services/media_service.dart';
import 'package:RMFlutter/UI/views/sign_in/sign_in_view_model.dart';
import 'package:RMFlutter/services/auth_service.dart';
import 'package:RMFlutter/UI/views/home/home_view_model.dart';
import 'package:RMFlutter/UI/widgets/sign_in_form/sign_in_form_view_model.dart';
import 'package:RMFlutter/UI/widgets/sign_up_form/sign_up_form_view_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<Api>(() => Api());
  g.registerLazySingleton<CounterService>(() => CounterService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<FirebaseAuth>(
      () => thirdPartyServicesModule.firebaseAuth);
  g.registerLazySingleton<GoogleSignIn>(
      () => thirdPartyServicesModule.googleSignIn);
  g.registerLazySingleton<MediaService>(() => MediaService());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerFactory<SignInViewModel>(() => SignInViewModel());
  g.registerLazySingleton<AuthService>(
      () => AuthService(g<FirebaseAuth>(), g<GoogleSignIn>()));
  g.registerFactory<HomeViewModel>(
      () => HomeViewModel(g<AuthService>(), g<NavigationService>()));
  g.registerFactory<SignInFormViewModel>(
      () => SignInFormViewModel(g<AuthService>(), g<NavigationService>()));
  g.registerFactory<SignUpFormViewModel>(
      () => SignUpFormViewModel(g<AuthService>(), g<NavigationService>()));
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
}
