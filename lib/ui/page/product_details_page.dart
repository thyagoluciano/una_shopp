import 'package:flutter/material.dart';
import 'package:una_shopp/models/product_models.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModels product;
  
  ProductDetailsPage(this.product);

  @override
  _State createState() => _State(product);
}

class _State extends State<ProductDetailsPage> {

   final ProductModels product;

  String size;

  _State(this.product);

  @override
  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url){
                return NetworkImage(url);
              }).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: true,
              autoplayDuration: Duration(seconds: 5),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                  ),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor
                  ),
                ),
                SizedBox(height: 16.0,),
                Text(
                  "Tamanho",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 16.0,),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    onPressed: size != null ?
                    (){
                      // if(UserModel.of(context).isLoggedIn()){

                      //   CartProduct cartProduct = CartProduct();
                      //   cartProduct.size = size;
                      //   cartProduct.quantity = 1;
                      //   cartProduct.pid = product.id;
                      //   cartProduct.category = product.category;
                      //   cartProduct.productData = product;

                      //   CartModel.of(context).addCartItem(cartProduct);

                      //   Navigator.of(context).push(
                      //       MaterialPageRoute(builder: (context)=>CartScreen())
                      //   );

                      // } else {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context)=>LoginScreen())
                      //   );
                      // }
                    } : null,
                    // child: Text(UserModel.of(context).isLoggedIn() ? "Adicionar ao Carrinho"
                    child: Text(true == false ? "Adicionar ao Carrinho"
                      : "Entre para Comprar",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0,),
                Text(
                  "Descrição",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}