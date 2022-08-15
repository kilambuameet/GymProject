import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:gym_app/providers/login_provider.dart';
import 'package:gym_app/screens/bmiscreen.dart';
import 'package:gym_app/screens/drawer_widget.dart';

import '../providers/auth_provider.dart';
import '../providers/image_provider.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class AuthScreen extends StatelessWidget {
  final customerNameController = TextEditingController();
  final customermailController = TextEditingController();
  final customerpassController = TextEditingController();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Flutter is all about widgets!!!!!'),
        elevation: 0,
      ),
      
       // drawer: drawer_widget(),
         body: Consumer(builder: (context, ref, child) {
           final isLogin = ref.watch(loginProvider);
           final db = ref.watch(imageProvider);
           final isLoading = ref.watch(loadingProvider);
           return SingleChildScrollView(
             
             child: Column(
               children: [
                 ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                      isLogin?"LOGIN FORM":"SIGN UP",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,letterSpacing: 7),
                    )),
                  ),
                ),
                 Form(
                   key: _form,
                   child: Padding(
                     padding:
                         const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                    
                          if (isLogin)
                          CircleAvatar(
                           radius: 110,
                           
                           backgroundImage: AssetImage("assets/images/Gym App Logo.png",),),
                          
                         SizedBox(
                           height: 30,
                         ),
                         if (!isLogin)
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical: 10),
                             child: TextFormField(
                               controller: customerNameController,
                               decoration: InputDecoration(hintText: 'Username'),
                             ),
                           ),
                         if (!isLogin)
                           InkWell(
                             onTap: () {
                               ref.read(imageProvider).getImage();
                             },
                             child: Padding(
                               padding: const EdgeInsets.symmetric(vertical: 10),
                               child: Container(
                                 height: 200,
                                 child: db.image == null
                                     ? Center(
                                         child: Text('Please select an image'),
                                       )
                                     : Image.file(
                                         File(db.image!.path),
                                         fit: BoxFit.fill,
                                       ),
                               ),
                             ),
                           ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: TextFormField(
                             controller: customermailController,
                             decoration: InputDecoration(hintText: 'Email'),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(vertical: 10),
                           child: TextFormField(
                             controller: customerpassController,
                             obscureText: true,
                             decoration: InputDecoration(hintText: 'Password'),
                           ),
                         ),
                         SizedBox(
                           height: 15,
                         ),
                         Container(
                           height: 45,
                           child: ElevatedButton(
                             onPressed: () async {
                               _form.currentState!.save();
                               ref.read(loadingProvider.notifier).toogle();
                               FocusScope.of(context).unfocus();
                               if (isLogin) {
                                 final response = ref.read(logSignProvider).Login(
                                     email: customermailController.text.trim(),
                                     password: customerpassController.text.trim());
                        
                                 if (response == 'success') {
                                   ref.read(loadingProvider.notifier).toogle();
                        
                                   Get.showSnackbar(GetSnackBar(
                                     title: 'Got some error',
                                     duration: Duration(seconds: 1),
                                     message: 'Check the password',
                                   ));
                                 }
                               } else {
                                 if (db.image == null) {
                                   Get.defaultDialog(
                                       title: 'please provide an image',
                                       content: Text('image must be select'));
                                 } else {
                                   ref.read(logSignProvider).signUp(
                                       customerName:
                                           customerNameController.text.trim(),
                                       email: customermailController.text.trim(),
                                       password:
                                           customerpassController.text.trim(),
                                       image: db.image!);
                                 }
                               }
                             },
                             child: isLoading
                                 ? Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text(
                                         'Loading Please Wait',
                                         style: TextStyle(fontSize: 15),
                                       ),
                                       CircularProgressIndicator(
                                         color: Colors.white,
                                       ),
                                     ],
                                   )
                                 : Text('Submit'),
                           ),
                         ),
                         Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                                 onPressed: () {
                                   if (customermailController.text.isNotEmpty) {
                                     ref.read(logSignProvider).ResetPassword(
                                         customermailController.text.trim());
                                   } else {
                                     Get.showSnackbar(GetSnackBar(
                                       title: 'Email not provided',
                                       duration: Duration(seconds: 1),
                                       message: 'Please Provide the email',
                                     ));
                                   }
                                 },
                                 child: Text(isLogin ? 'Forget Password?' : '')),
                         ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Text(
                               isLogin
                                   ? 'Don\'t have an account?'
                                   : 'Already have an account?',
                               style: TextStyle(
                                   fontStyle: FontStyle.normal,
                                   fontWeight: FontWeight.bold),
                             ),
                             TextButton(
                                 onPressed: () {
                                   ref.read(loginProvider.notifier).toogle();
                                 },
                                 child: Text(isLogin ? 'SignUp' : 'Login')),
                             
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           );
         }));
  }
}
