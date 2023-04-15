class UserModel{
 late String id;
 late String name;
 late String email;
 late String image;
 late String phone;
 late String address;
 late DateTime birthDate;
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
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    address = json['address'];
    birthDate = DateTime.parse(json['birthDate']);
    interest = json['interest'];
    notification = json['notification'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'phone': phone,
      'address': address,
      'birthDate': birthDate,
      'interest': interest,
      'notification': notification,
    };
  }
}