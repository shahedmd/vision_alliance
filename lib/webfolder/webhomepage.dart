// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';
import '../custom object/basicelement.dart';
import '../webfolder/Our Service/computer.dart';
import '../webfolder/Our Service/electrical.dart';
import '../webfolder/Our Service/electronics.dart';
import '../webfolder/Our Service/techtraining.dart';

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

                  Positioned(
                    top: 105.h,
                    left: 460.w,
                    right: 0.w,
                    bottom: 0.h,
                    child: submenu(),
                  ),
                ],
              ),
            ),

            animatedCountdown(),
            whyChooseUs(),
            SizedBox(height: 30.h),
            ourProducts(context, _productScrollController, getxController),

            SizedBox(
              height: 1280.h,
              child: Column(
                children: [
                  Container(
                    color: green,
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.h),
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

                  SizedBox(height: 70.h),

                  DefaultTabController(
                    length: 4,
                    child: Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 1100.w,
                            child: TabBar(
                              labelColor: green,
                              unselectedLabelColor: Colors.grey.shade900,
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              unselectedLabelStyle: TextStyle(fontSize: 16.sp),

                              tabs: [
                                Tab(
                                  icon: Icon(
                                    Icons.electrical_services,
                                    size: 70.r,
                                  ),
                                  text: "Electrical",
                                  iconMargin: EdgeInsets.only(bottom: 4.h),
                                ),
                                Tab(
                                  icon: Icon(
                                    Icons.electric_meter_outlined,
                                    size: 50.r,
                                  ),
                                  text: "Electronics",
                                  iconMargin: EdgeInsets.only(bottom: 4.h),
                                ),
                                Tab(
                                  icon: Icon(Icons.computer, size: 50.r),
                                  text: "Lab Equipment",
                                  iconMargin: EdgeInsets.only(bottom: 4.h),
                                ),
                                Tab(
                                  icon: Icon(Icons.school, size: 50.r),
                                  text: "Technical Training",
                                  iconMargin: EdgeInsets.only(bottom: 4.h),
                                ),
                              ],
                            ),
                          ),

                          Expanded(child: TabBarView(children: [
                               
                                electrical(),
                                 electronics(context, getxController),
                                computer(),
                                techTraining()
                              ],
                            )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50.h),
            bottomNavbar(),
          ],
        ),
      ),
    );
  }
}
