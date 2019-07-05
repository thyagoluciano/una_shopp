import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:una_shopp/models/product_models.dart';
import 'package:una_shopp/ui/tiles/produc_ttile.dart';

class ProductPage extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ProductPage(this.snapshot);
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data['title']),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),

        body: FutureBuilder<QuerySnapshot>(
          future: Firestore
            .instance
            .collection("products")
            .document(snapshot.documentID)
            .collection("items")
            .getDocuments(),
          builder: (context, items) {
            if (!items.hasData) {
              return Center(child: CircularProgressIndicator(),);
            } else {
              return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  GridView.builder(
                    padding: const EdgeInsets.all(4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      childAspectRatio: 0.65
                    ),
                    itemCount: items.data.documents.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        "grid",
                        ProductModels.fromDocument(items.data.documents[index])
                      );
                    },
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.all(4),
                    itemCount: items.data.documents.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        "list",
                        ProductModels.fromDocument(items.data.documents[index])
                      );
                    },
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}