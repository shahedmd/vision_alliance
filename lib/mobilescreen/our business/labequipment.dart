import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

class MobileLabEquipment extends StatefulWidget {
  const MobileLabEquipment({super.key});

  @override
  State<MobileLabEquipment> createState() => _MobileLabEquipmentState();
}

class _MobileLabEquipmentState extends State<MobileLabEquipment> {
   final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Vision Alliance LTD',
            style: TextStyle(fontSize: 18.sp, color: green),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 3,
        iconTheme: IconThemeData(color: green),
      ),
      drawer: mobilemMenu(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22.h),
              cusText("OUR LAB EQUIPMENT BUSINESS", green, 20, FontWeight.bold),
              SizedBox(height: 10.h),
              SizedBox(
                height: 300.h,
                width: 350.w,
                child: Image.network(
                  "https://i.ibb.co/zVSjP7Qt/digital-lab.webp",
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Icon(Icons.broken_image, color: Colors.red),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: 330.w,
                child: cusText(
                  "Founded in 2013, Vision Alliance is a trusted name in the technology and lab equipment sector, dedicated to delivering cutting-edge digital solutions for educational institutions, research facilities, and corporate environments. Specializing in the production and setup of advanced lab equipment—including branded laptops (HP/Dell), desktops, and a full range of digital infrastructure—we provide everything needed to establish and maintain modern, high-performance digital labs. With a strong focus on quality, innovation, and customer satisfaction, Vision Alliance has built a solid reputation for reliability and technical excellence. From individual tech components to complete lab setups, we empower organizations with smart, scalable, and future-ready solutions tailored to the evolving demands of digital education and research",
                  Colors.grey.shade900,
                  12,
                  FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h,),
               cusText(
                  "Top Rated lab-equipment Product",
                  green,
                  20,
                  FontWeight.bold,
                ),
                SizedBox(height: 10.h,),
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
                    width: 310.w,
                    child: Wrap(
                      children:
                          getxController.labequipmnetProductslimit.map((
                            product,
                          ) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 20.h,
                              ),
                              child: Container(
                                width: 260.w,
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
                                        height: 210.h,
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
                                          if (loadingProgress == null)
                                            return child;
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
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            "BDT:${product.price}/=",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: green,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            product.description,
                                            style: TextStyle(
                                              fontSize: 12.sp,
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
          
                SizedBox(height: 20.h,),
                 Text(
                'Why Choose Us?',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),
              SizedBox(height: 15.h),
              mobileChooseUs(),
              SizedBox(height: 40.h),
              mobileBottomNavbar()
            ],
          ),
        ),
      ),
    );
  }
}
