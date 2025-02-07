import 'package:get_it/get_it.dart';
import 'package:realtime_innovation/utils/preference_handler.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<PreferenceHandler>(PreferenceHandler.new);
}