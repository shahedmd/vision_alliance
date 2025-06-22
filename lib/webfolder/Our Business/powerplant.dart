import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';

class Powerplant extends StatelessWidget {
  const Powerplant({super.key});

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(MenuHoverController());

    final green = Color.fromARGB(255, 0, 124, 62);
    List<String> brandlist = [
      "https://i.ibb.co/Z6pMXLBb/energypac.webp",
      "https://i.ibb.co/n81zGpgB/edxlogo.webp",
      "https://i.ibb.co/pvcr1WPb/power-Tech.webp",
      "https://i.ibb.co/xtqyNGNZ/tvl-logo.webp",
      "https://i.ibb.co/8D3Z6CvN/powerman.webp",
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 1400.h,
              child: Stack(
                children: [
                  menubar(),
                  Positioned(
                    top: 150.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        Text(
                          'Power Plant Solutions',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: green,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 1200.w,
                          child: Text(
                            'We specialize in delivering comprehensive power plant solutions designed to meet the diverse needs of industrial, commercial, and utility sectors. Our expertise spans the entire lifecycle of power generation facilities—from feasibility studies and engineering design to construction, commissioning, and ongoing operations and maintenance. We are committed to providing efficient and reliable energy solutions that ensure continuous power generation and long-term performance. Each project is tailored to meet specific technical, environmental, and regulatory requirements, whether for new plant development, capacity upgrades, or system modernization. With a strong emphasis on quality, safety, and innovation, we implement cutting-edge technologies and follow international best practices to deliver turnkey power plant projects that exceed client expectations. Whether your needs involve thermal, renewable, or hybrid power generation, our experienced team ensures seamless execution and optimal plant performance.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 18.sp,
                              height: 1.6,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          'Our Power Plant Services Include:',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: green,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                children: [
                                  serviceBullet(
                                    'Power Plant Feasibility Study and Site Selection',
                                  ),
                                  serviceBullet(
                                    'Detailed Engineering Design and Layout Planning',
                                  ),
                                  serviceBullet(
                                    'Turbine, Generator, and Boiler Installation',
                                  ),
                                  serviceBullet(
                                    'Control System Integration and SCADA Setup',
                                  ),
                                  serviceBullet(
                                    'Electrical and Mechanical Equipment Commissioning',
                                  ),
                                  serviceBullet(
                                    'Power Plant Automation and Remote Monitoring',
                                  ),
                                  serviceBullet(
                                    'Fuel System Design (Gas, Diesel, Biomass, etc.)',
                                  ),
                                  serviceBullet(
                                    'Exhaust and Cooling System Installation',
                                  ),
                                  serviceBullet(
                                    'Environmental Compliance and Emission Control',
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: SizedBox(
                                height: 540.h,
                                width: 700.w,
                                child: Image.network(
                                  "https://i.ibb.co/1YrcQ5nV/powerplan.webp",
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 105.h,
                    left: 460.w,
                    right: 0.w,
                    bottom: 0.h,
                    child: submenu(menuController),
                  ),
                ],
              ),
            ),

            Text(
              'Why Choose Us?',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: green,
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    height: 550.h,
                    width: 700.w,
                    child: Image.network(
                      "https://i.ibb.co/D31PVtf/choose-us.webp",
                      errorBuilder:
                          (context, error, stackTrace) =>
                              Icon(Icons.broken_image, color: Colors.red),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),

                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      serviceBullet(
                        'Extensive Experience in Power Plant Projects of All Scales',
                      ),
                      serviceBullet(
                        'Expertise in Thermal, Gas, Diesel, and Renewable Plants',
                      ),
                      serviceBullet(
                        'Timely Project Execution with Proven Operational Reliability',
                      ),
                      serviceBullet(
                        'Compliance with National Grid and International Standards',
                      ),
                      serviceBullet(
                        'Robust After-Commissioning Support and Maintenance',
                      ),
                      serviceBullet(
                        'Dedicated to Safety, Efficiency, and Environmental Standards',
                      ),
                      serviceBullet(
                        'Customized Solutions Based on Fuel Type and Load Demand',
                      ),
                      serviceBullet(
                        'Team of Certified Power Plant Engineers and Technicians',
                      ),
                      serviceBullet(
                        'Optimized Cost Without Sacrificing Quality or Performance',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 40.h),
            Container(
              height: 200.h,
              color: green,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cusText(
                        "Have a question or need a custom quote?",
                        Colors.black,
                        35,
                        FontWeight.bold,
                      ),
                      SizedBox(height: 15.h),
                      cusText(
                        "Call us: +8801995767837 or Email us: info@vision-bd.com or simply",
                        Colors.black87,
                        18,
                        FontWeight.bold,
                      ),
                    ],
                  ),

                  SizedBox(width: 200.w),

                  cusButton2("Contact Us", green),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            cusText("Our Brands ", green, 35, FontWeight.bold),

            Wrap(
              children:
                  brandlist.map((product) {
                    return brandImageCard(product);
                  }).toList(),
            ),
            SizedBox(
              width: 1000.w,
              child: cusText(
                "At our company, we believe that quality begins with the tools and people behind the work. That’s why we use only the best brand equipment, trusted globally for their reliability, performance, and durability. Each piece of equipment we use is carefully chosen to meet international standards and ensure long-lasting results. But great tools alone are not enough. Our true strength lies in our team of highly skilled engineers and technicians who bring years of hands-on experience and technical knowledge to every project. They are trained to handle even the most complex tasks with precision, efficiency, and attention to detail. Whether we’re working on small jobs or large-scale projects, we never compromise on quality. From planning to execution, we follow industry-best practices to make sure the job is done right the first time. Our commitment to excellence means that every project is completed to the highest standard, on time and within budget. We take pride in our reputation for dependable service, advanced technology, and professional expertise. When you choose us, you're choosing a team that values quality, safety, and customer satisfaction above all. Trust us to deliver results you can rely on—because we don’t just meet expectations, we exceed them.",
                Colors.black,
                18,
                FontWeight.w600,
              ),
            ),
            SizedBox(height: 30.h),
            contactUsForm(),
            SizedBox(height: 80.h),
            bottomNavbar(),
          ],
        ),
      ),
    );
  }

  Widget serviceBullet(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: green, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(child: Text(text, style: TextStyle(fontSize: 20.sp))),
        ],
      ),
    );
  }
}
