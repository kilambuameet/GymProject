import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gym_app/models/payment.dart';
import 'package:gym_app/models/user.dart';
import 'package:riverpod/riverpod.dart';
import 'package:image_picker/image_picker.dart';

final crudProvider = Provider.autoDispose((ref) => CrudProvider());
// s    // StreamProvider.autoDispose((ref) => CrudProvider().getMessage());

final paymentProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().getpayment());

class CrudProvider {
  CollectionReference dbCustomer =
      FirebaseFirestore.instance.collection('customers');
  CollectionReference dbpayment =
      FirebaseFirestore.instance.collection('payment');

  Stream<Customer> getSingleUser() {
    final uid = auth.FirebaseAuth.instance.currentUser?.uid;
    final users = dbCustomer.where('customerId', isEqualTo: uid).snapshots();
    return users.map((event) => singleUser(event));
  }

  Customer singleUser(QuerySnapshot querySnapshot) {
    return Customer.fromJson(
        querySnapshot.docs[0].data() as Map<String, dynamic>);
  }

  // Future<String> messageAdd(
  //     {required String message,
  //     required String userId,
  //     required Xfile image,
  //     // required String username,
  //     required String imageUrl,
  //     required String username}) async {
  //   try {
  //     final imageId = DateTime.now().toString();
  //     final ref = FirebaseStorage.instance.ref().child('postImage/$imageId');
  //     final imageFile = File(image.path);
  //     await ref.putFile(imageFile);
  //     final url = await ref.getDownloadURL();
  //     await dbChats.add({
  //       'message': message,
  //       'createdAt': Timestamp.now(),
  //       'userId': userId,
  //       'username': username,
  //       'imageUrl': imageUrl
  //     });
  //     return 'success';
  //   } on FirebaseException catch (e) {
  //     return '${e.message}';
  //   }
  // }
  Future<String> sendpayment(
      {required String fullname,
      required XFile image,
      required String body_type,
      required String package_type}) async {
    try {
      final payment_id = DateTime.now().toString();
      final imageId = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('postPayment/$imageId');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await dbpayment.add({
        'payment_id': payment_id,
        'fullname': fullname,
        'body_type': body_type,
        'package_type': package_type,
        'payment_screenshot': url
      });
      return 'success';
    } on FirebaseException catch (e) {
      return '${e.message}';
    }
  }

  Stream<List<paymentdetails>> getpayment() {
    return dbpayment.snapshots().map((event) => getpaymentsdetils(event));
  }

  List<paymentdetails> getpaymentsdetils(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return paymentdetails(
          fullname: json['fullname'] ?? 'not available',
          payment_screenshot: json['payment_screenshot'] ?? 'not available',
          body_type: json['body_type'],
          package_type: json['package_type'],
          payment_id: json['payment_id']);
    }).toList();
  }
}

final userStream =
    StreamProvider.autoDispose(((ref) => CrudProvider().getSingleUser()));
