import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';

class Speech extends StatelessWidget {
  const Speech({super.key});

  @override
  Widget build(BuildContext context) {
      final menuController = Get.put(MenuHoverController());

    return Scaffold(body: SizedBox(
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
                    left: 0,
                    right: 0,
                    child: SizedBox(height: 200.h, child: Column(children: [
                      header()
                    ])),
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
        
             SizedBox(height: 48.h),
              SizedBox(
                width: 1200.w,
                height: 600.h,
                child: speechCard(
                  title: "Chairman's Speech",
                  imageUrl:
                      'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=800&q=80',
                  speech: '''At At Vision Alliance Ltd., we are committed to powering Bangladesh’s progress with excellence and responsibility. Our work spans from powerplants and substations to land development and digital innovation. As a trusted government partner, we ensure infrastructure that supports national resilience and sustainable growth.

Beyond energy, our land development initiatives support smart, inclusive communities aligned with the country's priorities. At the same time, our IT services help transform public and private sectors through modern apps, platforms, and secure digital systems tailored to local needs.

What truly sets us apart is our dedication to responsible innovation and future-readiness. Our expert teams work with integrity and passion, upholding the highest standards in safety, sustainability, and service.

Together, we are not just powering infrastructure—we are energizing lives, enabling opportunity, and building a greener tomorrow.

Thank you for your continued trust and support.''',
                  
                ),
              ),
               SizedBox(height: 80.h),
              SizedBox(
                width: 1200.w,
                height: 600.h,
                child: speechCard(
                  title: "Director's Speech",
                  imageUrl:
                      'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=crop&w=800&q=80',
                  speech: '''At At Vision Alliance Ltd., we are committed to powering Bangladesh’s progress with excellence and responsibility. Our work spans from powerplants and substations to land development and digital innovation. As a trusted government partner, we ensure infrastructure that supports national resilience and sustainable growth.

Beyond energy, our land development initiatives support smart, inclusive communities aligned with the country's priorities. At the same time, our IT services help transform public and private sectors through modern apps, platforms, and secure digital systems tailored to local needs.

What truly sets us apart is our dedication to responsible innovation and future-readiness. Our expert teams work with integrity and passion, upholding the highest standards in safety, sustainability, and service.

Together, we are not just powering infrastructure—we are energizing lives, enabling opportunity, and building a greener tomorrow.

Thank you for your continued trust and support.''',
                ),
              ),
              SizedBox(height: 100.h,),
              bottomNavbar()

          ],
        ),
      ),
    ),);
  }
}
