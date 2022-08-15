import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/providers/crud_provider.dart';

class paymentscreenshot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment Details")),
      body: Consumer(builder: (context, ref, child) {
        final paymentStream = ref.watch(paymentProvider);
        return paymentStream.when(
            data: (data) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final dat = data[index];
                    return Card(
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                dat.fullname,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(
                            height: 9,
                          ),
                          ClipRRect(
                              // borderRadius: BorderRadius.all(
                              //     Radius.circular(20)),
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                placeholder: (context, String) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.pink,
                                    ),
                                  );
                                },
                                imageUrl: dat.payment_screenshot,
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    );
                  });
            },
            error: (err, stack) => Text("$err"),
            loading: () =>
                Center(child: CircularProgressIndicator(color: Colors.purple)));
      }),
    );
  }
}
