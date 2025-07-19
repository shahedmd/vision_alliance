import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/pdfviwer.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';

class MobileProfile extends StatefulWidget {
  const MobileProfile({super.key});

  @override
  State<MobileProfile> createState() => _MobileProfileState();
}

class _MobileProfileState extends State<MobileProfile> {
    final pdfControler = Get.put(PdfControler());

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
            SizedBox(
              height: 400.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      "https://i.ibb.co/LX330Wxw/shake-hand.webp",
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
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: [0.0, 0.9],
                          colors: [
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Text over image
                  Positioned(
                    top: 60.h,
                    left: 16.w,
                    right: 16.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        cusText(
                          "We Are Vision Alliance Limited",
                          green,
                          22,
                          FontWeight.bold,
                        ),
                        SizedBox(height: 15.h),
                        cusText(
                          "Empowering industries with reliable electrical and electronic solutions since 2013, Vision Alliance stands for innovation, quality, and trust. From powerplants to computer labs, we deliver the technology that drives progress.",
                          Colors.white,
                          12,
                          FontWeight.w400,
                        ),
                        SizedBox(height: 20.h),
                        cusButton2("Contact Us", green, context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 350.w,
              child: cusText(
                "Vision Alliance, established in 2013, is a leading name in the electrical and electronics industry. Since our beginning, we have been committed to producing high-quality electrical and electronic products for various sectors. Our operations cover everything from manufacturing essential electronics to supplying equipment for power plants and substations. We are involved in designing and providing systems like transformers, circuit breakers, control panels, busbar systems, and more, helping industries meet their energy needs with reliable infrastructure. In addition to power solutions, we also supply computer lab equipment for schools, training centers, and institutions. With a strong focus on innovation, safety, and performance, Vision Alliance continues to grow as a trusted company in the field, delivering dependable solutions to clients across the country.",
                Colors.black,
                13,
                FontWeight.w800,
              ),
            ),
            SizedBox(height: 12.h),

            SizedBox(
              width: 350.w,
              child: cusText(
                "We aim to bridge the gap between technology and industry by offering modern, efficient, and sustainable products that support national development. Our experienced engineering team ensures that every project is completed with precision and care. Over the years, we have built long-term relationships with clients through our dedication, timely delivery, and after-sales service. As we look to the future, we are expanding our product lines and embracing smart technology to better serve the growing demands of the electrical and electronics market. Vision Alliance remains committed to building a smarter, safer, and more connected tomorrow.",
                Colors.black,
                12,
                FontWeight.w800,
              ),
            ),

            SizedBox(height: 30.h),

            mobileExpertise(),

            SizedBox(height: 40.h),

            cusText("Our Team", green, 26, FontWeight.bold),
            SizedBox(height: 25.h),
            buildMobileTeamSection(),
            SizedBox(height: 25.h),

            cusText("Service We Provide", green, 26, FontWeight.bold),
            SizedBox(height: 10.h),

            buildMobileOurServicesSection(),
            SizedBox(height: 25.h),

            cusText("Our Top Rated Brands", green, 26, FontWeight.bold),
            SizedBox(height: 10.h),

            buildMobileOurBrandsSection(),
            SizedBox(height: 25.h),

            cusText(
              "Our Govt. Permission's & Certificate",
              green,
              20,
              FontWeight.bold,
            ),
            SizedBox(height: 10.h,),
                        SizedBox(
                          width: 350.w,
                          child: pdfControler.showPdfvision(context)),

                          SizedBox(height: 30.h,),
                          mobileBottomNavbar() 

          ],
        ),
      ),
    );
  }
}
