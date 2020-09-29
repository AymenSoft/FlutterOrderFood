import 'package:flutter/material.dart';
import 'package:flutter_order_food/screens/food_details.dart';

Widget foodListItem(context, String picture, String name, String price){
  return Padding(
    padding: EdgeInsets.all(5),
    child: InkWell(
      onTap: (){
        Navigator.push(context, SlideRightRoute(FoodDetails(picture, name, price)));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Hero(
                  tag: picture,
                  child: Image(
                    image: AssetImage(picture),
                    fit: BoxFit.cover,
                    height: 75,
                    width: 75,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Colors.grey
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.add_circle),
            color: Color(0xff21BFBD),
          )
        ],
      ),
    ),
  );
}

//slide screens when open/close
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute(this.page)
      : super(
      transitionDuration: Duration(milliseconds: 2000),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}