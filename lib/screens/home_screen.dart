import 'package:flutter/material.dart';
import 'package:flutter_order_food/widgets/food_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff21BFBD),
        body: screenBody()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  //create screen body listView
  ListView screenBody(){
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: (){},
              ),
              Container(
                width: 125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.filter_list, color: Colors.white),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: (){},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Row(
            children: <Widget>[
              Text('Restaurant',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white
                ),
              ),
              SizedBox(width: 10.0),
              Text('Food',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(85)),
          ),
          child: foodListView(),
        )
      ],
    );
  }

  //create food listView
  ListView foodListView(){
    return ListView(
      primary: false,
      padding: EdgeInsets.only(left: 25, right: 5),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 45),
          child: Container(
            height: MediaQuery.of(context).size.height - 230,
            child: ListView(
              children: <Widget>[
                foodListItem("images/plate1.png", "dish 1", "20DT"),
                foodListItem("images/plate2.png", "dish 2", "15DT"),
                foodListItem("images/plate3.png", "dish 3", "30DT"),
                foodListItem("images/plate4.png", "dish 4", "18DT"),
                foodListItem("images/plate5.png", "dish 5", "25DT"),
                foodListItem("images/plate6.png", "dish 6", "27DT"),
              ],
            ),
          ),
        )
      ],
    );
  }

}
