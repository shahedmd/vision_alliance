import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';

class MobileSubstation extends StatefulWidget {
  const MobileSubstation({super.key});

  @override
  State<MobileSubstation> createState() => _MobileSubstationState();
}

class _MobileSubstationState extends State<MobileSubstation> {
  List<String> brandlist = [
    "https://i.ibb.co/Z6pMXLBb/energypac.webp",
    "https://i.ibb.co/n81zGpgB/edxlogo.webp",
    "https://i.ibb.co/pvcr1WPb/power-Tech.webp",
    "https://i.ibb.co/xtqyNGNZ/tvl-logo.webp",
    "https://i.ibb.co/8D3Z6CvN/powerman.webp",
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
        child: Column(
          children: [
            Text(
              'Power Substation Solutions',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),

            SizedBox(height: 20.h),
            SizedBox(
              width: 350.w,
              child: Text(
                'We specialize in delivering comprehensive power substation solutions designed to meet the diverse needs of industrial, commercial, and utility sectors. Our expertise covers every stage of the substation lifecycle—from initial concept and detailed engineering design to installation, testing, commissioning, and ongoing maintenance. We are committed to ensuring efficient and reliable power distribution systems that support uninterrupted operations and long-term performance. Our solutions are customized to align with the specific technical and regulatory requirements of each project, whether for new installations, system upgrades, or expansions. With a strong focus on quality, safety, and innovation, we use state-of-the-art technologies and adhere to international standards to deliver turnkey substation projects that exceed client expectations. Whether you require high-voltage or medium-voltage substations, our experienced team ensures seamless execution and optimal system performance.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 13.sp,
                  height: 1.6,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Text(
              'Our Substation Services Include:',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),

            SizedBox(width: 360.w, child: buildMobilePowerPlantSection()),
            SizedBox(height: 20.h),
            Text(
              'Why Choose Us?',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),

            SizedBox(height: 10.h),
            mobileChooseUs(),
            SizedBox(height: 20.h),
            buildMobileContactCTA(context),
            SizedBox(height: 20.h),
            cusText("Our Brands ", green, 20, FontWeight.bold),
            SizedBox(height: 10.h),

            SizedBox(
              width: 410.w,
              child: Wrap(
                alignment: WrapAlignment.center,
                children:
                    brandlist.map((product) {
                      return brandImageCard(product);
                    }).toList(),
              ),
            ),

            SizedBox(height: 20.h),
            mobileContactUsForm(),
            SizedBox(height: 50.h),

            mobileBottomNavbar(),
          ],
        ),
      ),
    );
  }
}
