// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vision_alliance/Produts%20Models/homepagemodel.dart';
import 'package:vision_alliance/Produts%20Models/ourservicemodel.dart';

class GetxControllerForfirebase extends GetxController {
  final RxList<String> imageUrls = <String>[].obs;
  final RxBool homepageProdutsLoading = false.obs;
  var productList = <Homepagemodel>[].obs;
  var electronics = <Ourservicemodel>[].obs;
  final RxBool oSelectronics = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchImageUrls();
    homepageProductsFetch();
    getElectronics();
  }

  Future<void> fetchImageUrls() async {
    try {
      final docSnapshot =
          await FirebaseFirestore.instance
              .collection("homepageSlides")
              .doc("kXGNqAld3yp2kbuCVI0f")
              .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null && data['imageurl'] is List) {
          List<dynamic> imageUrlsDynamic = data['imageurl'];
          imageUrls.value = imageUrlsDynamic.map((e) => e.toString()).toList();
        }
      }
    } catch (e) {
      // ignore: duplicate_ignore
      // ignore: avoid_print
      print("firebase error: ${e.toString()}");
    }
  }

  Future<List<Homepagemodel>> homepageProductsFetch() async {
    homepageProdutsLoading.value = true;
    try {
      QuerySnapshot collection =
          await FirebaseFirestore.instance.collection("homePageProducts").get();

      return productList.value =
          collection.docs.map((doc) {
            final map = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...map});
          }).toList();
    } catch (e) {
      print(e.toString());

      return [];
    } finally {
      homepageProdutsLoading.value = false;
    }
  }

  Future<List<Ourservicemodel>> getElectronics() async {
    oSelectronics.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("OSelectronics").get();
      return electronics.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Ourservicemodel.fromFiresotre({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      oSelectronics.value = false;
    }
  }
}
