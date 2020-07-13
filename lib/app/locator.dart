import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:RMFlutter/app/locator.iconfig.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);
