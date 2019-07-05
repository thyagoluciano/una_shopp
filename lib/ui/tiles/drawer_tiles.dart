import 'package:flutter/material.dart';

class DrawerTiles extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTiles(this.icon, this.text, this.pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: pageController.page.round() == page 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey[700],
              ),
              SizedBox(width: 32,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: pageController.page.round() == page 
                  ? Theme.of(context).primaryColor 
                  : Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}