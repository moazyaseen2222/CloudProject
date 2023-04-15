class DoctorModel {
late int id;
late String name;
late String specialty;
late String address;
late String phoneNumber;
late String image;
late DateTime birthDate;


DoctorModel({
  required this.id,
  required this.name,
  required this.specialty,
  required this.address,
  required this.phoneNumber,
  required this.image,
  required this.birthDate,
});

DoctorModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  specialty = json['specialty'];
  address = json['address'];
  phoneNumber = json['phoneNumber'];
  image = json['image'];
  birthDate = DateTime.parse(json['birthDate']);

}

Map<String, dynamic> toJson() {
  return {
    'id': id,
    'name': name,
    'specialty': specialty,
    'address': address,
    'phoneNumber': phoneNumber,
    'image': image,
    'birthDate': birthDate,
  };
}
}