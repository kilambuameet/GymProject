import 'package:flutter/material.dart';

class allpackage extends StatefulWidget {
  const allpackage({Key? key}) : super(key: key);

  @override
  State<allpackage> createState() => _allpackageState();
}

class _allpackageState extends State<allpackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Packages"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  "OverWeight",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                ),
              ),
              new Container(
                  width: 500.00,
                  height: 500.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage('assets/images/plan.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Text(
                  "UnderWeight",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                ),
                    ),
                   new Container(
                  width: 500.00,
                  height: 500.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage('assets/images/plan4.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
                   Padding(
                     padding: const EdgeInsets.all(50.0),
                     child: Text(
                  "HealthyWeight",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                ),
                   ),
                   new Container(
                  width: 500.00,
                  height: 500.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage('assets/images/plan.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
                   Padding(
                     padding: const EdgeInsets.all(50.0),
                     child: Text(
                  "Obese",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                ),
                   ),
                   new Container(
                  width: 500.00,
                  height: 500.00,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: AssetImage('assets/images/plan4.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
            ],
          ),
          
        ),
      ),
    );
  }
}
