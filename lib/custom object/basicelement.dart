// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:get/get.dart';
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
  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    height: 130.h,

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cusText("Vison Alliance LTD", green, 22, FontWeight.bold),
        SizedBox(width: 120.w),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => onHoverd(isEnter),
          onExit: (_) {
            Future.delayed(const Duration(milliseconds: 300), () {
              if (!isHover.value) {
                isEnter.value = false;
              }
            });
          },
          child: SizedBox(
            height: 70.h,
            child: Center(
              child: cusText("About Us", Colors.black, 16, FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: 70.w),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => onHoverd(isEnterourBusiness),
          onExit: (_) {
            Future.delayed(const Duration(milliseconds: 300), () {
              if (!isHoverourBusiness.value) {
                isEnterourBusiness.value = false;
              }
            });
          },
          child: SizedBox(
            height: 70.h,
            child: Center(child: cusText("Our Business", Colors.black, 16, FontWeight.bold)),
          ),
        ),
        SizedBox(width: 70.w),
        InkWell(
          child: cusText("Our Services", Colors.black, 16, FontWeight.bold),
        ),
        SizedBox(width: 70.w),

        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => onHoverd(isEnterourProducts),
          onExit: (_) {
            Future.delayed(const Duration(milliseconds: 300), () {
              if (!isHoverourProducts.value) {
                isEnterourProducts.value = false;
              }
            });
          },
          child: SizedBox(
            height: 70.h,
            child: Center(child: cusText("Our Products", Colors.black, 16, FontWeight.bold)),
          ),
        ),
        SizedBox(width: 70.w),
        InkWell(child: cusText("PortFolio", Colors.black, 16, FontWeight.bold)),
        SizedBox(width: 70.w),
        InkWell(child: cusText("Login", Colors.black, 16, FontWeight.bold)),
      ],
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
      children: [
        SizedBox(height: 30.h),
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
  return SizedBox(
    height: 1000.h,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  cusText("Your Trusted", green, 46, FontWeight.bold),
                  SizedBox(width: 9.w),
                  cusText(
                    "Electrics & Electronics Company",
                    Colors.white,
                    46,
                    FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: cusText("In Bangladesh.", Colors.white, 46, FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 1.h,
          color: green,
        ),
        SizedBox(height: 20.h),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cusText(
                "Vision Alliance is a trusted provider of electrical and electronics services and products in Bangladesh. Since its establishment in 2019, the company has been delivering reliable, high-quality solutions to both public and private sectors. Specializing in government tender-based projects, Vision Alliance works on a wide range of electrical and electronics infrastructure, including elevator and lift systems, generators, substations, and power plant services.",
                Colors.white,
                20,
                FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        cusText(
          "Powering the Future, Electrifying the Nation.",
          Colors.white,
          22,
          FontWeight.w800,
        ),
        SizedBox(height: 40.h),

        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cusButton("Learn More", Colors.white),
              SizedBox(width: 30.w),
              cusText("About Us", green, 20, FontWeight.w700),
            ],
          ),
        ),
      ],
    ),
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
    width: double.infinity,
    child: Column(
      children: [
        cusText("OUR PRODUCTS", green, 35, FontWeight.bold),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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

Widget submenu() {
  return SizedBox(
    width: double.infinity,

    child: Stack(
      children: [
        Positioned(
          child: MouseRegion(
            onEnter: (_) => isHover.value = true,
            onExit: (_) {
              Future.delayed(const Duration(milliseconds: 300), () {
                isHover.value = false;
                isEnter.value = false;
              });
            },
            child: Obx(
              () => AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                offset:
                    isEnter.value ? const Offset(0, 0) : const Offset(0, -0.05),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isEnter.value ? 1.0 : 0.0,
                  child: Visibility(
                    visible: isEnter.value,
                    child: submenuElements([
                      cusText(
                        "Company Profile",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Board Of Directors",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Chairman's Message",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Vision, Mission & Values",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Quality Policy",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                    ], 310),
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 142.w,
          child: MouseRegion(
            onEnter: (_) => isHoverourBusiness.value = true,
            onExit: (_) {
              Future.delayed(const Duration(milliseconds: 300), () {
                isHoverourBusiness.value = false;
                isEnterourBusiness.value = false;
              });
            },
            child: Obx(
              () => AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                offset:
                    isEnterourBusiness.value
                        ? const Offset(0, 0)
                        : const Offset(0, -0.05),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isEnterourBusiness.value ? 1.0 : 0.0,
                  child: Visibility(
                    visible: isEnterourBusiness.value,
                    child: submenuElements([
                      cusText("Electronics", Colors.black, 15, FontWeight.w800),
                      SizedBox(height: 20.h),
                      cusText("Electrical", Colors.black, 15, FontWeight.w800),
                      SizedBox(height: 20.h),
                      cusText("Sub-Station", Colors.black, 15, FontWeight.w800),
                      SizedBox(height: 20.h),
                      cusText("Power Plant", Colors.black, 15, FontWeight.w800),
                      SizedBox(height: 20.h),
                      cusText(
                        "Lab Equipment",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Lightning Resistance",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText("IT Support", Colors.black, 15, FontWeight.w800),
                    ], 410),
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 470.w,
          child: MouseRegion(
            onEnter: (_) => isHoverourProducts.value = true,
            onExit: (_) {
              Future.delayed(const Duration(milliseconds: 300), () {
                isHoverourProducts.value = false;
                isEnterourProducts.value = false;
              });
            },
            child: Obx(
              () => AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                offset:
                    isEnterourProducts.value
                        ? const Offset(0, 0)
                        : const Offset(0, -0.05),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: isEnterourProducts.value ? 1.0 : 0.0,
                  child: Visibility(
                    visible: isEnterourProducts.value,
                    child: submenuElements([
                      cusText(
                        "Electronics Goods",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Electrical Goods",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Sub-Station Equipment",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText(
                        "Power Plant Equipment",
                        Colors.black,
                        15,
                        FontWeight.w800,
                      ),
                      SizedBox(height: 20.h),
                      cusText("Computer", Colors.black, 15, FontWeight.w800),
                      SizedBox(height: 20.h),
                      cusText("IT Support", Colors.black, 15, FontWeight.w800),
                    ], 370),
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
