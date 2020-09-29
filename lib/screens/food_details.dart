import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetails extends StatefulWidget {

  final heroTag;
  final name;
  final price;

  FoodDetails(this.heroTag, this.name, this.price);

  @override
  _FoodDetailsState createState() => _FoodDetailsState(this.heroTag, this.name, this.price);
}

class _FoodDetailsState extends State<FoodDetails> {

  final heroTag;
  final name;
  final price;

  _FoodDetailsState(this.heroTag, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return scaffoldBody();
  }

  //create screen body
  Scaffold scaffoldBody(){
    return Scaffold(
      backgroundColor: Color(0xff7A9BEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('Details'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: foodDetails(),
    );
  }

  //create food details
  ListView foodDetails(){
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              top: 80,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)
                  )
                ),
              ),
            ),
            Positioned(
              top: 20,
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Hero(
                    tag: widget.heroTag,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.heroTag),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

}
