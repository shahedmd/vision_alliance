// ignore_for_file: deprecated_member_use, non_constant_identifier_names, avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/custom%20object/menuhovercontroller.dart';
import 'package:vision_alliance/webfolder/Our%20Business/electrical.dart';
import 'package:vision_alliance/webfolder/Our%20Business/electronics.dart';
import 'package:vision_alliance/webfolder/Our%20Business/labequipment.dart';
import 'package:vision_alliance/webfolder/Our%20Business/powerplant.dart';
import 'package:vision_alliance/webfolder/Our%20Business/substation.dart';
import 'package:vision_alliance/webfolder/aboutus/bod.dart';
import 'package:vision_alliance/webfolder/aboutus/chairmans.dart';
import 'package:vision_alliance/webfolder/aboutus/companyprofile.dart';
import 'package:vision_alliance/webfolder/aboutus/vmv.dart';
import 'package:vision_alliance/webfolder/our%20products/p&s.dart';
import 'package:vision_alliance/webfolder/our%20products/computer.dart';
import 'package:vision_alliance/webfolder/our%20products/electrical.dart';
import 'package:vision_alliance/webfolder/our%20products/electronics.dart';
import 'package:vision_alliance/webfolder/ourserver.dart';
import 'package:vision_alliance/webfolder/webhomepage.dart';
import '../webfolder/F.B getxcontroller/getxControllerFB.dart';

final green = Color.fromARGB(255, 0, 124, 62);

RxBool isHover = false.obs;
RxBool isEnter = false.obs;
RxBool isHoverourBusiness = false.obs;
RxBool isEnterourBusiness = false.obs;
RxBool isHoverourProducts = false.obs;
RxBool isEnterourProducts = false.obs;

void onHoverd(RxBool boolValue) {
  boolValue.value = true;
}

class AnimatedCounterOnScroll extends StatefulWidget {
  final int targetNumber;
  final String label;
  final Duration duration;
  final IconData icon;

  const AnimatedCounterOnScroll({
    super.key,
    required this.targetNumber,
    required this.label,
    required this.duration,
    required this.icon,
  });

  @override
  State<AnimatedCounterOnScroll> createState() =>
      _AnimatedCounterOnScrollState();
}

class _AnimatedCounterOnScrollState extends State<AnimatedCounterOnScroll> {
  final RxBool _visible = false.obs;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.label),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_visible.value) {
          _visible.value = true;
        } else if (info.visibleFraction <= 0.1 && _visible.value) {
          _visible.value = false;
        }
      },
      child: Container(
        width: 220.w,
        height: 200.h,
        alignment: Alignment.center,
        child: Obx(
          () =>
              _visible.value
                  ? TweenAnimationBuilder(
                    tween: IntTween(begin: 0, end: widget.targetNumber),
                    duration: widget.duration,
                    builder: (context, value, child) {
                      return FittedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(widget.icon, size: 80.r, color: Colors.white),
                            Text(
                              '$value+',
                              style: TextStyle(
                                fontSize: 65.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              widget.label,
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                  : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

Widget cusText(String input, Color inputColor, double fs, FontWeight fw) {
  return Text(
    textAlign: TextAlign.justify,
    input,
    style: TextStyle(color: inputColor, fontSize: fs.sp, fontWeight: fw),
  );
}

Widget cusButton(String input, Color color) {
  return Container(
    height: 70.h,
    decoration: BoxDecoration(
      color: green,
      borderRadius: BorderRadius.all(Radius.circular(7.r)),
    ),
    width: 150.w,
    child: Center(child: cusText(input, color, 18, FontWeight.w400)),
  );
}

Widget cusButton2(String input, Color color) {
  return Container(
    height: 70.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(7.r)),
    ),
    width: 150.w,
    child: Center(child: cusText(input, color, 18, FontWeight.w800)),
  );
}

Widget animatedCounter({
  required int targetNumber,
  required String label,
  required Duration duration,
}) {
  return TweenAnimationBuilder(
    tween: IntTween(begin: 0, end: targetNumber),
    duration: duration,
    builder: (context, value, child) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      );
    },
  );
}

Widget menubar() {
  final controller = Get.put(MenuHoverController());

  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    height: 130.h,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Get.to(() => Webhomepage()),
          child: cusText(
            "Vison Alliance LTD",
            Colors.green,
            22,
            FontWeight.bold,
          ),
        ),
        SizedBox(width: 120.w),

        /// About Us
        hoverMenuItem(
          title: "About Us",
          isEnter: controller.isEnterAbout,
          isHover: controller.isHoverAbout,
          onTap: () => print("About Us Clicked"),
        ),
        SizedBox(width: 70.w),

        /// Our Business
        hoverMenuItem(
          title: "Our Business",
          isEnter: controller.isEnterBusiness,
          isHover: controller.isHoverBusiness,
          onTap: () => print("Our Business Clicked"),
        ),
        SizedBox(width: 70.w),

        InkWell(
          onTap: () => Get.to(()=> OurService()),
          child: cusText("Our Services", Colors.black, 16, FontWeight.bold),
        ),
        SizedBox(width: 70.w),

        /// Our Products
        hoverMenuItem(
          title: "Our Products",
          isEnter: controller.isEnterProducts,
          isHover: controller.isHoverProducts,
          onTap: () => print("Our Products Clicked"),
        ),
        SizedBox(width: 70.w),

        /// PortFolio
        InkWell(
          onTap: () => print("Portfolio Clicked"),
          child: cusText("PortFolio", Colors.black, 16, FontWeight.bold),
        ),
        SizedBox(width: 70.w),

        /// Login
        InkWell(
          onTap: () => print("Login Clicked"),
          child: cusText("Login", Colors.black, 16, FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget hoverMenuItem({
  required String title,
  required RxBool isEnter,
  required RxBool isHover,
  required VoidCallback onTap,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) {
      isEnter.value = true;
      isHover.value = true;
    },
    onExit: (_) {
      isHover.value = false;
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!isHover.value) {
          isEnter.value = false;
        }
      });
    },
    child: GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 70.h,
        child: Center(child: cusText(title, Colors.black, 16, FontWeight.bold)),
      ),
    ),
  );
}

