import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter{
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
    ],
  );
}