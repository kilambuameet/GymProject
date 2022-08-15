import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:gym_app/member/add_member.dart';
import 'package:gym_app/packages/package.dart';
import 'package:gym_app/providers/auth_provider.dart';
import 'package:gym_app/providers/crud_provider.dart';
import 'package:gym_app/providers/login_provider.dart';
import 'package:gym_app/screens/allscreen.dart';
import 'package:gym_app/screens/bmiscreen.dart';
import 'package:gym_app/screens/dashboard.dart';
import 'package:gym_app/screens/designcollection.dart';
//import 'package:gym_app/screens/diet/diet.dart';
import 'package:gym_app/screens/diet/diet_plan.dart';
import 'package:gym_app/screens/main_screens.dart';
import 'package:gym_app/screens/paymentscreenshot.dart';
import 'package:gym_app/screens/resultpage.dart';
import 'package:gym_app/screens/tips.dart';
//import 'package:gym_app/trainer/add_trainer.dart';
//import 'dashboard.dart';

class drawer_widget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userStream);
    return SafeArea(
      child: user.when(
          data: (data) {
            return Drawer(
              // backgroundColor: Colors.teal,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          child: DrawerHeader(
                            padding: EdgeInsets.only(top: 130),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                image: DecorationImage(
                                    // opacity: .3,
                                    image: NetworkImage(data.customerImage),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                data.cusomtername,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => Home(),
                                  transition: Transition.fadeIn);
                            },
                            leading: Icon(
                              Icons.home,
                              size: 40,
                            ),
                            title: Text("Home"),
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        height: 70,
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => allpackage());
                            },
                            title: Text("Packages"),
                            leading: Icon(
                              Icons.add_business,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                        height: 70,
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => bmicalculator(),
                                  transition: Transition.fadeIn);
                            },
                            title: Text("BMI Calculator"),
                            leading: Icon(
                              Icons.calculate_rounded,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                        Divider(),
                      Container(
                        height: 70,
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => tips(),
                                  transition: Transition.fadeIn);
                            },
                            title: Text("Tips"),
                            leading: Icon(
                              Icons.lightbulb,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      data.customerId == "7o6AKKSQAVP4X7GychXRhhjjuKq2"
                          ? Container(
                              height: 70,
                              child: Card(
                                child: ListTile(
                                  onTap: () {
                                    Get.to(() => paymentscreenshot(),
                                        transition: Transition.fadeIn);
                                  },
                                  title: Text("Payment Details"),
                                  leading: Icon(
                                    Icons.calculate_rounded,
                                    size: 40,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 20,
                            ),
                      Container(
                        height: 70,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            ref.read(logSignProvider).LogOut();
                            ref.refresh(loadingProvider.notifier);
                            // ref.refresh(loadingProvider);
                          },
                          leading: Icon(
                            Icons.exit_to_app,
                            size: 40,
                          ),
                          title: Text("Logout"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          error: (err, stack) => Text('$err'),
          loading: () => Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )),
    );
  }
}
