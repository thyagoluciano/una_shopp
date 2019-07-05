import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:una_shopp/ui/tiles/category_tiles.dart';

class CategoriaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          var dividedTiles = ListTile
            .divideTiles(
              tiles: snapshot.data.documents.map((document){
                return CategoryTiles(document);
              }).toList(),
              color: Colors.grey[500]
            ).toList();

          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}