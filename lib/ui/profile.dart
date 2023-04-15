import 'package:flutter/material.dart';

class DoctorProfilePage extends StatelessWidget {
  final String name;
  final String specialty;
  final String address;
  final String phoneNumber;

  DoctorProfilePage({
    required this.name,
    required this.specialty,
    required this.address,
    required this.phoneNumber,
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
              'https://img.freepik.com/premium-vector/doctor-icon-avatar-white_136162-58.jpg?w=2000',
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            specialty,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('مراسلة الطبيب'),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(address),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(phoneNumber),
          ),
        ],
      ),
    );
  }
}
