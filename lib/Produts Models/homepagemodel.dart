
class Homepagemodel {
  String name;
  String imageUrl;
  String price;
  String description;
  Homepagemodel({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  factory Homepagemodel.fromFirestore(Map<String, dynamic> doc) {
    return Homepagemodel(
      name: doc["name"],
      imageUrl:doc["url"] ,
      price:  doc["price"],
      description:  doc["des"],
    );
  }
}
