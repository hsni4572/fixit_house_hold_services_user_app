import 'package:flutter/material.dart';
import 'package:fixit/constants/colors.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/intro_slider/intro.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scaleAnimation;
  Animation<double>? _fadeAnimation;
  Animation<double>? _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    // Define animations
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.elasticOut,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 360).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController!.forward();

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAll(
          duration: const Duration(seconds: 2),
          transition: Transition.fade,
          () => OnBoardingView());
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/spbg 1.png',
              scale: .5.h,
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation!,
              child: ScaleTransition(
                scale: _scaleAnimation!,
                child: RotationTransition(
                  turns:
                      AlwaysStoppedAnimation(_rotationAnimation!.value / 360),
                  child: UiHelpers.appLogo(size: .52),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/spbg 2.png',
              scale: .5.h,
            ),
          ),
        ],
      ),
    );
  }
}
