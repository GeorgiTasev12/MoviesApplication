import 'package:get_it/get_it.dart';
import 'package:movies_app/services/navigation.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<NavigationService>(NavigationService());
}
