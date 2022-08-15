
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/packages/package.dart';
import 'package:gym_app/screens/bmiscreen.dart';
import 'package:gym_app/screens/diet/diet_plan.dart';
import 'package:gym_app/screens/main_screens.dart';
import 'package:native_pdf_view/native_pdf_view.dart';




class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage(this.height,this.weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('YOUR RESULT'),
    
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),
      ),
      body: Result(this.height,this.weight),
    );
  }
}


class Result extends StatefulWidget {

 final int height;
 final int weight;

  Result(this.height,this.weight);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: <Widget>[

        Expanded(

          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width *0.9,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primary

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("$headline",style: TextStyle(
                  color: Colors.white,
                )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${bmiResult(this.widget.height, this.widget.weight)}', style: resultNumber),
                ),
                Column(
                  children: <Widget>[
                    Text('Normal BMI range:',style: TextStyle(
                      color: primaryButtonColor
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18.5 - 25 kg/m",style: headlines,),
                ),
                  ],
                ),
                

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$comment', style: headlines,),
                )
              ],
            ),
          ),        
        ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    diettype(headline);
                  });
                },
                child: Container(
                  width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                                color: primaryButtonColor,
              
                ),
                margin: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Text('Diet', style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                  )),
                  ),
                     ),
              ),
               InkWell(
                onTap: (){
                  setState(() {
                    bodytype(headline);
                    // Get.to(()=>package(headline: headline,),transition: Transition.fadeIn);
                  });
                },
                 child: Container(
                                  width: 150,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                                color: primaryButtonColor,
               
                             ),
                             margin: EdgeInsets.only(top: 10.0),
                             height: MediaQuery.of(context).size.height * 0.1,
                             child: Center(
                  child: Text('Package', style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                  )),
                  ),
                     ),
               ),
            ],
          ),
        ),


      ],
    );
  }
}
var comment = '';
var headline = '';
bmiResult(h,w){
  
  
  double bmi = (w/(h*h))*10000;

  if(bmi<18.4){
    
    comment = "You are UNDERWEIGHT";
    headline = "UNDERWEIGHT";
  }else if(bmi >= 18.5 && bmi <24.99){
    comment = "You are at a HEALTHYWEIGHT.";
    headline = "HEALTHYWEIGHT";
  }else if(bmi > 25 && bmi <= 29.99){
    comment = "You are at OVERWEIGHT.";
    headline = "OVERWEIGHT";
  }else{
    comment = "You are OBESE.";
    headline = "OBESE";
  }

  return bmi.round();
}
void bodytype(String headline){
  switch (headline) {
    case 'UNDERWEIGHT':
        final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/plan.pdf')
  );
  Get.to(()=>      package(headline: headline,controller:pdfController ,)
);
      break;
    case 'HEALTHYWEIGHT':
        final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/plan4.pdf')
  );
  Get.to(()=>      package(headline: headline,controller:pdfController ,)
);
      break;
    case 'OVERWEIGHT':
        final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/plan.pdf')
  );
  Get.to(()=>      package(headline: headline,controller:pdfController ,)
);
      break;

      
    default:
    final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/plan4.pdf')
  );
  Get.to(()=>      package(headline: headline,controller:pdfController ,)
);
break;

  }
}
void diettype(String headline){
  switch (headline) {
    case 'UNDERWEIGHT':
        final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/plan.pdf')
  );
  Get.to(()=>      diet(headline: headline,controller:pdfController ,)
);
      break;
    case 'HEALTHYWEIGHT':
        final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/plan2.pdf')
  );
  Get.to(()=>      diet(headline: headline,controller:pdfController ,)
);
      break;
    case 'OVERWEIGHT':
        final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/cv1.pdf')
  );
  Get.to(()=>      diet(headline: headline,controller:pdfController ,)
);
      break;

      
    default:
    final pdfController = PdfController(
    document: PdfDocument.openAsset('assets/images/plan1.pdf')
  );
  Get.to(()=>      diet(headline: headline,controller:pdfController ,)
);
break;

  }
}

