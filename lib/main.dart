import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 88, 58),
      body: Stack(
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 1.5 / 3.0,
            child: Center(
              child: Image.asset(
                'assets/icons/coffe1.png',
                width: 200,
                height: 200,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
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
