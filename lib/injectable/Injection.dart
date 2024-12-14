import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';  // This is the generated file

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({String environment = 'prod'}) async {
  getIt.init(environment: environment);
}
