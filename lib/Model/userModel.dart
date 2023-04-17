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

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    address = json['address'];
    birthDate = json['birthDate'];
    interest = json['interest'];
    notification = json['notification'];
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