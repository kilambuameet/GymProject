
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/providers/auth_provider.dart';
import 'package:gym_app/screens/auth_screen.dart';
//import 'package:gym_app/screens/dashboard.dart';
import 'package:gym_app/screens/main_screens.dart';



class StatusCheck extends StatelessWidget {
  const StatusCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      
      builder: (context, ref, child) {
        final auth = ref.watch(authProvider);
        return auth.when(
            data: (data) {
              if (data == null) {
                return AuthScreen();
              } else {
                return Home();
              }
            },
            error: (err, stack) => Text("$err"),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ));
      },
      
    );
    
  }
}
