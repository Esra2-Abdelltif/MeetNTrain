
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meet_n_train_app/core/api/api_consumer.dart';
import 'package:meet_n_train_app/core/api/app_interceptors.dart';
import 'package:meet_n_train_app/core/api/dio_consumer..dart';
import 'package:meet_n_train_app/core/network/network_info.dart';
import 'package:meet_n_train_app/features/data/data_sources/get_events_datasource.dart';
import 'package:meet_n_train_app/features/data/repositories/events_repository.dart';
import 'package:meet_n_train_app/features/domain/repositories/base_events_repository.dart';
import 'package:meet_n_train_app/features/domain/use_cases/get_events_usecase.dart';
import 'package:meet_n_train_app/features/presentation/cubit/events_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
class ServicesLocater {
  Future<void> init() async {
    // bloc
    getIt.registerFactory(() => EventsCubit(getEventsUseCase: getIt()));
    // usecases
    getIt.registerLazySingleton<GetEventsUseCase>(() => GetEventsUseCase(getIt()));

    // repository
    getIt.registerLazySingleton<BaseEventsReporsitory>(() => EventRepository(eventsRemoteDataSource: getIt(),networkInfo:  getIt()));
    // datasources
    getIt.registerLazySingleton<BaseEventsRemoteDataSource>(() => EventsRemoteDataSourceImplement());



      //! core
    getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(connectionChecker: getIt()));
    getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: getIt()));
    //! external
    final sharedPreference = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreference);
    getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true));
    getIt.registerLazySingleton(() => AppIntercepters());
    getIt.registerLazySingleton(() => InternetConnectionChecker()
    );
  }
}
