import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';

class MobilePowerPlant extends StatefulWidget {
  const MobilePowerPlant({super.key});

  @override
  State<MobilePowerPlant> createState() => _MobilePowerPlantState();
}

class _MobilePowerPlantState extends State<MobilePowerPlant> {
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

      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Power Plant Solutions',
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
                  'We specialize in delivering comprehensive power plant solutions designed to meet the diverse needs of industrial, commercial, and utility sectors. Our expertise spans the entire lifecycle of power generation facilities—from feasibility studies and engineering design to construction, commissioning, and ongoing operations and maintenance. We are committed to providing efficient and reliable energy solutions that ensure continuous power generation and long-term performance. Each project is tailored to meet specific technical, environmental, and regulatory requirements, whether for new plant development, capacity upgrades, or system modernization. With a strong emphasis on quality, safety, and innovation, we implement cutting-edge technologies and follow international best practices to deliver turnkey power plant projects that exceed client expectations. Whether your needs involve thermal, renewable, or hybrid power generation, our experienced team ensures seamless execution and optimal plant performance.',
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
                'Our Power Plant Services Include:',
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

              SizedBox(height: 10.h,),
              mobileChooseUs(),
              SizedBox(height: 20.h,),
              buildMobileContactCTA(context),
              SizedBox(height: 20.h,),
                          cusText("Our Brands ", green, 20, FontWeight.bold),
                          SizedBox(height: 10.h,),
SizedBox(width: 410.w, child: Wrap(
  alignment: WrapAlignment.center,
              children:
                  brandlist.map((product) {
                    return brandImageCard(product);
                  }).toList(),
            ),),

            SizedBox(height: 20.h,),
            mobileContactUsForm(),
            SizedBox(height: 50.h),

            mobileBottomNavbar()

            ],
          ),
        ),
      ),
    );
  }
}
