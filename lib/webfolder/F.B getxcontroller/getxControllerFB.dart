// ignore_for_file: file_names, avoid_print

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vision_alliance/Produts%20Models/homepagemodel.dart';
import 'package:vision_alliance/Produts%20Models/ourservicemodel.dart';

class GetxControllerForfirebase extends GetxController {
  final RxList<String> imageUrls = <String>[].obs;
  final RxBool homepageProdutsLoading = false.obs;
  var productList = <Homepagemodel>[].obs;
  var oSelectronicsProducts = <Ourservicemodel>[].obs;
  final RxBool oSelectronicsbool = false.obs;
  var oSelectricalProduct = <Ourservicemodel>[].obs;
  final RxBool oSelectricalbool = false.obs;
  var oSlabequipmentProducts = <Ourservicemodel>[].obs;
  final RxBool oSlabequipmentbool = false.obs;

  var labequipmnetProductslimit = [].obs;
  final RxBool labequipmentboollimit = false.obs;

  var electronicsProductslistLimit = <Homepagemodel>[].obs;
  final electronicsProductsboollimit = false.obs;

  var electricalProductslistlimit = <Homepagemodel>[].obs;
  final eletricalProductboollimit = false.obs;

  var elecProducs = <Homepagemodel>[].obs;
  final elecbool = false.obs;

  var electronicsProduct = <Homepagemodel> [].obs;
  final electronicsbool = false.obs;

  var computerProdut = <Homepagemodel> [].obs;
  final computerbool = false.obs;

  var powerplantandsubstationproduct = <Homepagemodel> [].obs;
  final powerplansubstationbool = false.obs;

  @override
  void onInit() {
    super.onInit();
    computerProductsget();
    fetchImageUrls();
    homepageProductsFetch();
    getElectronics();
    getElectrical();
    getLabequipment();
    getElectronicsProducts();
    getElectricalProducts();
    getLabequimentProducts();
elecricalProductsNolimit();
electronicsProductget();
powerplantandsubstation();
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
    oSelectronicsbool.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("OSelectronics").get();
      return oSelectronicsProducts.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Ourservicemodel.fromFiresotre({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      oSelectronicsbool.value = false;
    }
  }

  Future<List<Ourservicemodel>> getElectrical() async {
    oSelectricalbool.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("OSelectrical").get();
      return oSelectricalProduct.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Ourservicemodel.fromFiresotre({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      oSelectricalbool.value = false;
    }
  }

  Future<List<Ourservicemodel>> getLabequipment() async {
    oSlabequipmentbool.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("labEquipment").get();
      return oSlabequipmentProducts.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Ourservicemodel.fromFiresotre({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      oSlabequipmentbool.value = false;
    }
  }


   Future<List<Homepagemodel>> getLabequimentProducts() async {
    labequipmentboollimit.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection("LabequipmentProducts")
              .limit(6)
              .get();
      return labequipmnetProductslimit.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      labequipmentboollimit.value = false;
    }
  }

  Future<List<Homepagemodel>> getElectronicsProducts() async {
    electronicsProductsboollimit.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection("electronicsProducts")
              .limit(8)
              .get();
      return electronicsProductslistLimit.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...data});
          }).toList();
    } catch (e) {
      print("the error is: ${e.toString()}");
      return [];
    } finally {
      electronicsProductsboollimit.value = false;
    }
  }

  Future<List<Homepagemodel>> getElectricalProducts() async {
    eletricalProductboollimit.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection("electricalProducts")
              .limit(8)
              .get();
      return electricalProductslistlimit.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      eletricalProductboollimit.value = false;
    }
  }

 

  Future<List<Homepagemodel>> elecricalProductsNolimit() async {
    elecbool.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection("electricalProducts")
              .get();
      return elecProducs.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      elecbool.value = false;
    }
  }

  Future<List<Homepagemodel>> electronicsProductget() async {
    electronicsbool.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection("electronicsProducts")
              .get();
      return electronicsProduct.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      electronicsbool.value = false;
    }
  }

   Future<List<Homepagemodel>> computerProductsget() async {
    computerbool.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection("LabequipmentProducts")
              .get();
      return computerProdut.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      computerbool.value = false;
    }
  }

  Future<List<Homepagemodel>> powerplantandsubstation() async {
    powerplansubstationbool.value = true;
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance
              .collection("Powerplant&SubstationProducts")
              .get();
      return powerplantandsubstationproduct.value =
          snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homepagemodel.fromFirestore({...data});
          }).toList();
    } catch (e) {
      print(e.toString());
      return [];
    } finally {
      powerplansubstationbool.value = false;
    }
  }
}
