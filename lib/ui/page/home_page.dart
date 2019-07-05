import 'package:flutter/material.dart';
import 'package:una_shopp/ui/tab/categoria_tab.dart';
import 'package:una_shopp/ui/tab/home_tab.dart';
import 'package:una_shopp/ui/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _pageController = PageController();

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            centerTitle: true,
          ),
          body: CategoriaTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Container(color: Colors.yellow,)
      ],
    );
  }
}