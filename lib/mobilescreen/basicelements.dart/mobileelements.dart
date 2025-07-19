import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/mobile%20about%20us/bod.dart';
import 'package:vision_alliance/mobilescreen/mobile%20about%20us/mobilecompanyprofile.dart';
import 'package:vision_alliance/mobilescreen/mobile%20about%20us/mobilevm.dart';
import 'package:vision_alliance/mobilescreen/our%20business/electronic.dart';
import 'package:vision_alliance/mobilescreen/our%20business/electrical.dart';
import 'package:vision_alliance/mobilescreen/our%20business/labequipment.dart';
import 'package:vision_alliance/mobilescreen/our%20business/powerplan.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';
import 'package:vision_alliance/webfolder/our%20products/computer.dart';
import 'package:vision_alliance/webfolder/our%20products/electronics.dart';
import 'package:vision_alliance/webfolder/ourserver.dart';
import 'package:vision_alliance/webfolder/portfolio.dart';
import '../../webfolder/aboutus/chairmans.dart';
import '../../webfolder/our products/electrical.dart';
import '../../webfolder/our products/p&s.dart';

Widget mobilemMenu() {
  return Drawer(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20.r)),
    ),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.white,
                child: Icon(Icons.business, color: green, size: 30.r),
              ),
              SizedBox(height: 10.h),
              Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Empowering Innovation',
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
            ],
          ),
        ),

        drawerTile(Icons.info, 'About Us', [
          drawerSubTile('Company Profile', () => Get.to(() => MobileProfile())),
          drawerSubTile('Board Of Directors', () => Get.to(() => MobileBOD())),
          drawerSubTile("Chairman's Message", () => Get.to(() => Speech())),
          drawerSubTile('Vision, Mission & Values', () => Get.to(() => MobileVM())),
        ]),

        drawerTile(Icons.business_center, 'Our Business', [
          drawerSubTile('Electronics', () => Get.to(() => MobileElectronics())),
          drawerSubTile('Electrical', () => Get.to(() => MobileElectrical())),
          drawerSubTile('Sub-Station', () => Get.to(() => MobilePowerPlant())),
          drawerSubTile('Power Plant', () => Get.to(() => MobilePowerPlant())),
          drawerSubTile('Lab Equipment', () => Get.to(() => MobileLabEquipment())),
          drawerSubTile(
            'Lightning Resistance',
            () => print("Lightning Resistance"),
          ),
          drawerSubTile('IT Support', () => print("IT Support")),
        ]),

        ListTile(
          leading: Icon(Icons.miscellaneous_services, color: green),
          title: Text(
            'Our Services',
            style: TextStyle(color: green, fontSize: 16.sp),
          ),
          onTap: () => Get.to(() => OurService()),
        ),

        drawerTile(Icons.shopping_bag, 'Our Products', [
          drawerSubTile(
            'Electronics Goods',
            () => Get.to(() => ElectronicsProductPage()),
          ),
          drawerSubTile(
            'Electrical Goods',
            () => Get.to(() => ElectricalProductsPage()),
          ),
          drawerSubTile(
            'Sub-Station & Power Plant',
            () => Get.to(() => PowerplantandSubsatation()),
          ),
          drawerSubTile('Computer', () => Get.to(() => ComputerPage())),
          drawerSubTile('IT Support', () => print("IT Support")),
        ]),

        ListTile(
          leading: Icon(Icons.work, color: green),
          title: Text(
            'Portfolio',
            style: TextStyle(color: green, fontSize: 16.sp),
          ),
          onTap: () => Get.to(() => PortfolioList()),
        ),

        Divider(thickness: 1, height: 30.h),

        ListTile(
          leading: Icon(Icons.login, color: green),
          title: Text('Login', style: TextStyle(color: green, fontSize: 16.sp)),
          onTap: () => print("Login Clicked"),
        ),
      ],
    ),
  );
}

Widget drawerTile(IconData icon, String title, List<Widget> children) {
  return Theme(
    data: ThemeData().copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      leading: Icon(icon, color: green),
      iconColor: green,
      collapsedIconColor: green,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: green,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: children,
    ),
  );
}

Widget drawerSubTile(String label, VoidCallback onTap) {
  return ListTile(
    title: Text(
      label,
      style: TextStyle(color: Colors.green.shade700, fontSize: 15.sp),
    ),
    onTap: onTap,
    dense: true,
    visualDensity: VisualDensity.compact,
    contentPadding: EdgeInsets.only(left: 72.w, right: 16.w),
    splashColor: green.withOpacity(0.1),
  );
}

