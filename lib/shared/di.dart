import 'package:didyouknow/didyouknow/data/api/fact_api.dart';
import 'package:didyouknow/didyouknow/data/repository/fact_repository.dart';
import 'package:didyouknow/didyouknow/data/repository/fake_fact_repository.dart';
import 'package:get_it/get_it.dart';

class DependencyInjector {
  static void inject() {
    // API's
    GetIt.instance.registerSingleton<FactApi>(FactApi());

    // Repositories
    GetIt.instance.registerSingleton<FactRepository>(FakeFactRepository());
  }
}
