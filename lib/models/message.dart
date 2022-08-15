class message {
  late final String text;
  late final String username;
  late final String imageUrl;
  late final String userId;
  late final String payment_image;

  message({
    required this.text,
    required this.username,
    required this.imageUrl,
    required this.userId,
    required this.payment_image,
  });

  factory message.fromJson(Map<String, dynamic> json) {
    return message(
        text: json['message'],
        username: json['username'],
        imageUrl: json['imageUrl'],
        userId: json['userId'],
        payment_image: json['payment_image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
      'username': this.username,
      'message': this.text,
      'userId': this.userId,
      'payment_image': this.payment_image
      // 'createdAt': this.createat
    };
  }
}
