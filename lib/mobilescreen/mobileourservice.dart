import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';

class MobileOurServicePage extends StatefulWidget {
  const MobileOurServicePage({super.key});

  @override
  State<MobileOurServicePage> createState() => _MobileOurServicePageState();
}

class _MobileOurServicePageState extends State<MobileOurServicePage> {
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
          child: Column(children: [SizedBox(height: 20.h),
          serviceHeader(context),
          SizedBox(height: 30.h,),
          SizedBox(
            width: 400.w,
            child: ourServicesPage(context)),
          SizedBox(height: 20.h,),
          buildMobileOurBrandsSection(),
          SizedBox(height: 40.h,),
          mobileBottomNavbar()
          ]),
        ),
      ),
    );
  }
}
