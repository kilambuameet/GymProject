import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/providers/auth_provider.dart';
import 'package:gym_app/screens/drawer_widget.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final designDescription = TextEditingController();
  final designAmount = TextEditingController();
  final _form = GlobalKey<FormState>();
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final List<String> imageList = [
    "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80.jpg",
    "https://images.unsplash.com/photo-1605296867304-46d5465a13f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg",
    "https://images.unsplash.com/photo-1574680096145-d05b474e2155?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80.jpg",
    "https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg",
    "https://images.unsplash.com/photo-1554344728-77cf90d9ed26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1546483875-ad9014c88eba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=782&q=80.jpg",
    "https://images.unsplash.com/photo-1552508744-1696d4464960?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        drawer: drawer_widget(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GFCarousel(
                items: imageList.map(
                  (url) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(url,
                            fit: BoxFit.cover, width: double.infinity),
                        // child: CachedNetworkImage(imageUrl: url,fit: BoxFit.cover,width: double.infinity,),
                      ),
                    );
                  },
                ).toList(),
                onPageChanged: (index) {
                  setState(() {
                    index;
                  });
                },
              ),

              // ClipPath(
              //   clipper: WaveClipperOne(),
              //   child: Container(
              //     height: 200,
              //     width: 500,
              //     color: Colors.red,
              //     child: Center(
              //         child: Text(
              //       "DashBoard",
              //       style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //           letterSpacing: 7),
              //     )),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final description = ref.watch(logSignProvider);
                      final users = ref.watch(logSignProvider);
                      return Column(
                        //mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            "About Us",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "A gym is a place where people go to train and exercise, but also to unwind, socialize, and recharge.Therefore, a good gym is a facility that promotes physical activity, provides a safe, functional, and comfortable workout environment, and creates a pleasant and enjoyable atmosphere for recreation and socialization. So, what makes a great gym? The practicality and flexibility of its design, the quality of the equipment, the safety and comfort of the gym environment, the availability of modern amenities, the aesthetic appeal of the facility, the proper maintenance of the premises, the competence and friendly attitude of the staff members? All of these factors – and many others – contribute to the “greatness” of a gym, motivate people to exercise harder, and make them want to come back to the facility.",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              
                              // child: Table(
                              //   border: TableBorder.all(),
                              //   children: [
                              //     TableRow(children: [
                              //       Text(
                              //         "Calories",
                              //         style: TextStyle(fontWeight: FontWeight.bold),
                              //       ),
                              //       Text("Bulking",
                              //           style:
                              //               TextStyle(fontWeight: FontWeight.bold)),
                              //       Text("Cutting",
                              //           style:
                              //               TextStyle(fontWeight: FontWeight.bold)),
                              //     ])
                              //   ],
                              // ),
                              ),
                              Text("Address:Kamalbinayak,Bhaktapur-10\n            Contact No:9860-XXXXXX\n \n \"YOU DIDNT COME THIS FAR TO GIVE UP \n                  HEADS UP AND KILL IT\"",style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
