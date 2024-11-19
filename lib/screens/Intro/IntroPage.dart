import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/core/constants/app_constants.dart';
import 'package:my_tom/core/routes/app_routes.dart';
import 'package:my_tom/core/theme/custom_text_style.dart';
import 'package:my_tom/data/models/model_exports.dart';
import 'package:my_tom/widgets/custom_image_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<IntroData> _onboardingPages = AppConstants.onboardingPages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _onboardingPages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildIntroPage(_onboardingPages[index]);
              },
            ),
            
            // Bottom Navigation
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _onboardingPages.length,
                    effect: WormEffect(
                      dotColor: Colors.grey.shade300,
                      activeDotColor: Colors.deepPurple,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _currentPage != 0
                            ? TextButton(
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Text('Previous', style: CustomTextStyles.normalBlack.copyWith(color: Colors.white),),
                              )
                            : const SizedBox.shrink(),
                        _currentPage == _onboardingPages.length - 1
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.deepPurple,
                                  padding:const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigate to Login/Registration
                                  Get.toNamed(AppRoutes.splash);
                                },
                                child: Text(
                                  'Get Started',
                                  style: CustomTextStyles.greyBold,
                                ),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.deepPurple,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                ),
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Icon(Icons.arrow_forward),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroPage(IntroData page) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: page.gradient,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            page.iconData,
            size: 100,
            color: Colors.white,
          ),
          SizedBox(height: 30),
          Text(
            page.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              page.description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 50),
          CustomImageView(imagePath: page.image, height: 250, width: 450,)
        ],
      ),
    );
  }
}

