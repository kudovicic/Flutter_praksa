import 'package:flutter/material.dart';
import 'package:myapp/pages/butoon_model.dart';
import 'package:myapp/pages/order_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    

    List<buttonModel> data = [
      buttonModel(title: 'Chemex', imagePath: 'assets/icons/prva.png', price: '2.25', Description: 'Try coffes from Kenya, Ethiopia', isSelected: 0,text:'Coffee is a beverage brewed from the roasted and ground seeds of the tropical evergreen coffee plant.',Volume: 'Volume: 32 Oz' ),
      buttonModel(title: 'French Press', imagePath: 'assets/icons/cetvrta.png', price: '3.25', Description: 'Try coffes from Sumatra,Mexico', isSelected: 1,text:'Coffee is one of the three most popular beverages in the world (alongside water and tea), and it is one of the most profitable international commodities.',Volume:'Volume: 23 Oz' ),
      buttonModel(title: 'Latte', imagePath: 'assets/icons/cetvrta.png', price: '4.25', Description: 'Try coffes from Kenya, Ethiopia', isSelected: 2,text:'Coffee is a drink prepared from roasted coffee beans, seeds of the Coffea plant species. It is darkly colored, bitter, slightly acidic, and has a stimulating effect on humans, primarily due to its caffeine content, and is one of the most popular drinks in the world.',Volume:'Volume: 34 Oz' ),
      buttonModel(title: 'Cappuccino', imagePath: 'assets/icons/treca.png', price: '2.25', Description: 'Try coffes from Sumatra,Mexico', isSelected: 3,text:'Coffee is one of the three most popular beverages in the world (alongside water and tea), and it is one of the most profitable international commodities.',Volume:'Volume: 45 Oz' ),
      
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: 500,
            top: 0,
            child: Container(
              child: Image.asset(
                'assets/images/coffe.jpg',
              ),
            ),
          ),
          Positioned(
            top: 300,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                height: 2 * MediaQuery.of(context).size.height / 3,
                color: Colors.brown,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Brewing Coffee',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            RoundedButton(
                              title: data[0].title,
                              img: data[0].imagePath,
                              price: data[0].price,
                              description: data[0].Description,
                              text:data[0].text,
                              Volume: data[0].Volume,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              title: data[1].title,
                              img: data[1].imagePath,
                              price: data[1].price,
                              description: data[1].Description,
                              text:data[1].text,
                              Volume: data[1].Volume,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Esspreso',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            RoundedButton(
                              title: data[2].title,
                              img: data[2].imagePath,
                              price: data[2].price,
                              description: data[2].Description,
                              text:data[2].text,
                              Volume: data[2].Volume,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              title: data[3].title,
                              img: data[3].imagePath,
                              price: data[3].price,
                              description: data[3].Description,
                              text:data[3].text,
                              Volume: data[3].Volume,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatefulWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.img,
    required this.price,
    required this.description,
    required this.text,
    required this.Volume,
  }) : super(key: key);

  final String title;
  final String img;
  final String price;
  final String description;
  final String text;
  final String Volume;
  
  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
 
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderPage(
                image: widget.img,
                name: widget.title,
                bill: widget.price,
                isFavorite : toggle,
                descriptiontxt: widget.text,
                coffeVolume: widget.Volume,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 222, 172, 152),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  widget.img,
                  width: 90,
                  height: 90,
                ),
                IconButton(
                  icon: toggle
                  ? Icon(Icons.favorite, color: Colors.red,)
                  : Icon(Icons.favorite, color: Colors.white,),
                  onPressed: () {
                    setState(() {
                     toggle = !toggle;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(widget.description,
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
