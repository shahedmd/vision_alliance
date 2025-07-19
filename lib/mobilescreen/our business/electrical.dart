import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

class MobileElectronics extends StatefulWidget {
  const MobileElectronics({super.key});

  @override
  State<MobileElectronics> createState() => _MobileElectronicsState();
}

class _MobileElectronicsState extends State<MobileElectronics> {
  final GetxControllerForfirebase getxController = Get.put(
    GetxControllerForfirebase(),
  );
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
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              cusText("OUR ELECTRONICS BUSINESS", green, 18, FontWeight.bold),
              SizedBox(height: 10.h),
              SizedBox(
                height: 300.h,
                width: 350.w,
                child: Image.network(
                  "https://i.ibb.co/KcB7F23Y/p3.jpg",
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
              SizedBox(height: 10.h),
              SizedBox(
                width: 330.w,
                child: cusText(
                  "Founded in 2013, Vision Alliance is a trusted name in the electronics industry, committed to delivering world-class electronic products to both corporate and general customers. With a strong focus on quality, innovation, and customer satisfaction, we offer a wide range of advanced electronic solutions designed to meet the needs of modern life and business. Over the years, Vision Alliance has built a reputation for reliability and excellence, serving clients across diverse sectors through corporate partnerships as well as general retail sales. We continue to push boundaries in technology to provide smarter, more efficient, and high-performing products for every user.",
                  Colors.grey.shade900,
                  12,
                  FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),
              cusText(
                "Top Rated electronics Product",
                green,
                20,
                FontWeight.bold,
              ),
              SizedBox(height: 15.h),
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
                  width: 310.w,
                  child: Wrap(
                    children:
                        getxController.electronicsProductslistLimit.map((
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

              cusText("Our Brands ", green, 20, FontWeight.bold),

              SizedBox(
                width: 400.w,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children:
                      brandlist.map((product) {
                        return brandImageCard(product);
                      }).toList(),
                ),
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: 320.w,
                child: cusText(
                  "At our company, we believe that quality begins with the tools and people behind the work. That’s why we use only the best brand equipment, trusted globally for their reliability, performance, and durability. Each piece of equipment we use is carefully chosen to meet international standards and ensure long-lasting results. But great tools alone are not enough. Our true strength lies in our team of highly skilled engineers and technicians who bring years of hands-on experience and technical knowledge to every project. They are trained to handle even the most complex tasks with precision, efficiency, and attention to detail. Whether we’re working on small jobs or large-scale projects, we never compromise on quality. From planning to execution, we follow industry-best practices to make sure the job is done right the first time. Our commitment to excellence means that every project is completed to the highest standard, on time and within budget. We take pride in our reputation for dependable service, advanced technology, and professional expertise. When you choose us, you're choosing a team that values quality, safety, and customer satisfaction above all. Trust us to deliver results you can rely on—because we don’t just meet expectations, we exceed them.",
                  Colors.black,
                  12,
                  FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              cusText("Why Choose Us", green, 20, FontWeight.bold),
              SizedBox(height: 15.h,),
              mobileChooseUs(),
              SizedBox(height: 40.h,),
              mobileBottomNavbar()
            ],
          ),
        ),
      ),
    );
  }
}
