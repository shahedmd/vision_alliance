// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';
import '../custom object/basicelement.dart';

class Webhomepage extends StatefulWidget {
  const Webhomepage({super.key});

  @override
  State<Webhomepage> createState() => _WebhomepageState();
}

class _WebhomepageState extends State<Webhomepage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;
  final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );

  final green = Color.fromARGB(255, 0, 124, 62);
  final ScrollController _productScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getxController.fetchImageUrls();

      if (getxController.imageUrls.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_pageController.hasClients) {
            startSlides();
          }
        });
      }
    });
  }

  startSlides() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < getxController.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 900),
        curve: Curves.decelerate,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _productScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1000.h,
              child: Stack(
                children: [
                  Positioned(
                    top: 130.h,
                    left: 0,
                    right: 0,
                    child: Obx(() {
                      if (getxController.imageUrls.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return SizedBox(
                        height: 1000.h,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: getxController.imageUrls.length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              getxController.imageUrls[index],
                              fit: BoxFit.cover,
                              width: double.infinity,

                              errorBuilder:
                                  (context, error, stackTrace) => Icon(
                                    Icons.broken_image,
                                    color: Colors.red,
                                  ),
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  Container(color: Colors.black.withOpacity(0.7)),
                  menubar(),

                  Positioned(
                    top: 240.h,
                    left: 220.w,
                    right: 0,
                    child: sliderTextonTop(context),
                  ),
                ],
              ),
            ),

            animatedCountdown(),
            whyChooseUs(),
            SizedBox(height: 30.h),
            ourProducts(context, _productScrollController, getxController),
            SizedBox(height: 50.h),
            bottomNavbar(),
          ],
        ),
      ),
    );
  }
}
