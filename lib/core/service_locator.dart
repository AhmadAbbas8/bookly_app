import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_news_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/newstt_books_cubit/newst_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  ServiceLocator._();

  static final instance = GetIt.instance;

  static Future<void> setup() async {
    instance.registerFactory(
        () => FeaturedBooksCubit(featuredBooksUseCase: instance()));
    instance.registerFactory(
        () => NewstBooksCubit(fetchNewestdBooksUseCase: instance()));
    instance.registerLazySingleton(
        () => FetchFeaturedBooksUseCase(homeRepo: instance()));
    instance.registerLazySingleton(
        () => FetchNewsBooksUseCase(homeRepo: instance()));
    instance.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(
        homeRemoteDataSource: instance(), homeLocalDataSource: instance()));
    instance.registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSourceImpl(instance()));
    instance.registerLazySingleton<HomeLocalDataSource>(
        () => HomeLocalDataSourceImpl());

    instance.registerLazySingleton(() => Dio());
    instance.registerLazySingleton(() => ApiService(instance()));
  }
}
