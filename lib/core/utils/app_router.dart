import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: BookDetailsView.kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
      GoRoute(
        path: SearchView.kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
