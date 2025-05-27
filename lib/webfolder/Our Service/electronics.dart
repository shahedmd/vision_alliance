import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vision_alliance/custom%20object/basicelement.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

Widget electronics(
  BuildContext context,
  GetxControllerForfirebase getxController,
) {
  return Obx(() {
    if (getxController.oSelectronics.value) {
      return Center(child: CircularProgressIndicator());
    }

    if (getxController.electronics.isEmpty) {
      return Center(
        child: Text(
          "No products found.",
          style: TextStyle(fontSize: 18.sp, color: Colors.black54),
        ),
      );
    }
    return InkWell(
      onTap: (){},
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Wrap(
            spacing: 16.w,
            runSpacing: 16.h, 
            children:
                getxController.electronics.map((product) {
                  return SizedBox(
                    width: 320.w,
                    height: 280.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100.h,
                            child: Image.network(
                              product.iconurl,
                              fit: BoxFit.contain,
                              errorBuilder:
                                  (_, __, ___) =>
                                      Icon(Icons.broken_image, color: Colors.red),
                              loadingBuilder: (_, child, loading) {
                                return loading == null
                                    ? child
                                    : Center(child: CircularProgressIndicator());
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade900,
                            ),
                            textAlign: TextAlign.center,
                    
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  });
}
