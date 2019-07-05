import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModels {
  String category;
  String id;
  String title;
  String description;
  double price;
  List images;

  ProductModels.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"];
    images = snapshot.data["images"];
  }
}