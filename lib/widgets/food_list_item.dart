import 'dart:math';

import 'package:flutter/material.dart';

Widget foodListItem(String picture, String name, String price){
  return Padding(
    padding: EdgeInsets.all(5),
    child: InkWell(
      onTap: (){},
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