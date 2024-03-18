import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewSlider extends StatefulWidget {
  const PageViewSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PageViewSliderState createState() => _PageViewSliderState();
}

class _PageViewSliderState extends State<PageViewSlider> {
  PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;
  final int _numPages = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: Column(
        children: [
          SizedBox(
            height: 155.h,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.fill,
                    height: 145.w,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 145.w,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 145.w,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ScrollingDotsEffect(
                dotHeight: 3.5.h,
                dotWidth: 55.w,
                activeDotColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
