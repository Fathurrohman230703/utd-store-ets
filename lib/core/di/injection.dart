import 'package:get_it/get_it.dart';

import '../../data/services/splash_service.dart';
import '../network/dio_client.dart';

import '../../data/repositories/product_repository.dart';

import '../../presentation/cubit/product_cubit.dart';
import '../../data/services/crypto_service.dart';
import '../../data/services/isolate_service.dart';

final sl = GetIt.instance;

Future<void> setupInjection() async {

  sl.registerLazySingleton<SplashService>(
    () => SplashService(),
  );

  sl.registerLazySingleton<DioClient>(
    () => DioClient(),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepository(sl()),
  );

  sl.registerFactory(
    () => ProductCubit(sl()),
  );

  sl.registerLazySingleton(
  () => CryptoService(),
  );

  sl.registerLazySingleton(
  () => IsolateService(),
  );
}