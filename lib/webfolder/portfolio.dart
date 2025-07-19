import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';

class PortfolioList extends StatefulWidget {
  const PortfolioList({super.key});

  @override
  State<PortfolioList> createState() => _PortfolioListState();
}

class _PortfolioListState extends State<PortfolioList> {

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
                      top: 250.h,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: 300.h,
                        width: 700.w,
                        child: Column(
                          children: [
                            Text(
                              "Our Portfolio",
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Over 100 successful government and private sector projects completed.",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
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
                  ),                ],
                ),
              ),
              showProtfolio(context),
              SizedBox(height: 100.h,),
              bottomNavbar()
            ],
          ),
        ),
      ),
    );
  }
}
