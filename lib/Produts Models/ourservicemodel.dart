import "package:flutter/material.dart";

class Ourservicemodel {
  String name;
  String iconurl;
  Ourservicemodel({required this.iconurl, required this.name});

  factory Ourservicemodel.fromFiresotre(Map<String, dynamic> doc) {
    return Ourservicemodel(iconurl: doc['iconurl'], name: doc['name']);
  }
}
