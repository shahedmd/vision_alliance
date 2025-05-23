import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/firebase_options.dart';
import 'package:vision_alliance/webfolder/webhomepage.dart';
import './mobilescreen/mobilehomepage.dart';


void main () async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

      final screenWidth = MediaQuery.of(context).size.width;
    double heightFinal = 1040.0;
    double widthFinal = 1440.0;
    if (screenWidth > 1600) {
      heightFinal = 1050.0;
      widthFinal = 1680.0;
    }
    if (screenWidth > 1800) {
      heightFinal = 1280.0;
      widthFinal = 1980.0;
    }
    if (650 > screenWidth) {
      heightFinal = 932.0;
      widthFinal = 430.0;
    }
    return ScreenUtilInit(
        designSize: Size(widthFinal, heightFinal),
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              iconTheme: const IconThemeData(color: Colors.white)
            ),
            home: child,
           
          );
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 650) {
              return const MobileHomePage();
            }

            return const Webhomepage();
          },
        ));
  }
}