import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/mobilescreen/basicelements.dart/mobileelements.dart';

class MobileSpeech extends StatefulWidget {
  const MobileSpeech({super.key});

  @override
  State<MobileSpeech> createState() => _MobileSpeechState();
}

class _MobileSpeechState extends State<MobileSpeech> {
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
          child: Column(
          children: [
            SizedBox(height: 20.h,),
            header(context),
            SizedBox(height: 15.h,),
            
          speechCard(
                  title: "Chairman's Speech",
                  imageUrl:
                      'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?auto=format&fit=crop&w=800&q=80',
                  speech: '''At At Vision Alliance Ltd., we are committed to powering Bangladesh’s progress with excellence and responsibility. Our work spans from powerplants and substations to land development and digital innovation. As a trusted government partner, we ensure infrastructure that supports national resilience and sustainable growth. Beyond energy, our land development initiatives support smart, inclusive communities aligned with the country's priorities. At the same time, our IT services help transform public and private sectors through modern apps, platforms, and secure digital systems tailored to local needs. What truly sets us apart is our dedication to responsible innovation and future-readiness. Our expert teams work with integrity and passion, upholding the highest standards in safety, sustainability, and service. Together, we are not just powering infrastructure—we are energizing lives, enabling opportunity, and building a greener tomorrow. Thank you for your continued trust and support.''',
                  context: context
                ),

                SizedBox(height: 20.h,),
                speechCard(
                  title: "Director's Speech",
                  imageUrl:
                      'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?auto=format&fit=crop&w=800&q=80',
                  speech: '''At At Vision Alliance Ltd., we are committed to powering Bangladesh’s progress with excellence and responsibility. Our work spans from powerplants and substations to land development and digital innovation. As a trusted government partner, we ensure infrastructure that supports national resilience and sustainable growth. Beyond energy, our land development initiatives support smart, inclusive communities aligned with the country's priorities. At the same time, our IT services help transform public and private sectors through modern apps, platforms, and secure digital systems tailored to local needs. What truly sets us apart is our dedication to responsible innovation and future-readiness. Our expert teams work with integrity and passion, upholding the highest standards in safety, sustainability, and service. Together, we are not just powering infrastructure—we are energizing lives, enabling opportunity, and building a greener tomorrow. Thank you for your continued trust and support.''',
               context: context ),
               SizedBox(height: 70.h,),
               mobileBottomNavbar()
         ],
                ),
        ),),
    );
  }
}