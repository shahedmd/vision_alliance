// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';


class PowerplantandSubsatation extends StatefulWidget {
  const PowerplantandSubsatation({super.key});

  @override
  State<PowerplantandSubsatation> createState() => _PowerplantandSubsatationState();
}

class _PowerplantandSubsatationState extends State<PowerplantandSubsatation> {
   final menuController = Get.put(MenuHoverController());

  final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800.h,
              child: Stack(
                children: [
                  menubar(),

                  Positioned(
                    top: 180.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 1300.w,
                      child: Column(
                        children: [
                          cusText("POWERPLANT & SUBSTATION PRODUCT", green, 30, FontWeight.bold),
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 500.w,
                                    child: cusText(
                                      "We are committed to producing the best sub station and power plant products in the country, combining cutting-edge technology, innovation, and uncompromising quality. Serving both corporate and general customers, we offer a diverse range of high-performance electronic solutions designed to enhance everyday life and modern business operations. Our dedication to excellence has earned us a strong reputation for reliability, customer satisfaction, and continuous improvement. Through our corporate partnerships and retail presence, Vision Alliance continues to set new standards in the Bangladeshi electronics market — delivering smarter, more efficient, and truly world-class products made right here in Bangladesh.",
                                      Colors.grey.shade900,
                                      16,
                                      FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 25.h),
                                  cusButton("BUY NOW", Colors.white),
                                ],
                              ),
                              SizedBox(width: 100.w),
                              SizedBox(
                                height: 400.h,
                                width: 550.w,
                                child: Image.network(
                                  "https://i.ibb.co/BHFLMPGX/productimage-removebg-preview.png",
                                  fit: BoxFit.cover,
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
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

            cusText("Vision's Top Rated Items", green, 35, FontWeight.bold),
            SizedBox(height: 30.h,),

            Obx(() {
              if (getxController.powerplansubstationbool.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (getxController.powerplantandsubstationproduct.isEmpty) {
                return Center(
                  child: Text(
                    "No products found.",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                  ),
                );
              }
              return SizedBox(
                width: 1400.w,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children:
                      getxController.powerplantandsubstationproduct.map((product) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 30.h,
                          ),
                          child: Container(
                            width: 300.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15.r),
                                  ),
                                  child: Image.network(
                                    product.imageUrl,
                                    height: 250.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
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
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: Column(
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        product.description,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.grey.shade900,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 20.h,),
                                      cusButton("Buy Now", Colors.white)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              );
            }),
            SizedBox(height: 120.h,),
            expertise(),

            SizedBox(height: 100.h),
            cusText("OUR ADVANTAGE", green, 35, FontWeight.bold),
            SizedBox(height: 30.h),
            ourAdvantage(),
            SizedBox(height: 100.h),

            bottomNavbar(),
          ],
        ),
      ),
    );
  }
}