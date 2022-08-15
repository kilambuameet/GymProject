// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:gym_app/providers/auth_provider.dart';
// import 'package:gym_app/providers/image_provider.dart';
// // import 'package:summer_project/providers/auth_provider.dart';
// // import 'package:summer_project/providers/image_provider.dart';
// // import 'package:summer_project/screens/tournaments.dart';

// class addmember extends StatelessWidget {
//   TextEditingController Name = TextEditingController();
//   TextEditingController Contact= TextEditingController();
//   TextEditingController Email = TextEditingController();
//   TextEditingController Address = TextEditingController();
//   TextEditingController rulesandregulations = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         final designStream = ref.watch(designProvider);
//         final db = ref.watch(imageProvider);

//         return Scaffold(
//           appBar: AppBar(
//             title: Text("Add Member"),
//             centerTitle: true,
//           ),
//           // floatingActionButton: InkWell(
//           //   onTap: () => Get.to(() => Tournaments()),
//           //   child: CircleAvatar(
//           //     backgroundColor: Colors.green,
//           //     child: Icon(Icons.add, color: Colors.red),
//           //   ),
//           // ),

//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: Form(
//                 child: Column(children: [

//                   Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: InkWell(
//                       onTap: () {
//                         ref.read(imageProvider).getImage();
//                       },
//                       child: Container(
//                           height: 300,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Colors.black26,
//                             ),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: db.image == null
//                               ? Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(
//                                       Icons.image,
//                                       size: 50,
//                                       color: Colors.grey,
//                                     ),
//                                     Text(
//                                       "Please Select Image",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         height: 4,
//                                         color: Colors.grey,
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               : Image.file(
//                                   File(db.image!.path),
//                                   fit: BoxFit.fill,
//                                 )),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Name is Required!!';
//                       }
//                       return null;
//                     },
//                     controller: Name,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(
//                             color: Color.fromARGB(255, 78, 206, 46), width: 2.0),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       labelText: 'UserName',
//                       prefixIcon: Icon(
//                         Icons.verified_user,
//                         size: 15,
//                       ),
//                       alignLabelWithHint: true,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Email is Required!!';
//                       }
//                       return null;
//                     },
//                     controller: Email,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(
//                             color: Color.fromARGB(255, 78, 206, 46), width: 2.0),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       labelText:'Email',
//                       prefixIcon: Icon(
//                         Icons.verified_user,
//                         size: 15,
//                       ),
//                       alignLabelWithHint: true,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     maxLines: 10,
//                     minLines: 1,
//                     keyboardType: TextInputType.multiline,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Address is Required!!';
//                       }
//                       return null;
//                     },
//                     controller: Address,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(
//                             color: Color.fromARGB(255, 78, 206, 46), width: 2.0),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       labelText: 'Address',
//                       prefixIcon: Icon(
//                         Icons.verified_user,
//                         size: 15,
//                       ),
//                       alignLabelWithHint: true,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     maxLines: 10,
//                     minLines: 1,
//                     keyboardType: TextInputType.multiline,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Contact is Required!!';
//                       }
//                       return null;
//                     },
//                     controller: Contact,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(
//                             color: Color.fromARGB(255, 78, 206, 46), width: 2.0),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       labelText: 'Contact',
//                       prefixIcon: Icon(
//                         Icons.verified_user,
//                         size: 15,
//                       ),
//                       alignLabelWithHint: true,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     maxLines: 10,
//                     minLines: 1,
//                     keyboardType: TextInputType.multiline,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Rules and Regulations is Required!!';
//                       }
//                       return null;
//                     },
//                     controller: rulesandregulations,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(
//                             color: Color.fromARGB(255, 78, 206, 46), width: 2.0),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       labelText: 'Rules and Regulations',
//                       prefixIcon: Icon(
//                         Icons.verified_user,
//                         size: 15,
//                       ),
//                       alignLabelWithHint: true,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       // _form.currentState!.save();
//                       // FocusScope.of(context).unfocus();
//                       // if (_form.currentState!.validate()) {
//                       //   final response = await ref.read(crudProvider).addpost(
//                       //         image: db.image!,
//                       //         description: eventDescription.text.trim(),
//                       //       );
//                       //   if (response == 'success') {
//                       //     Navigator.pop(context);
//                       //   }
//                       // }
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.09,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Color.fromARGB(255, 44, 102, 226),
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Submit",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   )
//                 ]),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

