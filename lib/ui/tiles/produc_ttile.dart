import 'package:flutter/material.dart';
import 'package:una_shopp/models/product_models.dart';
import 'package:una_shopp/ui/page/product_details_page.dart';

class ProductTile extends StatelessWidget {

  final String type;
  final ProductModels product;
  
  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetailsPage(product))
        );
      },
      child: Card(
        child: type == "grid"
         ? Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             AspectRatio(
               aspectRatio: 0.8,
               child: Image.network(
                 product.images[0],
                 fit: BoxFit.cover,
               ),
             ),
             Expanded(
               child: Container(
                 padding: const EdgeInsets.all(8),
                 child: Column(
                   children: <Widget>[
                     Text(
                       product.title,
                       style: TextStyle(
                         fontWeight: FontWeight.w500
                       ),
                     ),
                     Text(
                       "R\$ ${product.price.toStringAsFixed(2)}",
                       style: TextStyle(
                         color: Theme.of(context).primaryColor,
                         fontSize: 17,
                         fontWeight: FontWeight.bold
                       ),
                     )
                   ],
                 ),
               ),
             )
           ],
         )
         : Row(
           children: <Widget>[
             Flexible(
               flex: 1,
               child: Image.network(
                 product.images[0],
                 fit: BoxFit.cover,
                 height: 100,
               ),
             ),
            Flexible(
             child: Column(
               children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500
                    ),
                  ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                )
               ],
             ), 
            )
           ],
         ),
      ),
    );
  }
}