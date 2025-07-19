// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

class Electrical extends StatefulWidget {
  const Electrical({super.key});

  @override
  State<Electrical> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electrical> {
  final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );
  final menuController = Get.put(MenuHoverController());

  List<String> brandlist = [
    "https://i.ibb.co/ksB4yR0v/energy.png",
    "https://i.ibb.co/67P15Lsy/sparkl.png",
    "https://i.ibb.co/r2BxwNmp/cmm.png",
    "https://i.ibb.co/rGk49Wqx/perkins.png",
    "https://i.ibb.co/ymQ75tXN/ricardo.png",
    "https://i.ibb.co/Rp8cBJV8/cgm.png",

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
                    left: 0.w,
                    right: 0.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                                                    alignment: Alignment.center,

                          child: cusText(
                                                "OUR ELECTRICAL BUSINESS",
                                                green,
                                                30,
                                                FontWeight.bold,
                                              ),
                                              
                        ),

                        SizedBox(height: 25.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 500.w,
                              child: Column(
                                children: [
                                  cusText(
                                    "Founded in 2013, Vision Alliance is a trusted name in the electrical industry, committed to delivering world-class electronic products to both corporate and general customers. With a strong focus on quality, innovation, and customer satisfaction, we offer a wide range of advanced electronic solutions designed to meet the needs of modern life and business. Over the years, Vision Alliance has built a reputation for reliability and excellence, serving clients across diverse sectors through corporate partnerships as well as general retail sales. We continue to push boundaries in technology to provide smarter, more efficient, and high-performing products for every user.",
                                    Colors.grey.shade900,
                                    16,
                                    FontWeight.bold,
                                  ),
                                  SizedBox(height: 15.h,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: cusButton("CONTACT US", Colors.white)),
                                ],
                              ),
                            ),
                            SizedBox(width: 100.w),
                            SizedBox(
                              height: 400.h,
                              width: 550.w,
                              child: Image.network(
                                "https://i.ibb.co/fG40h9Qd/professionalism.jpg",
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
            cusText("Top Rated electrical Product", green, 30, FontWeight.bold),
            Obx(() {
              if (getxController.eletricalProductboollimit.value) {
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
                width: 1300.w,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children:
                      getxController.electricalProductslistlimit.map((product) {
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

            SizedBox(
              width: 1000.w,
              child: cusText(
                "At our company, we believe that quality begins with the tools and people behind the work. That’s why we use only the best brand equipment, trusted globally for their reliability, performance, and durability. Each piece of equipment we use is carefully chosen to meet international standards and ensure long-lasting results. But great tools alone are not enough. Our true strength lies in our team of highly skilled engineers and technicians who bring years of hands-on experience and technical knowledge to every project. They are trained to handle even the most complex tasks with precision, efficiency, and attention to detail. Whether we’re working on small jobs or large-scale projects, we never compromise on quality. From planning to execution, we follow industry-best practices to make sure the job is done right the first time. Our commitment to excellence means that every project is completed to the highest standard, on time and within budget. We take pride in our reputation for dependable service, advanced technology, and professional expertise. When you choose us, you're choosing a team that values quality, safety, and customer satisfaction above all. Trust us to deliver results you can rely on—because we don’t just meet expectations, we exceed them.",
                Colors.black,
                18,
                FontWeight.w600,
              ),
            ),

            SizedBox(height: 60.h),

           chooseUs(),

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
