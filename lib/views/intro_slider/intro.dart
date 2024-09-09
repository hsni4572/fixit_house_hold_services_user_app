import 'package:fixit/constants/colors.dart';
import 'package:fixit/constants/spacing.dart';
import 'package:fixit/models/intro_model.dart';
import 'package:fixit/ui_helpers/ui_helpers.dart';
import 'package:fixit/views/auth/choose_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body: Column(
        children: [
          Sp.y(4),
          Expanded(
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  // contents of slider
                  return Slider(
                    image: slides[index].getImage(),
                    heading: slides[index].getTitle(),
                    description: slides[index].getDescription(),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Sp.y(4),
          currentIndex == 3
              ? UiHelpers.appButton(
                  bTitle: 'Continue',
                  tColor: AppColors.white,
                  bColor: AppColors.primary,
                  borderColor: AppColors.white,
                  onTap: () {
                    if (currentIndex == slides.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseAuth()),
                      );
                    }
                    _controller!.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                )
              : SizedBox(
                  height: 5.2.h,
                ),
          Sp.y(4),
        ],
      ),
      // backgroundColor: Colors.white,
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: .9.h,
      width: 2.w,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? AppColors.white : AppColors.homeGrey,
      ),
    );
  }
}

// ignore: must_be_immutable
// slider declared
class Slider extends StatelessWidget {
  String image;
  String heading;
  String description;

  Slider(
      {required this.image, required this.heading, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image given in slider
          // Image(image: AssetImage()),
          Image.asset(
            image,
            scale: .55.h,
          ),
          Sp.y(2),
          UiHelpers.appText(
            title: heading,
            fSize: 19,
            fweight: FontWeight.w700,
            fColor: AppColors.white,
          ),
          Sp.y(2.5),
          UiHelpers.appText(
            title: description,
            fSize: 13,
            fColor: AppColors.white,
          )
        ],
      ),
    );
  }
}
