import 'package:flutter/material.dart';
import 'package:una_shopp/ui/page/signup_page.dart';
import 'package:una_shopp/ui/tiles/drawer_tiles.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  CustomDrawer(this.pageController);

  Widget _drawerBack() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 203, 236, 241),
          Colors.white
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
      )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _drawerBack(),
          ListView(
            padding: const EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Text(
                        "Una Flutter's \nShopp",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Olá", 
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => SignupPage())
                              );
                            },
                            child: Text(
                              "Entre ou Cadastre-se", 
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),

              DrawerTiles(Icons.home, "Início", pageController, 0),
              DrawerTiles(Icons.list, "Produtos", pageController, 1),
              DrawerTiles(Icons.location_on, "Lojas", pageController, 2),
              DrawerTiles(Icons.playlist_add_check, "Meus Pedidos", pageController, 3)
            ],
          )
        ],
      ),
    );
  }
}