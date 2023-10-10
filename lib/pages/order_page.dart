import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderPage extends StatefulWidget {
  final String image;
  final String name;
  final String bill;
  bool isFavorite;
  final String descriptiontxt;
  final String coffeVolume;

  OrderPage({
    Key? key,
    required this.image,
    required this.name,
    required this.bill,
    required this.isFavorite,
    required this.descriptiontxt,
    required this.coffeVolume,
  });

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 0;
  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double price = double.parse(widget.bill);
    double totalPrice = price * quantity;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 44, 34),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.favorite,
              color: widget.isFavorite ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.brown,
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    child: Container(
                      height: 250,
                      width: 400,
                      color: const Color.fromARGB(255, 70, 44, 34),
                      child: Image.asset(
                        widget.image,
                        alignment: Alignment.topCenter,
                        width: 350,
                        height: 350,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: decrement,
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: increment,
                              child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 200),
                  Text(
                    '\$$totalPrice',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    widget.descriptiontxt,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    widget.coffeVolume,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Successfully orderd ${widget.name}"),
                      content: Text("You orderd $quantity ${widget.name}!"),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            "OK",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Order now!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 70, 44, 34),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(250, 35),
              ),
            ),
          )
        ],
      ),
    );
  }
}
