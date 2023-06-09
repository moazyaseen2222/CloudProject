import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
 late String id;
 late String name;
 late String email;
 late String image;
 late String phone;
 late String address;
 late String birthDate;
 late String interest;
 late bool notification;


  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
    required this.address,
    required this.birthDate,
    required this.interest,
    required this.notification,
  });

  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    if (doc.data() != null) {
      final data = doc.data()! as Map<String, dynamic>;
      return UserModel(
        id: doc.id,
        name: data['name'],
        email: data['email'],
        image: data['image'],
        phone: data['phone'],
        address: data['address'],
        birthDate: data['birthDate'],
        interest: data['interest'],
        notification: data['notification'],
      );
    } else {
      throw Exception("Document data is null");
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['phone'] = phone;
    data['address'] = address;
    data['birthDate'] = birthDate;
    data['interest'] = interest;
    data['notification'] = notification;
    return data;
  }
}