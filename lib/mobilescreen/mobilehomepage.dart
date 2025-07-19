import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  void initState() {
    _initSlider();
    super.initState();
  }

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;
  final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _initSlider() async {
    await getxController.fetchImageUrls();

    if (!mounted || getxController.imageUrls.isEmpty) return;

    startSlides();
  }

  void startSlides() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!_pageController.hasClients || getxController.imageUrls.isEmpty) {
        return;
      }

      _currentPage = (_currentPage + 1) % getxController.imageUrls.length;

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Vision Alliance LTD',
            style: TextStyle(fontSize: 18.sp, color: green),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 3,
        iconTheme: IconThemeData(color: green),
      ),
      drawer: mobilemMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSliderWithText(context, getxController, _pageController),
            mobileAnimatedCountdown(),
            SizedBox(height: 15.h),
            whyChooseUsMobile(),
            SizedBox(height: 15.h),

            cusText("OUR PRODUCTS", green, 20, FontWeight.bold),
            mobileOurProductContainer(),
            SizedBox(height: 15.h),
            mobilehomepageProduct(getxController),
            SizedBox(height: 20.h),
            mobileExpertise(),
            SizedBox(height: 15.h,),

            Text(
                    'Why Choose Us?',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: green,
                    ),
                  ),

                  SizedBox(height: 20.h,),
                  mobileChooseUs(),
                                    SizedBox(height: 20.h,),
mobileContactUsForm(),
SizedBox(height: 20.h,),
mobileBottomNavbar()
          ],
        ),
      ),
    );
  }
}
