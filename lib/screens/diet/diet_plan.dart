


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/screens/bmiscreen.dart';
import 'package:gym_app/screens/drawer_widget.dart';
import 'package:gym_app/screens/resultpage.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class diet extends StatefulWidget {
late String headline;
final PdfController controller;
diet({required this.headline,required this.controller});
  @override
  State<diet> createState() => _dietState();
}

class _dietState extends State<diet> {
 

  // final pdfController = PdfController(
  //   document: PdfDocument.openAsset('assets/images/cv1.pdf')
  // );
  // final PDF = PdfController(
  //   document: PdfDocument.openAsset('assets/images/resume.pdf')
  // );
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Diet Type"),
          ),
          drawer: drawer_widget(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(headline,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                      ),
                     child: PdfView(controller: widget.controller)),
                     // child: Text(headline)),
                  ),
                SizedBox(
                  height: 40,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: InkWell(
                //     onTap: (){
                //       setState(() {
                //         Get.to(()=>bmicalculator(),transition: Transition.fadeIn);
                //       });
                //     },
                //     child: Container(
                //       height: 50,
                //       width: double.infinity,
                //       decoration: BoxDecoration(
                //         color: Colors.red,
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       child: Center(
                //         child: Text('BMI ',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontSize: 20),
                //     ),
                //       ),
                  
                //     ),
                //   ),
                // )
                ],
              ),
            ),
      
            
          ),
        ),
      ),
    );
  }



}
