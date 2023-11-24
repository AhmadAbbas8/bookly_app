import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo),
          const SizedBox(height: 4),
          AnimatedBuilder(
            animation: slidingAnimation,
            builder: (context, child) =>
                SlideTransition(
                  position: slidingAnimation as Animation<Offset>,
                  child: const Text(
                    'Read Free Books',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 15),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
        const Duration(seconds: 2),
            () =>
        //         Get.to(
        //   const HomeView(),
        //   transition: Transition.fadeIn,
        //   duration: kTranstionDuration,
        // ),
        GoRouter.of(context).push(HomeView.kHomeView)
    );
  }

}
