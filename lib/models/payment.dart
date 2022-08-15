class paymentdetails {
  late String fullname;
  late String payment_screenshot;
  late String body_type;
  late String package_type;
  late String payment_id;
  paymentdetails(
      {required this.fullname,
      required this.payment_screenshot,
      required this.body_type,
      required this.package_type,
      required this.payment_id});

  factory paymentdetails.fromJson(Map<String, dynamic> json) {
    return paymentdetails(
        fullname: json['fullname'],
        payment_screenshot: json['screenshot'],
        body_type: json['body_type'],
        package_type: json['payment_type'],
        payment_id: json['payment_id']);
  }
}
