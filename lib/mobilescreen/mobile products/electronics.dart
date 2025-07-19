import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

class MobileElectronicsProducts extends StatefulWidget {
  const MobileElectronicsProducts({super.key});

  @override
  State<MobileElectronicsProducts> createState() =>
      _MobileElectronicsProductsState();
}

class _MobileElectronicsProductsState extends State<MobileElectronicsProducts> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 22.h),
            cusText("ELECTRONICS ITEMS", green, 20, FontWeight.bold),
            SizedBox(height: 10.h),
            SizedBox(
              height: 300.h,
              width: 350.w,
              child: Image.network(
                "https://i.ibb.co/BHFLMPGX/productimage-removebg-preview.png",
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
                "We are committed to producing the best electronic products in the country, combining cutting-edge technology, innovation, and uncompromising quality. Serving both corporate and general customers, we offer a diverse range of high-performance electronic solutions designed to enhance everyday life and modern business operations. Our dedication to excellence has earned us a strong reputation for reliability, customer satisfaction, and continuous improvement. Through our corporate partnerships and retail presence, Vision Alliance continues to set new standards in the Bangladeshi electronics market — delivering smarter, more efficient, and truly world-class products made right here in Bangladesh.",
                Colors.grey.shade900,
                12,
                FontWeight.bold,
              ),
            ),

            SizedBox(height: 20.h),
            cusText("Top Rated electronics Product", green, 20, FontWeight.bold),
            SizedBox(height: 15.h),

            Obx(() {
              if (getxController.electronicsbool.value) {
                return Center(child: CircularProgressIndicator());
              }
              if (getxController.electronicsProduct.isEmpty) {
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
                  alignment: WrapAlignment.center,
                  children:
                      getxController.electronicsProduct.map((product) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
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
                                    height: 200.h,
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

            SizedBox(height: 20.h),
            mobileExpertise(),
            SizedBox(height: 20.h),
            mobileChooseUs(),
            SizedBox(height: 20.h),
            mobileBottomNavbar(),
          ],
        ),
      ),
    );
  }
}
