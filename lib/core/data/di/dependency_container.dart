import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_flutter/core/data/di/dependency_container.config.dart';


final sl = GetIt.instance; // service locator pattern

late final String currentEnvironment;

@InjectableInit(
    initializerName: r'$initMainGetIt'
)
Future<void> resolveDependencies({required String environment}) async {
  currentEnvironment = environment;
  await sl.$initMainGetIt(environment: environment);
}