Widget whychooseContainer(String title, String des, String imgUrl) {
  return Container(
    height: 500.h,
    width: 270.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 180.h,
          width: 180.w,
          decoration: BoxDecoration(color: green, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Container(
            height: 170.h,
            width: 170.w,

            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              imgUrl,
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
        ),
        SizedBox(height: 10.h),
        cusText(title, Colors.black, 18, FontWeight.bold),
        SizedBox(height: 10.h),
        SizedBox(
          width: 210.w,
          child: cusText(des, Colors.black, 12, FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget sliderTextonTop(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      /// Title Row
      cusText(
        "Your Trusted Electrics & Electronics Company ",
        Colors.white,
        46,
        FontWeight.bold,
      ),

      /// Subtitle
      SizedBox(height: 10.h),
      cusText("In Bangladesh.", green, 46, FontWeight.bold),

      /// Divider Line
      SizedBox(height: 10.h),

      /// Description Text
      SizedBox(height: 20.h),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: cusText(
          "Vision Alliance is a trusted provider of electrical and electronics services and products in Bangladesh. Since its establishment in 2019, the company has been delivering reliable, high-quality solutions to both public and private sectors. Specializing in government tender-based projects, Vision Alliance works on a wide range of electrical and electronics infrastructure, including elevator and lift systems, generators, substations, and power plant services.",
          Colors.white,
          20,
          FontWeight.w500,
        ),
      ),

      /// Slogan
      SizedBox(height: 20.h),
      cusText(
        "Powering the Future, Electrifying the Nation.",
        Colors.white,
        22,
        FontWeight.w800,
      ),

      /// Buttons
      SizedBox(height: 40.h),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cusButton("Learn More", Colors.white),
          SizedBox(width: 30.w),
          cusText("About Us", green, 20, FontWeight.w700),
        ],
      ),
    ],
  );
}

Widget animatedCountdown() {
  return SizedBox(
    height: 240.h,
    width: double.infinity,
    child: Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            "https://i.ibb.co/3Y7fXFNS/countdownimage.jpg",
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
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 0.9, 1.0],
                colors: [
                  green.withOpacity(1),
                  green.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedCounterOnScroll(
                    targetNumber: 50,
                    label: "Total Clients",
                    duration: Duration(seconds: 3),
                    icon: Icons.factory,
                  ),
                  SizedBox(width: 40.w),
                  AnimatedCounterOnScroll(
                    targetNumber: 30,
                    label: "Ongoing Projects",
                    duration: Duration(seconds: 3),
                    icon: Icons.pie_chart,
                  ),
                  SizedBox(width: 40.w),
                  AnimatedCounterOnScroll(
                    targetNumber: 50,
                    label: "Total Staff",
                    duration: Duration(seconds: 3),
                    icon: Icons.work_history_outlined,
                  ),
                  SizedBox(width: 40.w),
                  AnimatedCounterOnScroll(
                    targetNumber: 100,
                    label: "Project Completed",
                    duration: Duration(seconds: 3),
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget whyChooseUs() {
  return Container(
    height: 1100.h,
    width: double.infinity,
    color: Colors.black,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 60.h),
        cusText("WHY CHOOSE US?", Colors.white, 26, FontWeight.bold),
        SizedBox(height: 10.h),
        cusText(
          "FOR YOUR ELECTRIC & ELECTRONICS",
          Colors.white,
          26,
          FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        cusText("GOOD'S SERVICES", Colors.white, 26, FontWeight.bold),
        SizedBox(height: 5.h),
        Container(width: 700.w, color: Colors.white, height: 1.h),
        SizedBox(height: 35.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            whychooseContainer(
              "High-Quality",
              "We provide high-quality electronics and services that meet the highest standards of performance and durability. Every product is carefully selected, and every service is expertly delivered to ensure reliability, customer satisfaction, and long-term value you can trust.",
              "https://i.ibb.co/fG40h9Qd/professionalism.jpg",
            ),
            SizedBox(width: 50.w),
            whychooseContainer(
              "Professionalism",
              "We deliver top-quality electronics and reliable services with professionalism at every step. Our expert team ensures precision, transparency, and customer satisfaction. From sales to support, we’re committed to excellence, building trust through every product and service we offer",
              "https://i.ibb.co/hxqnhqjX/p2.jpg",
            ),
            SizedBox(width: 50.w),
            whychooseContainer(
              "Flexibility",
              "We adapt to your needs with flexible solutions in both products and services. Whether it’s customizing electronics, offering varied support options, or adjusting to your schedule, our goal is to provide convenience, comfort, and complete customer satisfaction.",
              "https://i.ibb.co/KcB7F23Y/p3.jpg",
            ),
          ],
        ),
        SizedBox(height: 30.h),
        SizedBox(
          width: 900.w,
          child: cusText(
            "Our company is committed to delivering top-tier electronics and electrical goods with a focus on flexibility, professionalism, and high-quality service. We adapt seamlessly to the unique needs of our clients, ensuring smooth operations and customized solutions. With a dedication to excellence, we maintain the highest industry standards while providing expert services tailored to every requirement. Our reliability and expertise set us apart, making us a trusted partner in electrical and electronic solutions.",
            Colors.white,
            18,
            FontWeight.w100,
          ),
        ),
      ],
    ),
  );
}

