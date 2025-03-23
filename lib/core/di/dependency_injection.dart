import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quote_generator_mobile_app/core/local_db/local_db.dart';
import 'package:quote_generator_mobile_app/core/networking/api_service.dart';
import 'package:quote_generator_mobile_app/core/networking/dio_factory.dart';
import 'package:quote_generator_mobile_app/features/favorites/data/repos/favorites_repo.dart';
import 'package:quote_generator_mobile_app/features/favorites/logic/favorites_cubit.dart';
import 'package:quote_generator_mobile_app/features/home/data/repos/home_repo.dart';
import 'package:quote_generator_mobile_app/features/home/logic/home_cubit.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

/// Dependency Injection
Future<void> setupDi() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  // api
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  Database database = await createDatabase();

  // local db
  getIt.registerLazySingleton<LocalDB>(() => LocalDB(database));

  // home
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(apiService: getIt<ApiService>(), localDB: getIt<LocalDB>()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // favorites
  getIt.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepo(getIt<LocalDB>()),
  );
  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt<FavoritesRepo>()));
}

Future<Database> createDatabase() async {
  return await openDatabase(
    'favorites.db',
    version: 1,
    onCreate: (database, version) {
      database.execute(
        'CREATE TABLE favorites (id INTEGER PRIMARY KEY, quote TEXT, author TEXT)',
      );
    },
  );
}
