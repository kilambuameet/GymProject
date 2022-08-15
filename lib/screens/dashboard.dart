// import 'package:flutter/material.dart';

// class dashboard extends StatefulWidget {
 

//   @override
//   State<dashboard> createState() => _dashboardState();
// }

// class _dashboardState extends State<dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//           child:Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Icon(Icons.menu,color:Colors.white,size:50.0),
//               Image.asset("")
//             ],

//           ),
//           ),
//           Padding(padding: const EdgeInsets.all(18.0),
//           child: Text("DashBoard Options",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 28.0,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.start,
//           ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Center(child: Wrap(
//               spacing: 20.0,
//               runSpacing: 20.0,
//               children: [
//                 SizedBox(
//                   width: 160.0,
//                   height: 160.0,
//                   child: Card(
//                     color: Color.fromARGB(255, 21, 21, 21),
//                     elevation: 2.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0)
//                        ),
//                        child: Center(child: Padding(
//                          padding:const EdgeInsets.all(8.0),
//                          child: Column(
//                            children: [
//                              Image.asset("assets/images/Gym App Logo.png"),
//                              SizedBox(
//                                height: 10.0,
                               
//                              ),
//                              Text("Packages",style:TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 20.0

//                              )),
//                              SizedBox(height:5.0),
//                              Text("10 Items",style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.w100
//                              ),)
//                            ],
//                          ),
//                           )),
//                   ),
//                 ),
//                  SizedBox(
//                   width: 160.0,
//                   height: 160.0,
//                   child: Card(
//                     color: Color.fromARGB(255, 21, 21, 21),
//                     elevation: 2.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0)
//                        ),
//                        child: Center(child: Padding(
//                          padding:const EdgeInsets.all(8.0),
//                          child: Column(
//                            children: [
//                              Image.asset("assets/images/trainer.jpg"),
//                              SizedBox(
//                                height: 10.0,
                               
//                              ),
//                              Text("Trainers",style:TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 20.0

//                              )),
//                              SizedBox(height:5.0),
//                              Text("10 Items",style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.w100
//                              ),)
//                            ],
//                          ),
//                           )),
//                   ),
//                 ),
//                  SizedBox(
//                   width: 160.0,
//                   height: 160.0,
//                   child: Card(
//                     color: Color.fromARGB(255, 21, 21, 21),
//                     elevation: 2.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0)
//                        ),
//                        child: Center(child: Padding(
//                          padding:const EdgeInsets.all(8.0),
//                          child: Column(
//                            children: [
//                              Image.asset("assets/images/members.jpg"),
//                              SizedBox(
//                                height: 10.0,
                               
//                              ),
//                              Text("Members",style:TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 20.0

//                              )),
//                              SizedBox(height:5.0),
//                              Text("10 Items",style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.w100
//                              ),)
//                            ],
//                          ),
//                           )),
//                   ),
//                 ),
//                  SizedBox(
//                   width: 160.0,
//                   height: 160.0,
//                   child: Card(
//                     color: Color.fromARGB(255, 21, 21, 21),
//                     elevation: 2.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0)
//                        ),
//                        child: Center(child: Padding(
//                          padding:const EdgeInsets.all(8.0),
//                          child: Column(
//                            children: [
//                              Image.asset("assets/images/deit.jpg"),
//                              SizedBox(
//                                height: 10.0,
                               
//                              ),
//                              Text("Meal Plan",style:TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold,
//                                fontSize: 20.0

//                              )),
//                              SizedBox(height:5.0),
//                              Text("10 Items",style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.w100
//                              ),)
//                            ],
//                          ),
//                           )),
//                   ),
//                 )
//               ],
//             )),
//              ),
//         ],
//       )),
      
//     );
//   }
// }