//slide and text on the top
Widget buildSliderWithText(
  BuildContext context,
  GetxControllerForfirebase getxController,
  PageController pageController,
) {
  return Obx(() {
    if (getxController.imageUrls.isEmpty) {
      return  SizedBox(
        height: 700.h,
        child: Center(child: CircularProgressIndicator()));
    }

    return SizedBox(
      height: 700.h,
      width: double.infinity,
      child: Stack(
        children: [
          /// Background Slider
          PageView.builder(
            controller: pageController,
            itemCount: getxController.imageUrls.length,
            itemBuilder: (_, i) => CachedNetworkImage(
              imageUrl: getxController.imageUrls[i],
              fit: BoxFit.cover,
              memCacheWidth: 800,
              placeholder: (c, _) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (c, _, __) =>
                  const Icon(Icons.broken_image, size: 60, color: Colors.red),
            ),
          ),

          /// Black overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),

          /// Centered Text
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Center(child: mobileSliderText(context)),
            ),
          ),
        ],
      ),
    );
  });
}

Widget mobileSliderText(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final bool isMobile = screenWidth < 600;
  final Color green = const Color.fromARGB(255, 0, 124, 62);

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      /// Title
      Text(
        "Your Trusted Electrics & Electronics Company",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: isMobile ? 24.sp : 46.sp,
          fontWeight: FontWeight.bold,
          height: 1.3,
        ),
      ),

      SizedBox(height: 10.h),

      /// Subtitle
      Text(
        "In Bangladesh.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: green,
          fontSize: isMobile ? 24.sp : 46.sp,
          fontWeight: FontWeight.bold,
        ),
      ),

      SizedBox(height: 20.h),

      /// Description
      Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 12.w : screenWidth * 0.15),
        child: Text(
          "Vision Alliance is a trusted provider of electrical and electronics services and products in Bangladesh. Since its establishment in 2019, the company has been delivering reliable, high-quality solutions to both public and private sectors. Specializing in government tender-based projects, Vision Alliance works on a wide range of infrastructure—elevators, generators, substations, and power plants.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 14.sp : 18.sp,
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),
        ),
      ),

      SizedBox(height: 20.h),

      /// Slogan
      Text(
        "Powering the Future, Electrifying the Nation.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: isMobile ? 16.sp : 22.sp,
          fontWeight: FontWeight.w800,
        ),
      ),

      SizedBox(height: 30.h),

      /// Buttons
      Wrap(
        spacing: 20.w,
        runSpacing: 10.h,
        alignment: WrapAlignment.center,
        children: [
          cusButton("Learn More", Colors.white),
          InkWell(
            onTap: () => print("About Us clicked"),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
              decoration: BoxDecoration(
                border: Border.all(color: green, width: 2),
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.transparent,
              ),
              child: Text(
                "About Us",
                style: TextStyle(
                  color: green,
                  fontSize: isMobile ? 16.sp : 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
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
  State<AnimatedCounterOnScroll> createState() => _AnimatedCounterOnScrollState();
}

class _AnimatedCounterOnScrollState extends State<AnimatedCounterOnScroll> {
  final RxBool _visible = false.obs;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

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
        width: isMobile ? double.infinity : 220.w,
        height: isMobile ? 160.h : 200.h,
        margin: isMobile ? EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w) : EdgeInsets.zero,
        alignment: Alignment.center,
        child: Obx(
          () => _visible.value
              ? TweenAnimationBuilder(
                  tween: IntTween(begin: 0, end: widget.targetNumber),
                  duration: widget.duration,
                  builder: (context, value, child) {
                    return FittedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            widget.icon,
                            size: isMobile ? 50.r : 80.r,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '$value+',
                            style: TextStyle(
                              fontSize: isMobile ? 32.sp : 65.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            widget.label,
                            style: TextStyle(
                              fontSize: isMobile ? 16.sp : 24.sp,
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


class MobileAnimatedCounter extends StatefulWidget {
  final int targetNumber;
  final String label;
  final Duration duration;
  final IconData icon;

  const MobileAnimatedCounter({
    super.key,
    required this.targetNumber,
    required this.label,
    required this.duration,
    required this.icon,
  });

  @override
  State<MobileAnimatedCounter> createState() => _MobileAnimatedCounterState();
}

class _MobileAnimatedCounterState extends State<MobileAnimatedCounter> {
  final RxBool _visible = false.obs;

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

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
        width: isMobile ? double.infinity : 220.w,
        height: isMobile ? 160.h : 200.h,
        margin: isMobile ? EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w) : EdgeInsets.zero,
        alignment: Alignment.center,
        child: Obx(
          () => _visible.value
              ? TweenAnimationBuilder(
                  tween: IntTween(begin: 0, end: widget.targetNumber),
                  duration: widget.duration,
                  builder: (context, value, child) {
                    return FittedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            widget.icon,
                            size: isMobile ? 50.r : 80.r,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '$value+',
                            style: TextStyle(
                              fontSize: isMobile ? 32.sp : 65.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            widget.label,
                            style: TextStyle(
                              fontSize: isMobile ? 16.sp : 24.sp,
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



Widget mobileAnimatedCountdown() {
  final bool isMobile = ScreenUtil().screenWidth < 800;

  return SizedBox(
    height: isMobile ? 890.h : 240.h,
    width: double.infinity,
    child: Padding(
      padding:  EdgeInsets.symmetric(vertical: 15.h),
      child: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.network(
              "https://i.ibb.co/3Y7fXFNS/countdownimage.jpg",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, color: Colors.red),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
      
          /// Gradient Overlay
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
                    green.withOpacity(0.7)
                  ],
                ),
              ),
            ),
          ),
      
          /// Animated Counters
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20.w : 100.w,
                vertical: isMobile ? 30.h : 0,
              ),
              child: Align(
                alignment:
                    isMobile ? Alignment.topCenter : Alignment.centerLeft,
                child: isMobile
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MobileAnimatedCounter(
                            targetNumber: 50,
                            label: "Total Clients",
                            duration: const Duration(seconds: 3),
                            icon: Icons.factory,
                          ),
                          SizedBox(height: 20.h),
                          MobileAnimatedCounter(
                            targetNumber: 30,
                            label: "Ongoing Projects",
                            duration: const Duration(seconds: 3),
                            icon: Icons.pie_chart,
                          ),
                          SizedBox(height: 20.h),
                          MobileAnimatedCounter(
                            targetNumber: 50,
                            label: "Total Staff",
                            duration: const Duration(seconds: 3),
                            icon: Icons.work_history_outlined,
                          ),
                          SizedBox(height: 20.h),
                          MobileAnimatedCounter(
                            targetNumber: 100,
                            label: "Project Completed",
                            duration: const Duration(seconds: 3),
                            icon: Icons.account_balance_wallet_outlined,
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MobileAnimatedCounter(
                            targetNumber: 50,
                            label: "Total Clients",
                            duration: const Duration(seconds: 3),
                            icon: Icons.factory,
                          ),
                          SizedBox(width: 40.w),
                          MobileAnimatedCounter(
                            targetNumber: 30,
                            label: "Ongoing Projects",
                            duration: const Duration(seconds: 3),
                            icon: Icons.pie_chart,
                          ),
                          SizedBox(width: 40.w),
                          MobileAnimatedCounter(
                            targetNumber: 50,
                            label: "Total Staff",
                            duration: const Duration(seconds: 3),
                            icon: Icons.work_history_outlined,
                          ),
                          SizedBox(width: 40.w),
                          MobileAnimatedCounter(
                            targetNumber: 100,
                            label: "Project Completed",
                            duration: const Duration(seconds: 3),
                            icon: Icons.account_balance_wallet_outlined,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget whychooseContainerMobile(String title, String des, String imgUrl) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
    width: 250.w, // smaller width for mobile
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.r)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200.h,
          width: 200.w,
          decoration: BoxDecoration(color: green, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Container(
            height: 190.h,
            width: 190.w,
            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, color: Colors.red, size: 40.sp),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator(strokeWidth: 2));
              },
            ),
          ),
        ),
        SizedBox(height: 8.h),
        cusText(title, Colors.black, 18, FontWeight.bold),
        SizedBox(height: 8.h),
        SizedBox(
          width: 190.w,
          child: cusText(des, Colors.black, 13, FontWeight.w500),
        ),
      ],
    ),
  );
}



Widget whyChooseUsMobile() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
    width: double.infinity,
    color: Colors.black,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Title Section
        cusText("WHY CHOOSE US?", Colors.white, 16.sp, FontWeight.bold),
        SizedBox(height: 10.h),
        cusText(
          "FOR YOUR ELECTRIC & ELECTRONICS",
          Colors.white,
          13.sp,
          FontWeight.bold,
        ),
        SizedBox(height: 10.h),
        cusText("GOOD'S SERVICES", Colors.white, 13.sp, FontWeight.bold),

        SizedBox(height: 10.h),
        Container(width: double.infinity, height: 1.h, color: Colors.white),
        SizedBox(height: 30.h),

        /// Cards stacked vertically
        Column(
          children: [
            whychooseContainerMobile(
              "High-Quality",
              "We provide high-quality electronics and services that meet the highest standards of performance and durability. Every product is carefully selected, and every service is expertly delivered to ensure reliability, customer satisfaction, and long-term value you can trust.",
              "https://i.ibb.co/fG40h9Qd/professionalism.jpg",
            ),
            SizedBox(height: 30.h),
            whychooseContainerMobile(
              "Professionalism",
              "We deliver top-quality electronics and reliable services with professionalism at every step. Our expert team ensures precision, transparency, and customer satisfaction. From sales to support, we’re committed to excellence, building trust through every product and service we offer",
              "https://i.ibb.co/hxqnhqjX/p2.jpg",
            ),
            SizedBox(height: 30.h),
            whychooseContainerMobile(
              "Flexibility",
              "We adapt to your needs with flexible solutions in both products and services. Whether it’s customizing electronics, offering varied support options, or adjusting to your schedule, our goal is to provide convenience, comfort, and complete customer satisfaction.",
              "https://i.ibb.co/KcB7F23Y/p3.jpg",
            ),
          ],
        ),

        SizedBox(height: 30.h),

        /// Description text
        cusText(
          "Our company is committed to delivering top-tier electronics and electrical goods with a focus on flexibility, professionalism, and high-quality service. We adapt seamlessly to the unique needs of our clients, ensuring smooth operations and customized solutions. With a dedication to excellence, we maintain the highest industry standards while providing expert services tailored to every requirement. Our reliability and expertise set us apart, making us a trusted partner in electrical and electronic solutions.",
          Colors.white,
          12.sp,
          FontWeight.w300,
        ),
      ],
    ),
  );
}

Widget mobileOurProductContainer(){
 return  Container(
width: 350.w,
  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
  padding: EdgeInsets.all(16.w),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.r),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      /// Product Image
      ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.network(
          "https://i.ibb.co/BHFLMPGX/productimage-removebg-preview.png",
          height: 220.h,
          width: 300.w,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.broken_image, color: Colors.red, size: 40.sp),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),

      SizedBox(height: 20.h),

      /// Title
      cusText(
        "BEST PRODUCTS & SERVICE",
        green,
        18, // Reduced for mobile
        FontWeight.bold,
      ),

      SizedBox(height: 14.h),

      /// Description
      SizedBox(
        width: double.infinity,
        child: cusText(
          "Since 2013, we have been proudly producing high-quality electronics and electrical goods in Bangladesh. Our commitment to excellence and reliability has made us a trusted name in the industry. Customer satisfaction is our top priority, and we strive to meet their expectations by providing durable, efficient, and innovative products that meet international standards while maintaining affordability and exceptional service.",
          Colors.grey.shade900,
          14, // Mobile-optimized text size
          FontWeight.w500,
        ),
      ),
    ],
  ),
)
;
}


