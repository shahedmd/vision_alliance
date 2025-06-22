import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

class Labequipment extends StatefulWidget {
  const Labequipment({super.key});

  @override
  State<Labequipment> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Labequipment> {
  final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );
  final menuController = Get.put(MenuHoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 800.h,
              child: Stack(
                children: [
                  menubar(),

                  Positioned(
                    top: 160.h,
                    left: 160.w,
                    right: 0.w,
                    bottom: 0.h,
                    child: cusText(
                      "OUR LAB EQUIPMENT BUSINESS",
                      green,
                      30,
                      FontWeight.bold,
                    ),
                  ),

                  Positioned(
                    top: 220.h,
                    left: 160.w,
                    right: 0.w,
                    bottom: 0.h,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 500.w,
                              child: cusText(
                                "Founded in 2013, Vision Alliance is a trusted name in the technology and lab equipment sector, dedicated to delivering cutting-edge digital solutions for educational institutions, research facilities, and corporate environments. Specializing in the production and setup of advanced lab equipment—including branded laptops (HP/Dell), desktops, and a full range of digital infrastructure—we provide everything needed to establish and maintain modern, high-performance digital labs. With a strong focus on quality, innovation, and customer satisfaction, Vision Alliance has built a solid reputation for reliability and technical excellence. From individual tech components to complete lab setups, we empower organizations with smart, scalable, and future-ready solutions tailored to the evolving demands of digital education and research",
                                Colors.grey.shade900,
                                16,
                                FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 100.w),
                            SizedBox(
                              height: 450.h,
                              width: 550.w,
                              child: Image.network(
                                "https://i.ibb.co/zVSjP7Qt/digital-lab.webp",
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

                        Align(
                          alignment: Alignment.centerLeft,
                          child: cusButton("CONTACT US", Colors.white),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 105.h,
                    left: 460.w,
                    right: 0.w,
                    bottom: 0.h,
                    child: submenu(menuController),
                  ),
                ],
              ),
            ),
            cusText("Our Lab Equipment List", green, 40, FontWeight.bold),
            Obx(() {
              if (getxController.labequipmentboollimit.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (getxController.labequipmnetProductslimit.isEmpty) {
                return Center(
                  child: Text(
                    "No products found.",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                  ),
                );
              }
              return SizedBox(
                height: 1300.h,
                child: Wrap(
                  children:
                      getxController.labequipmnetProductslimit.map((product) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 20.h,
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
                                        "BDT:${product.price}/=",
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w500,
                                          color: green,
                                        ),
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

            Text(
              'Why Choose Us?',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    height: 550.h,
                    width: 700.w,
                    child: Image.network(
                      "https://i.ibb.co/D31PVtf/choose-us.webp",
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Icon(Icons.broken_image, color: Colors.red),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),

                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      serviceBullet(
                        'Comprehensive Setup of Computer Labs for Educational and Training Institutions',
                      ),
                      serviceBullet(
                        'Installation and Configuration of PCs, Networking, and Server Systems',
                      ),
                      serviceBullet(
                        'Expertise in Digital Learning Tools, Interactive Boards, and Smart Classrooms',
                      ),
                      serviceBullet(
                        'Structured Cabling and Network Security with Reliable Internet Access',
                      ),
                      serviceBullet(
                        'Ongoing Technical Support, Troubleshooting, and Maintenance Services',
                      ),
                      serviceBullet(
                        'Adherence to Safety Protocols and Modern IT Standards',
                      ),
                     
                     
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 120.h),

            bottomNavbar(),
          ],
        ),
      ),
    );
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
}
