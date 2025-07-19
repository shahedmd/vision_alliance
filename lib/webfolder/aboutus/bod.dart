import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';

class BoD extends StatefulWidget {
  const BoD({super.key});

  @override
  State<BoD> createState() => _BoDState();
}

class _BoDState extends State<BoD> {
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
                      top: 250.h,
                      left: 0.h,
                      right: 0.h,
                      child: SizedBox(
                        height: 300.h,
                        width: 1000.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text(
                              'Board of Directors',
                              style: TextStyle(
                                fontSize: 36.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2C3E50),
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 12.h),

                            // --------- Decorative Line ---------
                            Container(
                              height: 4.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF27AE60),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),

                            SizedBox(height: 20.h),

                            // --------- Subtitle ---------
                            Text(
                              'Meet our experienced leadership team who guide our vision and mission.',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 40.h),
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
              SizedBox(
                width: 1300.w,
                child: Wrap(
                  spacing: 30.w,
                  runSpacing: 30.h,
                  alignment: WrapAlignment.center,
                  children:
                      boardMembers.map((member) {
                        return buildDirectorCard(
                          name: member['name'],
                          designation: member['designation'],
                          imageUrl: member['image'],
                        );
                      }).toList(),
                ),
              ),

              SizedBox(height: 150.h),

              bottomNavbar()
            ],
          ),
        ),
      ),
    );
  }
}
