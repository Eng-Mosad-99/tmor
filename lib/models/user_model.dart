// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String mobile;
  final String fullName;
  final String email;
  final String? img;
  final String? userType;
  final String authenticationCode;
  final String status;
  User({
    required this.id,
    required this.mobile,
    required this.fullName,
    required this.email,
    this.img,
    required this.userType,
    required this.authenticationCode,
    required this.status,
  });

  factory User.fromJSon(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        mobile: map['mobile'],
        fullName: map['full_name'],
        email: map['email'],
        userType: map['user_type'],
        authenticationCode: map['authentication_code'],
        status: map['status'],
        img: map['img']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mobile': mobile,
      'full_name': fullName,
      'email': email,
      'img': img,
      'user_type': userType,
      'authentication_code': authenticationCode,
      'status': status,
    };
  }
}
