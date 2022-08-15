
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:gym_app/screens/auth_screen.dart';
import 'package:gym_app/screens/main_screens.dart';


import 'screens/status_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));

  runApp(ProviderScope(child: myapp()));
   //runApp(DevicePreview(builder: (context) => ProviderScope(child: myapp())));

}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //  useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: ThemeData(primaryColor: Color(0xffE26A2C)),
      
      debugShowCheckedModeBanner: false,
      home: StatusCheck(),
    );
    
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: StatusCheck(),
    // );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gym_app/packages/package.dart';
// import 'package:gym_app/screens/main_screens.dart';
// import 'package:gym_app/screens/status_check.dart';
// import 'package:native_pdf_view/native_pdf_view.dart';

// void main(){
//   runApp(myapp());
// }
// class myapp extends StatefulWidget {
//   const myapp({ Key? key }) : super(key: key);

//   @override
//   State<myapp> createState() => _myappState();
// }

// class _myappState extends State<myapp> {
  
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: StatusCheck(),
//     );
//   }
// }
