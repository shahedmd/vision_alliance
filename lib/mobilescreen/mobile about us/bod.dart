import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';

class MobileBOD extends StatefulWidget {
  const MobileBOD({super.key});

  @override
  State<MobileBOD> createState() => _MobileBODState();
}

class _MobileBODState extends State<MobileBOD> {
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
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Board of Directors',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2C3E50),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 3.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFF27AE60),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Meet our experienced leadership team who guide our vision and mission.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Members Cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Wrap(
                runSpacing: 20.h,
                spacing: 20.w,
                alignment: WrapAlignment.center,
                children: boardMembers.map((member) {
                  return buildDirectorCard(
                    name: member['name'],
                    designation: member['designation'],
                    imageUrl: member['image'],
                  );
                }).toList(),
              ),
            ),

            // Bottom Section
            SizedBox(height: 30.h),
mobileBottomNavbar()          ],
        ),
      ),
    );
  }
}