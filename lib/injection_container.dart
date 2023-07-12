import 'package:betweener_app/core/network/network_info.dart';
import 'package:betweener_app/core/shared_pref/shared_pref.dart';
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
import 'package:betweener_app/feature/links/data/datasources/local_datasource.dart';
import 'package:betweener_app/feature/links/data/datasources/remote_datasource.dart';
import 'package:betweener_app/feature/links/data/repositories/repository_imp.dart';
import 'package:betweener_app/feature/links/domain/repositories/repository.dart';
import 'package:betweener_app/feature/links/domain/usecases/add_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/delete_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/edit_link_usecase.dart';
import 'package:betweener_app/feature/links/domain/usecases/get_my_links_usecase.dart';
import 'package:betweener_app/feature/links/presentation/bolc/link/link_bloc.dart';
import 'package:betweener_app/feature/share/data/datasourses/share_local_data_source.dart';
import 'package:betweener_app/feature/share/data/datasourses/share_remote_data_soursce.dart';
import 'package:betweener_app/feature/share/data/repositorises/share_repository_impl.dart';
import 'package:betweener_app/feature/share/domain/repositorises/share_repository.dart';
import 'package:betweener_app/feature/share/domain/usecases/add_share.dart';
import 'package:betweener_app/feature/share/domain/usecases/get_al_share.dart';
import 'package:betweener_app/feature/share/domain/usecases/scan_account.dart';
import 'package:betweener_app/feature/share/presentation/bloc/share/share_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
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
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl());
  // () => AuthLocalDataSourceImpl(preferences: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: sl()));

  //Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  //External
  await SharedPrefController().initSharedPref();
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  ///Share Feature
  //bloc
  sl.registerFactory(() => ShareBloc(addShareRepository: sl(), getAllSHareUseCase: sl(), scanAccountUseCase: sl()));
  //Use Case
  sl.registerLazySingleton(() => AddShareRepository(repository: sl()));
  sl.registerLazySingleton(() => GetAllSHareUseCase(repository: sl()));
  sl.registerLazySingleton(() => ScanAccountUseCase(repository: sl()));
  // Repository
  sl.registerLazySingleton<ShareRepository>(() => ShareRepositoryImpl(networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));
  // Data Source
  sl.registerLazySingleton<ShareRemoteDataSource>(() => ShareRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ShareLocalDataSource>(() => ShareLocalDataSourceImpl(preferences: sl()));

  /// Link usecase
  ///bloc
  sl.registerFactory(() => LinkBloc(editLinkUseCase: sl(), removeLinkUseCase: sl(), addLinkUseCase: sl(), getMyLinksUseCase: sl()));

  ///usecase
  sl.registerLazySingleton(() => EditLinkUseCase(repository: sl()));
  sl.registerLazySingleton(() => RemoveLinkUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddLinkUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetMyLinksUseCase(repository: sl()));

  /// repository
  sl.registerFactory<Repository>(() => RepositoryImp(localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  ///datasource
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(sharedPreferences: SharedPrefController()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp());
}