Widget mobilehomepageProduct(  GetxControllerForfirebase getxController,
){
  return Obx(() {
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

                return Wrap(
                  direction: Axis.vertical,
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: List.generate(
                    getxController.productList.length,
                    (index) {
                      final product = getxController.productList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        width: 250.w,
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
                                  SizedBox(
                                    width: 270.w,
                                    child: Text(
                                      product.description,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade900,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              });
}


Widget mobileExpertise() {
  return SizedBox(
    height: 850.h,
    width: double.infinity,
    child: Stack(
      children: [
        SizedBox(
          height: 750.h,
          width: double.infinity,
          child: Image.network(
            "https://i.ibb.co/3Y7fXFNS/countdownimage.jpg",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image, color: Colors.red),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        Positioned.fill(
          child: Container(
            color: green.withOpacity(0.8),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                cusText("OUR KEY-ASPECTS", Colors.white, 23, FontWeight.bold),
                SizedBox(height: 35.h),
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      mobileExpertiseContainer(
                        Icons.people_sharp,
                        "Rich Experience",
                        "We have been manufacturing elevators for 12 years, have strong R&D and manufacturing capabilities, and know the preferences of customers around the world.",
                      ),
                      SizedBox(height: 30.h),
                      mobileExpertiseContainer(
                        Icons.engineering,
                        "Professional Engineering",
                        "With 12 years’ experience, we specialize in elevator systems with advanced R&D, precision manufacturing, and global customer insight.",
                      ),
                      SizedBox(height: 30.h),
                      mobileExpertiseContainer(
                        Icons.money_outlined,
                        "Competitive Pricing",
                        "We offer high-quality elevator solutions at competitive prices, ensuring exceptional value without compromising on performance or safety.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget mobileExpertiseContainer(IconData icons, String title, String des) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(icons, size: 50.r, color: Colors.white),
      SizedBox(height: 12.h),
      cusText(title, Colors.white, 18, FontWeight.w700),
      SizedBox(height: 15.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          des,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    ],
  );
}


Widget mobileChooseUs() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Image
        SizedBox(
          height: 300.h,
         width: 350.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              "https://i.ibb.co/D31PVtf/choose-us.webp",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, color: Colors.red),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),

        SizedBox(height: 20.h),

        /// Bullet Points
        SizedBox(
          width: 350.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              mobileServiceBullet(
                'Extensive Experience in Power Plant Projects of All Scales',
              ),
              mobileServiceBullet(
                'Expertise in Thermal, Gas, Diesel, and Renewable Plants',
              ),
              mobileServiceBullet(
                'Timely Project Execution with Proven Operational Reliability',
              ),
              mobileServiceBullet(
                'Compliance with National Grid and International Standards',
              ),
              mobileServiceBullet(
                'Robust After-Commissioning Support and Maintenance',
              ),
              mobileServiceBullet(
                'Dedicated to Safety, Efficiency, and Environmental Standards',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget mobileServiceBullet(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, color: green, size: 18.sp),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}


Widget mobileContactUsForm() {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final primaryColor = const Color(0xFF007C3E);

  return StatefulBuilder(
    builder: (context, setState) {
      void submitForm() {
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Thank you, your message has been sent!',
                style: TextStyle(fontSize: 14.sp),
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
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
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          width: 350.w,
          child: Column(
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: 25.h),

              // Name
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: 'Name *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                style: TextStyle(fontSize: 14.sp),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),

              // Phone
              TextFormField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  prefixIcon: const Icon(Icons.phone),
                ),
                style: TextStyle(fontSize: 14.sp),
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
              SizedBox(height: 15.h),

              // Email
              TextFormField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                style: TextStyle(fontSize: 14.sp),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value.trim())) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),

              // Submit Button
              SizedBox(
                width: 200.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Send Message',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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


Widget mobileBottomNavbar() {
  return Container(
    width: double.infinity,
    color: Colors.black,
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Company Info
        customeSizedBox(210, [
          cusText("Vision Alliance", green, 16.sp, FontWeight.bold),
          SizedBox(height: 10.h),
          cusText("Phone : +880 1913-483915", green, 12.sp, FontWeight.bold),
          cusText("E-mail : visionalliance@gmail.com", green, 12.sp, FontWeight.bold),
          cusText("Address : Mohammadpur, Bosila, Dhaka- 1207", green, 12.sp, FontWeight.bold),
          SizedBox(height: 10.h),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.facebook, size: 35.r, color: Colors.white)),
              IconButton(onPressed: () {}, icon: Icon(Icons.whatshot, size: 35.r, color: Colors.white)),
            ],
          ),
        ]),

        SizedBox(height: 20.h),

        // COMPANY Section
        customeSizedBox(180, [
          cusText("COMPANY", green, 16.sp, FontWeight.bold),
          SizedBox(height: 10.h),
          cusText("About Us", Colors.white, 12.sp, FontWeight.w400),
          cusText("Products", Colors.white, 12.sp, FontWeight.w400),
          cusText("Support", Colors.white, 12.sp, FontWeight.w400),
          cusText("Career", Colors.white, 12.sp, FontWeight.w400),
        ]),

        SizedBox(height: 20.h),

        // LINKS Section
        customeSizedBox(180, [
          cusText("LINKS", green, 16.sp, FontWeight.bold),
          SizedBox(height: 10.h),
          cusText("Share Location", Colors.white, 12.sp, FontWeight.w400),
          cusText("Order Tracking", Colors.white, 12.sp, FontWeight.w400),
          cusText("Products Guide", Colors.white, 12.sp, FontWeight.w400),
          cusText("FAQs", Colors.white, 12.sp, FontWeight.w400),
        ]),

        SizedBox(height: 20.h),

        // LEGAL Section
        customeSizedBox(180, [
          cusText("LEGAL", green, 16.sp, FontWeight.bold),
          SizedBox(height: 10.h),
          cusText("Privacy & Policy", Colors.white, 12.sp, FontWeight.w400),
          cusText("Terms & Condition", Colors.white, 12.sp, FontWeight.w400),
          cusText("Support", Colors.white, 12.sp, FontWeight.w400),
          cusText("Careers", Colors.white, 12.sp, FontWeight.w400),
        ]),

        SizedBox(height: 20.h),

        // Email Subscription
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) => value == null ? 'Please enter some text' : null,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: green.withOpacity(0.8),
                labelText: 'Enter your email',
                labelStyle: const TextStyle(color: Colors.white),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: double.infinity,
              child: cusButton("SUBSCRIBE", Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget buildMobileOurServicesSection() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: services.map((service) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: buildMobileServiceItem(
            iconData: service['icon'],
            title: service['title'],
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildMobileServiceItem({
  required IconData iconData,
  required String title,
}) {
  return SizedBox(
    width: 220.w,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF27AE60),
          ),
          child: Icon(iconData, color: Colors.white, size: 26.sp),
        ),
        SizedBox(width: 30.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}


Widget buildMobileOurBrandsSection() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: ourbrandList.map((brand) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: ourBrandItem(
            url: brand['url'],
            title: brand['title'],
          ),
        );
      }).toList(),
    ),
  );
}


Widget buildMobileDirectorCard({
  required String name,
  required String designation,
  required String imageUrl,
}) {
  return Card(
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    shadowColor: Colors.black12,
    child: Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.network(
              imageUrl,
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2C3E50),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            designation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildMobileVmvCard({
  required String title,
  required IconData icon,
  required String description,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color(0xFFE4F7F1),
      borderRadius: BorderRadius.circular(12.r),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: green,
          child: Icon(icon, size: 36.r, color: Colors.white),
        ),
        SizedBox(height: 20.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
            color: green,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.sp,
            height: 1.8,
            color: const Color(0xFF2C2C2C),
          ),
        ),
      ],
    ),
  );
}

 
 Widget buildMobilePowerPlantSection() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Bullet Points List
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            serviceBullet('Power Plant Feasibility Study and Site Selection'),
            serviceBullet('Detailed Engineering Design and Layout Planning'),
            serviceBullet('Turbine, Generator, and Boiler Installation'),
            serviceBullet('Control System Integration and SCADA Setup'),
            serviceBullet('Electrical and Mechanical Equipment Commissioning'),
            serviceBullet('Power Plant Automation and Remote Monitoring'),
            serviceBullet('Fuel System Design (Gas, Diesel, Biomass, etc.)'),
            serviceBullet('Exhaust and Cooling System Installation'),
            serviceBullet('Environmental Compliance and Emission Control'),
          ],
        ),

        SizedBox(height: 24.h),

        // Image
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: Image.network(
            "https://i.ibb.co/1YrcQ5nV/powerplan.webp",
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.broken_image,
              color: Colors.red,
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    ),
  );
}
 

 
   Widget serviceBullet(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: green, size: 15.sp),
          SizedBox(width: 12.w),
          Expanded(child: Text(text, style: TextStyle(fontSize: 14.sp))),
        ],
      ),
    );
  }

   
Widget buildMobileContactCTA(BuildContext context) {
  return Container(
    width: double.infinity,
    color: green,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        cusText(
          "Have a question or need a custom quote?",
          Colors.black,
          14.sp,
          FontWeight.bold,
        ),
        SizedBox(height: 15.h),
        cusText(
          "Call us: +8801995767837\n\nEmail: info@vision-bd.com\n\nor simply tap below to contact",
          Colors.black87,
          11.sp,
          FontWeight.bold,
        ),
        SizedBox(height: 20.h),
        cusButton2("Contact Us", green, context),
      ],
    ),
  );
}
    
  





