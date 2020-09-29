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

  var selectedCard = "Weight";

  int requestQuantity = 1;

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
        title: Text(name),
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
                children: <Widget>[
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
            ),
            Positioned(
              top: 250,
              left: 25,
              right: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Price',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Colors.grey
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 40,
                        width: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Color(0xff7A9BEE)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if(requestQuantity>1){
                                    requestQuantity--;
                                  }
                                });
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xff7A9BEE)
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              requestQuantity.toString(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  requestQuantity++;
                                });
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xff7A9BEE)
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 150,
                    child: weightCards(),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  //create weight cards
  ListView weightCards(){
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        weightCardItem("height", "100C", "kg"),
        SizedBox(width: 10),
        weightCardItem("low", "200C", "kg"),
        SizedBox(width: 10),
        weightCardItem("quantity", "300C", "kg"),
        SizedBox(width: 10),
        weightCardItem("quality", "400C", "kg"),
        SizedBox(width: 10),
        weightCardItem("sugar", "500C", "kg"),
        SizedBox(width: 10),
      ],
    );
  }

  Widget weightCardItem(String title, String info, String unit){

    return InkWell(
      onTap: (){
        selectCard(title);
      },
      child: AnimatedContainer(
        width: 100,
        height: 100,
        duration: Duration(microseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: title == selectedCard ? Color(0xff7A9BEE) : Colors.grey.withOpacity(0.2),
            border: Border.all(
              color: title == selectedCard ? Colors.transparent : Color(0xff7A9BEE),
              style: BorderStyle.solid,
              width: 0.75
            )
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                info,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: title == selectedCard ? Colors.white : Colors.grey
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: title == selectedCard ? Colors.white : Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  selectCard(title){
    setState(() {
      selectedCard = title;
    });
  }

}
