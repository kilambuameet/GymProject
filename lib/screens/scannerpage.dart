import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gym_app/screens/paymentdetail.dart';

class ScannerPayment extends StatelessWidget {
  late String bodyType;
  late String packageType;
  ScannerPayment({required this.bodyType, required this.packageType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Esewa Payment")
      ),
      floatingActionButton: InkWell(
        onTap: () => Get.to(() => paymentdetailpage(
              bodytype: bodyType,
              packagetype: packageType,
            )),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 76, 142, 175),
          child: FaIcon(Icons.payment, color: Colors.black,size: 40,),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/qr1.jpg',
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '-------',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Or',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '-------',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/esewa.png"),
                      height: 50,
                      width: 60,
                    ),
                    Text("9860-XXXXXX"),
                  ],
                ),
              ),
              SizedBox(
                height: 55,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