Widget ourProducts(
  BuildContext context,
  ScrollController productScrollController,
  GetxControllerForfirebase getxController,
) {
  return SizedBox(
    height: 1000.h,
    child: Column(
      children: [
        cusText("OUR PRODUCTS", green, 35, FontWeight.bold),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 750.h,
                width: 400.w,

                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 320.h,
                      width: 400.w,
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
                    cusText(
                      "BEST PRODUCTS & SERVICE",
                      green,
                      22,
                      FontWeight.bold,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: 300.w,
                      child: cusText(
                        "Since 2013, we have been proudly producing high-quality electronics and electrical goods in Bangladesh. Our commitment to excellence and reliability has made us a trusted name in the industry. Customer satisfaction is our top priority, and we strive to meet their expectations by providing durable, efficient, and innovative products that meet international standards while maintaining affordability and exceptional service.",
                        Colors.grey.shade900,
                        15,
                        FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  productScrollController.animateTo(
                    productScrollController.offset - 300,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 70.r,
                  color: Colors.grey.shade900,
                ),
              ),
              Obx(() {
                if (getxController.homepageProdutsLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (getxController.productList.isEmpty) {
                  return Center(
                    child: Text(
                      "No products found.",
                      style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                    ),
                  );
                }

                return SizedBox(
                  height: 600.h,
                  width: 850.w,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: ListView.builder(
                      controller: productScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: getxController.productList.length,
                      itemBuilder: (context, index) {
                        final product = getxController.productList[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 20.h,
                          ),
                          child: Container(
                            width: 300.w,
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
                                    height: 250.h,
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
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "BDT:${product.price}/=",
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w500,
                                          color: green,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        product.description,
                                        style: TextStyle(
                                          fontSize: 16.sp,
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
                      },
                    ),
                  ),
                );
              }),
              SizedBox(width: 10.h),
              InkWell(
                onTap: () {
                  productScrollController.animateTo(
                    productScrollController.offset + 300,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 70.r,
                  color: Colors.grey.shade900,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget customeSizedBox(double height, List<Widget> Widget) {
  return SizedBox(
    height: height.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: Widget,
    ),
  );
}

Widget bottomNavbar() {
  return Container(
    width: double.infinity,
    height: 550.h,
    color: Colors.black,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 100.w),
              child: customeSizedBox(300, [
                cusText("Vision Alliance", green, 22, FontWeight.bold),
                SizedBox(height: 15.h),
                cusText("Phone : +880 1913-483915", green, 16, FontWeight.bold),
                cusText(
                  "E-mail : visionalliance@gmail.com",
                  green,
                  16,
                  FontWeight.bold,
                ),
                cusText(
                  "Address : Mohammadpur, Bosila, Dhaka- 1207",
                  green,
                  16,
                  FontWeight.bold,
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  width: 280.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.facebook, size: 55.r),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.whatshot, size: 55.r),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(width: 310.w),
            customeSizedBox(300, [
              cusText("COMPANY", green, 20, FontWeight.bold),
              SizedBox(height: 35.h),
              cusText("About Us", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Products", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Support", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Career", Colors.white, 16, FontWeight.w400),
            ]),
            SizedBox(width: 130.w),
            customeSizedBox(300, [
              cusText("LINKS", green, 20, FontWeight.bold),
              SizedBox(height: 35.h),
              cusText("Share Location", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Order Tracking", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Products Guide", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("FAQs", Colors.white, 16, FontWeight.w400),
            ]),
            SizedBox(width: 130.w),
            customeSizedBox(300, [
              cusText("LEGAL", green, 20, FontWeight.bold),
              SizedBox(height: 35.h),
              cusText("Privacy & Policy", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Terms & Condition", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Support", Colors.white, 16, FontWeight.w400),
              SizedBox(height: 20.h),
              cusText("Careers", Colors.white, 16, FontWeight.w400),
            ]),
          ],
        ),
        SizedBox(height: 20.h),

        Padding(
          padding: EdgeInsets.only(left: 100.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 400.w,
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: green.withOpacity(0.8),
                    labelText: 'Enter your email',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30.w),

              cusButton("SUBSCRIBE", Colors.white),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget submenuElements(List<Widget> widgets, double height) {
  return Container(
    height: height.h,
    padding: EdgeInsets.all(40.r),
    decoration: BoxDecoration(
      color: Colors.green.shade200,
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    ),
  );
}

Widget submenu(MenuHoverController controller) {
  return SizedBox(
    width: double.infinity,
    child: Stack(
      children: [
        Positioned(
          child: MouseRegion(
            onEnter: (_) => controller.isHoverAbout.value = true,
            onExit: (_) {
              controller.isHoverAbout.value = false;
              Future.delayed(const Duration(milliseconds: 300), () {
                if (!controller.isHoverAbout.value &&
                    !controller.isEnterAbout.value) {
                  controller.isEnterAbout.value = false;
                }
              });
            },
            child: Obx(
              () => AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                offset:
                    controller.isEnterAbout.value
                        ? Offset.zero
                        : const Offset(0, -0.05),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: controller.isEnterAbout.value ? 1.0 : 0.0,
                  child: Visibility(
                    visible: controller.isEnterAbout.value,
                    child: MouseRegion(
                      onEnter: (_) => controller.isEnterAbout.value = true,
                      onExit: (_) {
                        controller.isEnterAbout.value = false;
                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (!controller.isHoverAbout.value &&
                              !controller.isEnterAbout.value) {
                            controller.isEnterAbout.value = false;
                          }
                        });
                      },
                      child: submenuElements([
                        InkWell(
                          onTap: () => Get.to(() => Profile()),
                          child: cusText(
                            "Company Profile",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => BoD()),
                          child: cusText(
                            "Board Of Directors",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => Speech()),

                          child: cusText(
                            "Chairman's Message",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => VMv()),

                          child: cusText(
                            "Vision, Mission & Values",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                      ], 280),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 142.w,
          child: MouseRegion(
            onEnter: (_) => controller.isHoverBusiness.value = true,
            onExit: (_) {
              controller.isHoverBusiness.value = false;
              Future.delayed(const Duration(milliseconds: 300), () {
                if (!controller.isHoverBusiness.value &&
                    !controller.isEnterBusiness.value) {
                  controller.isEnterBusiness.value = false;
                }
              });
            },
            child: Obx(
              () => AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                offset:
                    controller.isEnterBusiness.value
                        ? Offset.zero
                        : const Offset(0, -0.05),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: controller.isEnterBusiness.value ? 1.0 : 0.0,
                  child: Visibility(
                    visible: controller.isEnterBusiness.value,
                    child: MouseRegion(
                      onEnter: (_) => controller.isEnterBusiness.value = true,
                      onExit: (_) {
                        controller.isEnterBusiness.value = false;
                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (!controller.isHoverBusiness.value &&
                              !controller.isEnterBusiness.value) {
                            controller.isEnterBusiness.value = false;
                          }
                        });
                      },
                      child: submenuElements([
                        InkWell(
                          onTap: () => Get.to(() => Electronics()),
                          child: cusText(
                            "Electronics",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => Electrical()),
                          child: cusText(
                            "Electrical",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => SubStationPage()),
                          child: cusText(
                            "Sub-Station",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => Powerplant()),
                          child: cusText(
                            "Power Plant",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => Labequipment()),
                          child: cusText(
                            "Lab Equipment",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        cusText(
                          "Lightning Resistance",
                          Colors.black,
                          15,
                          FontWeight.w800,
                        ),
                        SizedBox(height: 20.h),
                        cusText(
                          "IT Support",
                          Colors.black,
                          15,
                          FontWeight.w800,
                        ),
                      ], 410),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 470.w,
          child: MouseRegion(
            onEnter: (_) => controller.isHoverProducts.value = true,
            onExit: (_) {
              controller.isHoverProducts.value = false;
              Future.delayed(const Duration(milliseconds: 300), () {
                if (!controller.isHoverProducts.value &&
                    !controller.isEnterProducts.value) {
                  controller.isEnterProducts.value = false;
                }
              });
            },
            child: Obx(
              () => AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                offset:
                    controller.isEnterProducts.value
                        ? Offset.zero
                        : const Offset(0, -0.05),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: controller.isEnterProducts.value ? 1.0 : 0.0,
                  child: Visibility(
                    visible: controller.isEnterProducts.value,
                    child: MouseRegion(
                      onEnter: (_) => controller.isEnterProducts.value = true,
                      onExit: (_) {
                        controller.isEnterProducts.value = false;
                        Future.delayed(const Duration(milliseconds: 300), () {
                          if (!controller.isHoverProducts.value &&
                              !controller.isEnterProducts.value) {
                            controller.isEnterProducts.value = false;
                          }
                        });
                      },
                      child: submenuElements([
                        InkWell(
                          onTap: () => Get.to(() => ElectronicsProductPage()),
                          child: cusText(
                            "Electronics Goods",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => ElectricalProductsPage()),
                          child: cusText(
                            "Electrical Goods",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => PowerplantandSubsatation()),
                          child: cusText(
                            "Sub-Station & Power Plant",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () => Get.to(() => ComputerPage()),
                          child: cusText(
                            "Computer",
                            Colors.black,
                            15,
                            FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        cusText(
                          "IT Support",
                          Colors.black,
                          15,
                          FontWeight.w800,
                        ),
                      ], 330),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget brandImageCard(String imageUrl, {void Function()? onTap}) {
  final RxBool isHovering = false.obs;

  return Obx(
    () => MouseRegion(
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color:
                    isHovering.value
                        ? Colors.blue.withOpacity(0.2)
                        : Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: isHovering.value ? Colors.blueAccent : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
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
      ),
    ),
  );
}

Widget contactUsForm() {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();

  return StatefulBuilder(
    builder: (context, setState) {
      final primaryColor = Color(0xFF007C3E);

      void submitForm() {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Thank you, your message has been sent!',
                style: TextStyle(fontSize: 18.sp),
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );

          formKey.currentState!.reset();
          nameCtrl.clear();
          phoneCtrl.clear();
          emailCtrl.clear();
        }
      }

      return Form(
        key: formKey,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          width: 800.w,
          child: Column(
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: 30.h),

              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: 'Name *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                style: TextStyle(fontSize: 18.sp),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),

              TextFormField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  prefixIcon: Icon(Icons.phone),
                ),
                style: TextStyle(fontSize: 18.sp),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Phone number is required';
                  }
                  if (!RegExp(r'^\+?[\d\s\-]{7,15}$').hasMatch(value.trim())) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),

              TextFormField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                style: TextStyle(fontSize: 18.sp),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                  ).hasMatch(value.trim())) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),

              ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Send Message',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget expertise() {
  return SizedBox(
    height: 500.h,
    width: double.infinity,
    child: Stack(
      children: [
        SizedBox(
          height: 500.h,
          width: double.infinity,
          child: Image.network(
            "https://i.ibb.co/3Y7fXFNS/countdownimage.jpg",
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
            decoration: BoxDecoration(color: green.withOpacity(0.8)),
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cusText("OUR KEY-ASPECTS", Colors.white, 32, FontWeight.bold),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  expertiseContainer(
                    Icons.people_sharp,
                    "Rich Experience",
                    "We have been manufacturing elevators for 12 years, have strong R&D and manufacturing capabilities, and know the preferences of customers around the world.",
                  ),
                  expertiseContainer(
                    Icons.engineering,
                    "Professional Engineering",
                    "With 12 years’ experience, we specialize in elevator systems with advanced R&D, precision manufacturing, and global customer insight.",
                  ),
                  expertiseContainer(
                    Icons.money_outlined,
                    "Competitive Pricing",
                    "We offer high-quality elevator solutions at competitive prices, ensuring exceptional value without compromising on performance or safety.",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget expertiseContainer(IconData icons, String title, String des) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: SizedBox(
      height: 300.h,
      width: 450.w,
      child: Column(
        children: [
          Icon(icons, size: 90.r, color: Colors.white),
          SizedBox(height: 20.h),
          cusText(title, Colors.white, 25, FontWeight.w700),
          SizedBox(height: 15.h),
          Text(
            des,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ourAdvantage() {
  return Row(
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
              'Proven Track Record Across Industrial and Utility Projects',
            ),
            serviceBullet('Use of Advanced Tools and Technology'),
            serviceBullet(
              'On-Time Project Delivery with Zero Compromise on Quality',
            ),
            serviceBullet('Compliance with Local and International Standards'),
            serviceBullet('Comprehensive After-Sales Support'),
            serviceBullet(
              'Strong Focus on Safety and Environmental Responsibility',
            ),
            serviceBullet(
              'Flexible and Scalable Solutions Tailored to Client Needs',
            ),
            serviceBullet('Certified Engineers and Technicians'),
            serviceBullet(
              'Cost-Effective Solutions Without Compromising Quality',
            ),
            serviceBullet('End-to-End Project Management Expertise'),
          ],
        ),
      ),
    ],
  );
}

final List<Map<String, String>> teamMembers = [
  {
    'name': 'Md. Shahed',
    'position': 'Chief Executive Officer',
    'imageUrl':
        'https://images.unsplash.com/photo-1595152772835-219674b2a8a6?auto=format&fit=crop&w=400&q=80',
  },
  {
    'name': 'Nusrat Jahan',
    'position': 'Chief Technology Officer',
    'imageUrl':
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=400&q=80',
  },
  {
    'name': 'Tanvir Hasan',
    'position': 'Head of Power Systems',
    'imageUrl':
        'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=400&q=80',
  },
  {
    'name': 'Hafsa Alam',
    'position': 'Lead Electronics Engineer',
    'imageUrl':
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=400&q=80',
  },
  {
    'name': 'Rafiul Islam',
    'position': 'Software Architect',
    'imageUrl':
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=400&q=80',
  },
  {
    'name': 'Sadia Kabir',
    'position': 'Quality Assurance Manager',
    'imageUrl':
        'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?auto=format&fit=crop&w=400&q=80',
  },
];

Widget buildTeamSection() {
  return Padding(
    padding: const EdgeInsets.all(32),
    child: Wrap(
      alignment: WrapAlignment.center,
      spacing: 24,
      runSpacing: 24,
      children:
          teamMembers.map((member) {
            return buildTeamCard(
              name: member['name']!,
              position: member['position']!,
              imageUrl: member['imageUrl']!,
            );
          }).toList(),
    ),
  );
}

Widget buildTeamCard({
  required String name,
  required String position,
  required String imageUrl,
}) {
  return SizedBox(
    width: 220,
    height: 320,
    child: Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Ink.image(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  position,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

final List<Map<String, dynamic>> services = [
  {'title': 'Electrical Products', 'icon': Icons.electrical_services},
  {'title': 'Electronics Products', 'icon': Icons.memory},
  {'title': 'Computer Lab Setup', 'icon': Icons.computer},
  {'title': 'Substation Business', 'icon': Icons.precision_manufacturing},
  {'title': 'Power Plant Business', 'icon': Icons.bolt},
  {'title': 'Industrial Solutions', 'icon': Icons.factory},
];

Widget buildOurServicesSection() {
  return SizedBox(
    width: 1300.w,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 24.w),
      child: Wrap(
        spacing: 80.w,
        runSpacing: 80.h,
        alignment: WrapAlignment.center,
        children:
            services.map((service) {
              return buildServiceItem(
                iconData: service['icon'],
                title: service['title'],
              );
            }).toList(),
      ),
    ),
  );
}

Widget buildServiceItem({required IconData iconData, required String title}) {
  return SizedBox(
    width: 300.w,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF27AE60),
          ),
          child: Icon(iconData, color: Colors.white, size: 30.sp),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}

final List<Map<String, dynamic>> ourbrandList = [
  {"title": "Hisense", "url": "https://i.ibb.co/KtMBLFx/hisense.png"},
  {"title": "Haier", "url": "https://i.ibb.co/cKRvN1g0/ha.png"},
  {"title": "Entergy Plus", "url": "https://i.ibb.co/ksB4yR0v/energy.png"},
  {"title": "SparkL", "url": "https://i.ibb.co/67P15Lsy/sparkl.png"},
  {"title": "CMM", "url": "https://i.ibb.co/r2BxwNmp/cmm.png"},
  {"title": "Fuji HD", "url": "https://i.ibb.co/YThQFVBL/fujihd.png"},
  {"title": "Golden TV", "url": "https://i.ibb.co/Xf80zknC/golden.png"},
  {"title": "Sony", "url": "https://i.ibb.co/35gXkkh4/sony.png"},
  {"title": "Media", "url": "https://i.ibb.co/KxVdy4nh/media.png"},
  {"title": "General", "url": "https://i.ibb.co/RGzw48Xw/general.png"},
  {"title": "Cool IT", "url": "https://i.ibb.co/s9f4vqvD/coolit.png"},
  {"title": "Perkins", "url": "https://i.ibb.co/rGk49Wqx/perkins.png"},
  {"title": "Ricardo", "url": "https://i.ibb.co/ymQ75tXN/ricardo.png"},
  {"title": "CGM", "url": "https://i.ibb.co/Rp8cBJV8/cgm.png"},
];

Widget ourBrands() {
  return SizedBox(
    width: 1300.w,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 24.w),
      child: Wrap(
        spacing: 80.w,
        runSpacing: 80.h,
        alignment: WrapAlignment.center,
        children:
            ourbrandList.map((service) {
              return ourBrandItem(url: service['url'], title: service['title']);
            }).toList(),
      ),
    ),
  );
}

Widget ourBrandItem({required String url, required String title}) {
  return SizedBox(width: 159.w, height: 150.h, child: Image.network(url));
}

final List<Map<String, dynamic>> boardMembers = [
  {
    'name': 'Alice Johnson',
    'designation': 'Chairperson',
    'image':
        'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Benjamin Patel',
    'designation': 'Managing Director',
    'image':
        'https://images.unsplash.com/photo-1566753323558-f4e0952af115?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Catherine Lee',
    'designation': 'Finance Director',
    'image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'David Kim',
    'designation': 'Operations Director',
    'image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Emily García',
    'designation': 'Marketing Director',
    'image':
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Farhan Ahmed',
    'designation': 'Technology Director',
    'image':
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Grace Thompson',
    'designation': 'Human Resources',
    'image':
        'https://images.unsplash.com/photo-1537368910025-700350fe46c7?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Henry Scott',
    'designation': 'Legal Advisor',
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Isabella Khan',
    'designation': 'Strategy Officer',
    'image':
        'https://images.unsplash.com/photo-1507120410856-1f35574c3b45?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'James Wilson',
    'designation': 'Logistics Head',
    'image':
        'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Karen Adams',
    'designation': 'Public Relations',
    'image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Leo Park',
    'designation': 'Innovation Lead',
    'image':
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Maria Gomez',
    'designation': 'Client Relations',
    'image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Nathan Brooks',
    'designation': 'Procurement Head',
    'image':
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Olivia Chen',
    'designation': 'Compliance Manager',
    'image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Paul Richards',
    'designation': 'Investor Relations',
    'image':
        'https://images.unsplash.com/photo-1527980965255-d3b416303d12?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Quinn Parker',
    'designation': 'CSR Director',
    'image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Rita Shah',
    'designation': 'Training & Development Head',
    'image':
        'https://images.unsplash.com/photo-1544717302-de2939b7ef71?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Samuel Ibrahim',
    'designation': 'Data & Analytics',
    'image':
        'https://images.unsplash.com/photo-1573497491208-6b1acb260507?auto=format&fit=crop&w=500&q=80',
  },
  {
    'name': 'Tania Moore',
    'designation': 'Sustainability Officer',
    'image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=500&q=80',
  },
];

Widget buildDirectorCard({
  required String name,
  required String designation,
  required String imageUrl,
}) {
  return SizedBox(
    width: 260.w,
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      shadowColor: const Color.fromARGB(31, 5, 5, 5),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Picture
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.network(
                imageUrl,
                width: 100.w,
                height: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 14.h),

            // Name
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF2C3E50),
              ),
            ),
            SizedBox(height: 6.h),

            // Designation
            Text(
              designation,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget header() {
  return Column(
    children: [
      Text(
        'Powering Progress, Empowering People',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: green,
        ),
      ),
      const SizedBox(height: 12),
      SizedBox(
        width: 760.w,
        child: Text(
          'Vision Alliance Ltd. delivers mission‑critical electrical & electronic infrastructure for government projects across Bangladesh while diversifying into power generation, land development and cutting‑edge IT services.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            height: 1.6.h,
            color: const Color(0xFF333333),
          ),
        ),
      ),
    ],
  );
}

Widget speechCard({
  required String title,
  required String imageUrl,
  required String speech,
  bool reverse = false,
}) {
  final children = <Widget>[
    Expanded(
      flex: 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 3 / 3,
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
      ),
    ),
    SizedBox(width: 32.w),
    Expanded(
      flex: 6,
      child: Column(
        crossAxisAlignment:
            reverse ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
              color: green,
            ),
          ),
          SizedBox(height: 12.sp),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE4F7F1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(24.r),
            child: Text(
              speech,
              textAlign: reverse ? TextAlign.right : TextAlign.left,
              style: TextStyle(
                fontSize: 16.sp,
                height: 1.8.h,
                color: const Color(0xFF2C2C2C),
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  return LayoutBuilder(
    builder: (context, constraints) {
      if (constraints.maxWidth < 800.h) {
        return Column(
          children: reverse ? children.reversed.toList() : children,
        );
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: reverse ? children.reversed.toList() : children,
      );
    },
  );
}

Widget vmvHeader() {
  return Column(
    children: [
      Text(
        'Vision • Mission • Values',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: green,
        ),
      ),
      SizedBox(height: 25.h),
      SizedBox(
        width: 810.h,
        child: Text(
          'Our strategic compass defines where we aspire to be, how we will get there, and the principles that guide every step.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 21.sp,
            height: 1.6.h,
            color: const Color(0xFF333333),
          ),
        ),
      ),
    ],
  );
}

Widget serviceHeader() {
  return Column(
    children: [
      Text(
        'OUR • SERVICE',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: green,
        ),
      ),
      SizedBox(height: 25.h),
      SizedBox(
        width: 1150.w,
        child: Text(
          'Our strategic compass defines not just where we aspire to be, but also how we intend to get there—and most importantly, the core values and principles that shape our every move. It serves as the guiding framework for Vision Alliance Ltd.’s long-term growth, innovation, and national contribution. We envision a future where we are Bangladesh’s most trusted name in sustainable energy, land development, and technology. To reach that destination, we follow a disciplined roadmap built on collaboration, excellence, and integrity. Our actions are driven by purpose and responsibility, ensuring that each decision contributes to long-lasting impact and shared progress. This strategic vision aligns our people, partners, and projects under one unified mission for national development and empowerment.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 19.sp,
            height: 1.9.h,
            color: const Color.fromARGB(255, 26, 25, 25),
          ),
        ),
      ),
    ],
  );
}

Widget vmvCard({
  required String title,
  required IconData icon,
  required String description,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFE4F7F1),
      borderRadius: BorderRadius.circular(16.r),
    ),
    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
    child: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600.w) {
          return Column(
            children: vmvCardChildren(title, icon, description, true),
          );
        }
        return Row(children: vmvCardChildren(title, icon, description, false));
      },
    ),
  );
}

List<Widget> vmvCardChildren(
  String title,
  IconData icon,
  String description,
  bool isVertical,
) {
  return [
    CircleAvatar(
      radius: 70.r,
      backgroundColor: green,
      child: Icon(icon, size: 50.r, color: Colors.white),
    ),
    SizedBox(width: isVertical ? 0 : 40.w, height: isVertical ? 30.h : 0),
    Expanded(
      child: Column(
        crossAxisAlignment:
            isVertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: green,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            description,
            style: TextStyle(
              wordSpacing: 5,
              fontSize: 20.sp,
              height: 1.9.h,
              color: const Color(0xFF2C2C2C),
            ),
          ),
        ],
      ),
    ),
  ];
}

final List<Map<String, dynamic>> ourserVicelist = [
  {
    'title': 'Electrical Products',
    'icon': Icons.electrical_services,
    'imageUrl': 'https://i.ibb.co/KcB7F23Y/p3.jpg',
    'description':
        'Our Electrical Products division delivers reliable, high-performance solutions that power homes, industries, and public infrastructure. From circuit breakers, switchboards, and wiring systems to transformers and relays, we source and install certified equipment to ensure national safety compliance and operational efficiency. We are committed to electrifying progress across Bangladesh.',
  },
  {
    'title': 'Electronics Products',
    'icon': Icons.memory,
    'imageUrl':
        'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=800&q=80',
    'description':
        'We provide cutting-edge electronics from globally trusted brands—offering LED TVs, smart devices, air conditioners, refrigerators, and professional systems. Whether it’s enhancing homes or digitizing government spaces, our electronics are built for comfort, performance, and energy efficiency.',
  },
  {
    'title': 'Computer Lab Setup',
    'icon': Icons.computer,
    'imageUrl': 'https://i.ibb.co/zVSjP7Qt/digital-lab.webp',
    'description':
        'Our Computer Lab Setup service transforms classrooms and corporate environments into future-ready digital spaces. We design and deploy computer labs with branded hardware, ergonomic furniture, smart networking, and secure backup solutions. Ideal for government, education, and vocational sectors.',
  },
  {
    'title': 'Substation Business',
    'icon': Icons.precision_manufacturing,
    'imageUrl': 'https://i.ibb.co/MkGv9L3D/pexels-life-of-pix-2391.jpg',
    'description':
        'Our substation business ensures seamless transmission of electricity through turnkey engineering, procurement, and construction services. We build substations with advanced SCADA systems, protective relays, and GIS technologies, playing a vital role in stabilizing the national power grid.',
  },
  {
    'title': 'Power Plant Business',
    'icon': Icons.bolt,
    'imageUrl': 'https://i.ibb.co/j9ytf25K/powerplan.webp',
    'description':
        'We lead comprehensive power plant development—from feasibility study to commissioning. Our expertise lies in conventional and renewable energy plants, delivering scalable, eco-friendly power solutions that support Bangladesh’s energy independence and sustainability goals.',
  }, 
 
];



Widget ourServicesPage() {
  return SizedBox(
    width: 1300.w,
    child: Padding(padding: EdgeInsets.all(20.r),
    child: Wrap(
      alignment: WrapAlignment.center,
      spacing: 80.h,
      children: ourserVicelist.map((e){
        return Container(
          color: Colors.green.shade100,
          margin: EdgeInsets.all(20.r),
          child: Row(children: [
            Padding(
              padding:  EdgeInsets.all(30.0.r),
              child: SizedBox(
              
                width: 400.w,
                height: 350.h,
                        
                child: Image.network(
                                  e["imageUrl"],
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
                                )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(e["icon"], color: green, size: 70.r
                ,),
              cusText(e["title"], green, 25, FontWeight.bold),
              SizedBox(height: 15.h,),
              SizedBox(
                width: 740.w,
                child: cusText(e["description"], Colors.black, 16, FontWeight.w600))
            ],)
          ],)
        );
      }).toList(),
    ),
    )
  );
}


final List<Map<String, String>> projects = [
  {
    "title": "LT Panel Supply to DPDC",
    "category": "Electrical",
    "description": "Supplied LT panels to DPDC under government contract.",
    "image": "https://images.unsplash.com/photo-1581090700227-1e8d6c8b1e3b"
  },
  {
    "title": "School Electrical Wiring",
    "category": "Electrical",
    "description": "Full electrical rewiring of rural government school.",
    "image": "https://images.unsplash.com/photo-1581090701350-d1f98dcdc10f"
  },
  {
    "title": "Transformer Delivery to Rural Areas",
    "category": "Electrical",
    "description": "Delivered 5MVA transformers to remote substations.",
    "image": "https://images.unsplash.com/photo-1610231031075-d1bd2f9b5c57"
  },
  {
    "title": "MCC Panel for Public Hospitals",
    "category": "Electrical",
    "description": "Provided MCC panels to public sector hospitals.",
    "image": "https://images.unsplash.com/photo-1600873106371-f4c7e0ea8f2c"
  },
  {
    "title": "Switchgear Tender Delivery",
    "category": "Electrical",
    "description": "Delivered switchgears via public tender contract.",
    "image": "https://images.unsplash.com/photo-1630502311125-8b6cc77603e9"
  },
  {
    "title": "20MW Diesel Power Plant",
    "category": "Powerplant",
    "description": "Installed 20MW diesel power plant in Rangpur.",
    "image": "https://images.unsplash.com/photo-1581090701350-d1f98dcdc10f"
  },
  {
    "title": "Solar Hybrid Power Setup",
    "category": "Powerplant",
    "description": "Solar + diesel hybrid setup in remote villages.",
    "image": "https://images.unsplash.com/photo-1610231031075-d1bd2f9b5c57"
  },
  {
    "title": "Turnkey Plant in Rajshahi",
    "category": "Powerplant",
    "description": "EPC turnkey powerplant built in Rajshahi.",
    "image": "https://images.unsplash.com/photo-1600873106371-f4c7e0ea8f2c"
  },
  {
    "title": "GIS Generator Room Installation",
    "category": "Powerplant",
    "description": "Setup GIS generator control room facility.",
    "image": "https://images.unsplash.com/photo-1599423300746-b62533397364"
  },
  {
    "title": "SCADA System Integration",
    "category": "Powerplant",
    "description": "Integrated SCADA into 10 plant stations.",
    "image": "https://images.unsplash.com/photo-1630502311125-8b6cc77603e9"
  },
  {
    "title": "33/11KV Textile Substation",
    "category": "Substation",
    "description": "Built 33/11KV textile substation in Savar.",
    "image": "https://images.unsplash.com/photo-1581090700227-1e8d6c8b1e3b"
  },
  {
    "title": "VCB Installation at City Grid",
    "category": "Substation",
    "description": "VCB panels installed in capital city substation.",
    "image": "https://images.unsplash.com/photo-1581090701350-d1f98dcdc10f"
  },
  {
    "title": "College Substation Revamp",
    "category": "Substation",
    "description": "Reconstructed substation at national college.",
    "image": "https://images.unsplash.com/photo-1610231031075-d1bd2f9b5c57"
  },
  {
    "title": "ICT Lab in Polytechnic",
    "category": "Computer Lab",
    "description": "Setup ICT lab with 30 PCs in polytechnic.",
    "image": "https://images.unsplash.com/photo-1581093588401-83b4d1a23d15"
  },
  {
    "title": "Smart Classroom Equipment",
    "category": "Computer Lab",
    "description": "Supplied smart classroom interactive boards.",
    "image": "https://images.unsplash.com/photo-1600873106371-f4c7e0ea8f2c"
  },
  {
    "title": "Cybersecurity Lab Delivery",
    "category": "Computer Lab",
    "description": "Installed cybersecurity practice lab setup.",
    "image": "https://images.unsplash.com/photo-1599423300746-b62533397364"
  },
  {
    "title": "RO System for Hospital",
    "category": "Water Purifier",
    "description": "Installed RO units in 3 govt hospitals.",
    "image": "https://images.unsplash.com/photo-1630502311125-8b6cc77603e9"
  },
  {
    "title": "Solar Water Purifier Unit",
    "category": "Water Purifier",
    "description": "Solar-powered purifier installed in chars.",
    "image": "https://images.unsplash.com/photo-1581090700227-1e8d6c8b1e3b"
  },
  {
    "title": "Hostel Filter Installation",
    "category": "Water Purifier",
    "description": "Water filter units in student hostels.",
    "image": "https://images.unsplash.com/photo-1581090701350-d1f98dcdc10f"
  },
  {
    "title": "Water Lab in Campus",
    "category": "Water Purifier",
    "description": "Built water quality testing lab in campus.",
    "image": "https://images.unsplash.com/photo-1610231031075-d1bd2f9b5c57"
  }
];




Widget projectCard(Map<String, String> project) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 320,
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              project["image"]!,
              width: 320,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 150),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  width: 320,
                  height: 150,
                  color: Colors.grey[300],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project["category"]!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project["title"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project["description"]!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


Widget showProtfolio (){
  return  SizedBox(
    width: 1200.w,
    child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: projects.map((project) => projectCard(project)).toList(),
        ),
  );
}
