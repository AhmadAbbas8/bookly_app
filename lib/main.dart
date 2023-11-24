import 'package:bookly_app/core/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const BooklyApp());
}




class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
