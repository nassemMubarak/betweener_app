import 'package:betweener_app/core/network/network_info.dart';
import 'package:betweener_app/feature/auth/data/datasources/auth_local_data_source.dart';
import 'package:betweener_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:betweener_app/feature/auth/data/repositorises/auth_repository_impl.dart';
import 'package:betweener_app/feature/auth/domain/repositorises/auth_repositorys.dart';
import 'package:betweener_app/feature/auth/domain/usecase/get_current_user.dart';
import 'package:betweener_app/feature/auth/domain/usecase/login_user.dart';
import 'package:betweener_app/feature/auth/domain/usecase/login_with_google.dart';
import 'package:betweener_app/feature/auth/domain/usecase/logout.dart';
import 'package:betweener_app/feature/auth/domain/usecase/register_user.dart';
import 'package:betweener_app/feature/auth/prssentation/bloc/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
GetIt sl = GetIt.instance;

Future<void> init()async{
  ///Feature Auth
  // Bloc
  sl.registerFactory(() => AuthBloc(loginUserUseCase: sl(), registerUserUseCase: sl(), getCurrentUserUseCase: sl(), loginWithGoogleUserUseCase: sl(), logoutUseCase: sl()));

  //Use Case
  sl.registerLazySingleton(() => GetCurrentUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  // Data Source
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(preferences: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: sl()));

  //Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  //External
  final SharedPreferences preferences =await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());



}