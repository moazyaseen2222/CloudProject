import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String specialty;
  final String email;
  final String address;
  final String phoneNumber;

  const ProfilePage({
    required this.name,
    required this.specialty,
    required this.email,
    required this.address,
    required this.phoneNumber
  });



  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade400,


            ),
            onPressed: () {},
            child:
                Text('مراسلة الطبيب',style: GoogleFonts.aBeeZee(fontSize: 17),),


          ),
          const SizedBox(height: 20),
          ListTile(
            leading:  Icon(Icons.email,size: 30,color: Colors.black,),
            title: Text(':  $email',style: GoogleFonts.aBeeZee(fontSize: 20),),
          ),
          ListTile(
            leading:  Icon(Icons.location_on,size: 30,color: Colors.red,),
            title: Text(':  $address',style: GoogleFonts.aBeeZee(fontSize: 20),),
          ),
          ListTile(
            leading:  Icon(Icons.phone,size: 30,color: Colors.green.shade400,),
            title: Text(':  $phoneNumber',style: GoogleFonts.aBeeZee(fontSize: 20)),
          ),
        ],

    );
  }
}
