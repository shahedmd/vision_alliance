// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    final menuController = Get.put(MenuHoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1000.h,
              width: double.infinity,
              child: Stack(
                children: [
                  SizedBox(
                    height: 1000.h,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/placeholder.jpg',
                      image: "https://i.ibb.co/LX330Wxw/shake-hand.webp",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: [0.0, 0.9],
                          colors: [
                            green.withOpacity(1),
                            green.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  menubar(),
                  Positioned(
                    top: 300.h,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 700.h,
                        width: 850.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cusText(
                              "We Are Vision Alliance Limited",
                              Colors.white,
                              50,
                              FontWeight.bold,
                            ),
                            cusText(
                              "Empowering industries with reliable electrical and electronic solutions since 2013, Vision Alliance stands for innovation, quality, and trust. From powerplants to computer labs, we deliver the technology that drives progress. Your vision, our commitment — shaping the future with powerful, efficient, and lasting solutions built to meet tomorrow's needs.",
                              Colors.white,
                              22,
                              FontWeight.w700,
                            ),
                            SizedBox(height: 25.h),
                            cusButton2("Contact Us", green),
                          ],
                        ),
                      ),
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

            SizedBox(height: 50.h),

            SizedBox(
              width: 1000.w,
              child: cusText(
                "Vision Alliance, established in 2013, is a leading name in the electrical and electronics industry. Since our beginning, we have been committed to producing high-quality electrical and electronic products for various sectors. Our operations cover everything from manufacturing essential electronics to supplying equipment for power plants and substations. We are involved in designing and providing systems like transformers, circuit breakers, control panels, busbar systems, and more, helping industries meet their energy needs with reliable infrastructure. In addition to power solutions, we also supply computer lab equipment for schools, training centers, and institutions. With a strong focus on innovation, safety, and performance, Vision Alliance continues to grow as a trusted company in the field, delivering dependable solutions to clients across the country.",
                Colors.black,
                20,
                FontWeight.w800,
              ),
            ),
            SizedBox(height: 25.h),

            SizedBox(
              width: 1000.w,
              child: cusText(
                "We aim to bridge the gap between technology and industry by offering modern, efficient, and sustainable products that support national development. Our experienced engineering team ensures that every project is completed with precision and care. Over the years, we have built long-term relationships with clients through our dedication, timely delivery, and after-sales service. As we look to the future, we are expanding our product lines and embracing smart technology to better serve the growing demands of the electrical and electronics market. Vision Alliance remains committed to building a smarter, safer, and more connected tomorrow.",
                Colors.black,
                20,
                FontWeight.w800,
              ),
            ),

            SizedBox(height: 70.h),
            expertise(),

            SizedBox(height: 50.h),
            cusText("Our Team", green, 35, FontWeight.bold),
            SizedBox(height: 30.h),

            buildTeamSection(),
            SizedBox(height: 85.h),
            cusText("Service We Provide", green, 35, FontWeight.bold),
            SizedBox(height: 30.h),
            buildOurServicesSection(),

            SizedBox(height: 85.h),
            cusText("Our Top Rated Brands", green, 35, FontWeight.bold),
            SizedBox(height: 30.h),
            ourBrands(),

            SizedBox(height: 120.h),

            bottomNavbar(),
          ],
        ),
      ),
    );
  }
}
