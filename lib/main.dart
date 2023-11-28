import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/newstt_books_cubit/newst_books_cubit.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.initFlutter();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await ServiceLocator.setup();

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ServiceLocator.instance.get<FeaturedBooksCubit>()
            ..fetchFeaturedBooks(pageNumber: 10),
        ),
        BlocProvider(
          create: (context) => ServiceLocator.instance<NewstBooksCubit>(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: TextTheme(
              bodyMedium: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )),
        ),

        // home: const SplashView(),

        routerConfig: AppRouter.router,
      ),
    );
  }
}
