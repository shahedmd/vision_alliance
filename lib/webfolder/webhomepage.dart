// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';
import 'package:vision_alliance/webfolder/tabbar.dart';
import '../custom object/basicelement.dart';
import 'package:cached_network_image/cached_network_image.dart';

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

  final menuController = Get.put(MenuHoverController());

  final green = Color.fromARGB(255, 0, 124, 62);
  final ScrollController _productScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initSlider();
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
                  Positioned.fill(
                    top: 130.h,
                    left: 0,
                    right: 0,
                    child: buildSlider(),
                  ),
                  Container(color: Colors.black.withOpacity(0.7)),
                  menubar(),

                  Positioned(
                    top: 240.h,
                    left: 0.w,
                    right: 0.w,
                    child: sliderTextonTop(context),
                  ),

                  Positioned(
                    top: 105.h,
                    left: 0.w,
                    right: 0.w,
                    child: Center(
                      child: SizedBox(
                        width: 1300.w,
                        height: 520.h,
                        child: Padding(
                      padding: EdgeInsets.only(left: 390.w),
                          child: submenu(menuController),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            animatedCountdown(),
            whyChooseUs(),
            SizedBox(height: 60.h),
            ourProducts(context, _productScrollController, getxController),

            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    color: green,
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 80.h),
                        child: cusText(
                          "OUR SERVICE",
                          Colors.white,
                          35,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: 1100.w,
                    child: Text(
                      "🔔 We proudly serve as a one-stop solution for Electrical, Electronics, IT Support, and Power System needs. With a steadfast commitment to quality, innovation, and customer satisfaction, we offer a comprehensive range of products and services tailored to meet the evolving demands of both residential and industrial clients. From advanced home appliances like ACs, TVs, fridges, and washing machines, to industrial-grade electrical systems including transformers, LT/ST panels, DB boards, and circuit breakers — we ensure durability, efficiency, and safety at every level. Our IT support division delivers cutting-edge desktop and laptop solutions with professional assistance for seamless business operations. Additionally, we are experienced in power plant setup, substation construction, and lightning protection systems, playing a crucial role in national infrastructure development. Whether you're upgrading your home, powering a factory, or setting up smart systems, we’re here with the right expertise, products, and after-sales service to power your future.",
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  DynamicTabSection(
                    getxController: getxController,
                    green: green,
                  ),

                  SizedBox(height: 70.h),

                  expertise(),
                  SizedBox(height: 60.h),

                  Text(
                    'Why Choose Us?',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: green,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  chooseUs()
                ],
              ),
            ),

            SizedBox(height: 50.h),
            contactUsForm(),

            SizedBox(height: 50.h),
            bottomNavbar(),
          ],
        ),
      ),
    );
  }

  Widget buildSlider() {
    return Obx(() {
      if (getxController.imageUrls.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return PageView.builder(
        controller: _pageController,
        itemCount: getxController.imageUrls.length,
        itemBuilder:
            (_, i) => CachedNetworkImage(
              imageUrl: getxController.imageUrls[i],
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder:
                  (c, _) => const Center(child: CircularProgressIndicator()),
              errorWidget: (c, _, __) => const Icon(Icons.broken_image),
              memCacheWidth: 1200,
            ),
      );
    });
  }
}

Widget serviceBullet(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: Row(
      children: [
        Icon(Icons.check_circle, color: green, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(child: Text(text, style: TextStyle(fontSize: 20.sp))),
      ],
    ),
  );
}
