// 2️⃣ dynamic_tab_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_alliance/webfolder/Our%20Service/electrical.dart';
import 'package:vision_alliance/webfolder/Our%20Service/electronics.dart';
import 'package:vision_alliance/webfolder/Our%20Service/labequipment.dart';
import 'package:vision_alliance/webfolder/Our%20Service/techtraining.dart';
import '../../webfolder/F.B%20getxcontroller/getxControllerFB.dart';





class DynamicTabSection extends StatefulWidget {
  final GetxControllerForfirebase getxController;
  final Color green;

  const DynamicTabSection({
    super.key,
    required this.getxController,
    required this.green,
  });

  @override
  State<DynamicTabSection> createState() => _DynamicTabSectionState();
}

class _DynamicTabSectionState extends State<DynamicTabSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {}); 
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildCurrentTab() {
    switch (_tabController.index) {
      case 0:
        return electrical(context, widget.getxController);
      case 1:
        return electronics(context, widget.getxController);
      case 2:
        return computer(context, widget.getxController);
      case 3:
        return techTraining();
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 1100.w,
          child: TabBar(
            controller: _tabController,
            labelColor: widget.green,
            unselectedLabelColor: Colors.grey.shade900,
            labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 16.sp),
            tabs: const [
              Tab(icon: Icon(Icons.electrical_services), text: "Electrical"),
              Tab(icon: Icon(Icons.electric_meter_outlined), text: "Electronics"),
              Tab(icon: Icon(Icons.computer), text: "Lab Equipment"),
              Tab(icon: Icon(Icons.school), text: "Technical Training"),
            ],
          ),
        ),

        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: _buildCurrentTab(),
          ),
        ),
      ],
    );
  }
}
