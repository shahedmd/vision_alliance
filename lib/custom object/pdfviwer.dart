import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';

final List<Map<String, String>> certificates = [
  {
    "title": "TIN Certificate",
    "description":
        "This is our company’s official Taxpayer Identification Number certificate issued by NBR.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Trade License",
    "description":
        "Government-approved trade license proving our business legitimacy.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "VAT Registration",
    "description": "Company VAT registration document under NBR authority.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Tax Clearance",
    "description": "Yearly tax clearance certificate from the tax authority.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Import Certificate",
    "description": "Permission document for product import authorization.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Fire Safety License",
    "description": "Government-issued fire safety clearance for the premises.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Environmental Clearance",
    "description": "Clearance certificate ensuring eco-friendly compliance.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Company Registration",
    "description": "Certificate from RJSC proving legal registration.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Bank Solvency",
    "description": "Bank-issued certificate showing our financial credibility.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
  {
    "title": "Project Approval",
    "description": "Govt. project permission issued for large-scale work.",
    "pdfUrl":
        "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
  },
];

class PdfControler extends GetxController {
  final Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? u) {
      user.value = u;
    });
    super.onInit();
  }

  void openPdf(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not open $url';
    }
  }

  Widget showPdfvision(BuildContext context) {
    void showCustomDialog(BuildContext context) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Log In!'),
            content: const Text('Login To Download File.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }

    return SizedBox(
      width: 1300.w,
      child: Wrap(
        spacing: 40.w,
        runSpacing: 40.h,
        alignment: WrapAlignment.center,
        children:
            certificates.map((cert) {
              return SizedBox(
                width: 300.h,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.picture_as_pdf,
                          size: 48.sp,
                          color: Colors.red,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          cert["title"]!,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(cert["description"]!),
                        SizedBox(height: 12.h),

                        ElevatedButton.icon(
                          onPressed: () {
                            if (user.value == null) {
                              return showCustomDialog(context);
                            } else {
                              openPdf(cert["pdfUrl"]!);
                            }
                          },
                          icon: Icon(Icons.open_in_new, color: Colors.white),
                          label: Text(
                            "View PDF",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
