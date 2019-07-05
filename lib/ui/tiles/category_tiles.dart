import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:una_shopp/ui/page/product_page.dart';

class CategoryTiles extends StatelessWidget {

  final DocumentSnapshot document;
  CategoryTiles(this.document);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(document.data["icon"]),
      ),
      title: Text(document.data["title"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductPage(document))
        );
      },
    );
  }
}