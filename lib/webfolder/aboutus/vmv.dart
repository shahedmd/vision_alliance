import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';

class VMv extends StatefulWidget {
  const VMv({super.key});

  @override
  State<VMv> createState() => _VMvState();
}

class _VMvState extends State<VMv> {
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
                      child: SizedBox(
                        height: 300.h,
                        child: Column(children: [
                          vmvHeader(context)
                        ]),
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
                width: 1100.w,
                child: vmvCard(
                title: 'Our Vision',
                icon: Icons.visibility_outlined,
                description:
                    'At Vision Alliance Ltd., our vision is to become Bangladesh’s most trusted and forward-thinking partner in sustainable power generation, advanced land development, and cutting-edge digital innovation. We are committed to setting industry benchmarks in quality, safety, reliability, and future-readiness across every domain we operate in. Our ambition extends beyond business success—we seek to create long-term value that drives national transformation, enhances quality of life, and preserves resources for future generations. Through responsible energy infrastructure, inclusive real estate development, and scalable digital platforms, we strive to build a more connected, resilient, and sustainable society.',
                            ),
              ),
             SizedBox(height: 60.h),
            SizedBox(
              width: 1100.w,
              child: vmvCard(
                title: 'Our Mission',
                icon: Icons.flag_outlined,
                description:
                    'At Vision Alliance Ltd., our mission is to deliver high-quality, future-ready solutions across the electrical, land development, and information technology sectors of Bangladesh. We are dedicated to powering national progress through the implementation of reliable electrical and electronic infrastructure—from powerplants and substations to nationwide government projects. Our goal is to support urban growth and industrial advancement through responsible land development that balances economic opportunity with environmental stewardship. In the digital realm, we aim to build smart, secure, and user-centric applications, websites, and platforms that transform public services, streamline private business operations, and strengthen the country’s digital ecosystem. We strive to be a partner of trust for the government and private sector alike, ensuring that every service we offer is delivered with precision, transparency, and impact.',
              ),
            ),

            SizedBox(height: 60.h,),
            SizedBox(
              width: 1100.w,
              child: vmvCard(
                title: 'Our Values',
                icon: Icons.star_outlined,
                description:
                    'At Vision Alliance Ltd., our core values—integrity, innovation, sustainability, and service—are not just guiding principles but the foundation of everything we do. Integrity drives us to uphold transparency, accountability, and ethical practices in all our partnerships and operations. Innovation inspires us to continuously explore new technologies, smarter systems, and creative solutions that address real-world challenges. Sustainability ensures that our projects and decisions prioritize environmental responsibility, resource efficiency, and long-term community well-being. Service reflects our deep commitment to delivering excellence for our clients, the government, and society at large. These values influence how we design infrastructure, manage resources, empower our teams, and contribute to national development.',
              ),
            ),

            SizedBox(height: 80.h,),

            bottomNavbar()

            ],
          ),
        ),
      ),
    );
  }
}
