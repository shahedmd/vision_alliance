import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vision_alliance/webfolder/F.B%20getxcontroller/getxControllerFB.dart';

Widget computer(
  BuildContext context,
  GetxControllerForfirebase getxController,
) {
  return Obx(() {
    if (getxController.oSlabequipmentbool.value) {
      return Center(child: CircularProgressIndicator());
    }

    if (getxController.oSlabequipmentProducts.isEmpty) {
      return Center(
        child: Text(
          "No products found.",
          style: TextStyle(fontSize: 18.sp, color: Colors.black54),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Wrap(
                alignment: WrapAlignment.center,

        spacing: 16.w,
        runSpacing: 16.h,
        children: getxController.oSlabequipmentProducts.map((product) {
          return _buildHoverCard(product);
        }).toList(),
      ),
    );
  });
}

Widget _buildHoverCard(dynamic product) {
  bool isHovered = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 320.w,
          height: 280.h,
          decoration: BoxDecoration(
            color: isHovered ? Color(0xFF4CAF50) : Colors.white,
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
                  errorBuilder: (_, __, ___) =>
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
                  color: isHovered ? Colors.white : Colors.grey.shade900,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}
