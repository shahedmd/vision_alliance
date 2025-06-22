import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

class Electronics extends StatefulWidget {
  const Electronics({super.key});

  @override
  State<Electronics> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );
  final menuController = Get.put(MenuHoverController());

   List<String> brandlist = [
    "https://i.ibb.co/cKRvN1g0/ha.png",
    "https://i.ibb.co/KtMBLFx/hisense.png",
    "https://i.ibb.co/nqCdD8XL/golden.png",
    "https://i.ibb.co/35gXkkh4/sony.png",
    "https://i.ibb.co/KxVdy4nh/media.png",
    "https://i.ibb.co/RGzw48Xw/general.png",
    "https://i.ibb.co/s9f4vqvD/coolit.png",

    
  ];

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
                      "OUR ELECTRONICS BUSINESS",
                      green,
                      30,
                      FontWeight.bold,
                    ),
                  ),

                  Positioned(
                    top: 180.h,
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
                                "Founded in 2013, Vision Alliance is a trusted name in the electronics industry, committed to delivering world-class electronic products to both corporate and general customers. With a strong focus on quality, innovation, and customer satisfaction, we offer a wide range of advanced electronic solutions designed to meet the needs of modern life and business. Over the years, Vision Alliance has built a reputation for reliability and excellence, serving clients across diverse sectors through corporate partnerships as well as general retail sales. We continue to push boundaries in technology to provide smarter, more efficient, and high-performing products for every user.",
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
                                "https://i.ibb.co/KcB7F23Y/p3.jpg",
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
            cusText(
              "Top Rated electronics Product",
              green,
              40,
              FontWeight.bold,
            ),
            Obx(() {
              if (getxController.electronicsProductsboollimit.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (getxController.electronicsProductslistLimit.isEmpty) {
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
                      getxController.electronicsProductslistLimit.map((product) {
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

             cusText("Our Brands ", green, 35, FontWeight.bold),

            Wrap(
              children:
                  brandlist.map((product) {
                    return brandImageCard(product);
                  }).toList(),
            ),

            SizedBox(height: 60.h),

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

                SizedBox(width: 30.w,),

                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      serviceBullet(
                        'Wide Selection of Electronics for Home, Office, and Industrial Use',
                      ),
                      serviceBullet(
                        'Sales and Support for TVs, Computers, Printers, and Smart Devices',
                      ),
                      serviceBullet(
                        'Professional Installation and Configuration Services',
                      ),
                      serviceBullet(
                        'Repair and Maintenance for a Variety of Electronic Equipment',
                      ),
                      serviceBullet(
                        'Genuine Products with Warranty and After-Sales Support',
                      ),
                      serviceBullet(
                        'Custom Solutions for Surveillance, Networking, and Automation',
                      ),
                      serviceBullet(
                        'Expert Technicians with Hands-On Experience in Electronics',
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 80.h),

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
