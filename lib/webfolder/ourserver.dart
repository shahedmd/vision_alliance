import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';

class OurService extends StatefulWidget {
  const OurService({super.key});

  @override
  State<OurService> createState() => _OurServiceState();
}

class _OurServiceState extends State<OurService> {
  final menuController = Get.put(MenuHoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 520.h,
                child: Stack(
                  children: [
                    menubar(),
                    Positioned(
                      top: 200.h,
                      left: 0,
                      right: 0,
                      child: serviceHeader(context),
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

              SizedBox(height: 50.h,),

            ourServicesPage(context),
cusText("Our Brands", green, 35, FontWeight.bold),
              ourBrands(),
              SizedBox(height: 100.h,),
              bottomNavbar()
            ],
          ),
        ),
      ),
    );
  }
}
