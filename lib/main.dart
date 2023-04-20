import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:palliative_care/ui/Authentication/LoginScreen.dart';
import 'package:palliative_care/ui/Authentication/signUp_1.dart';
import 'package:palliative_care/ui/Authentication/Who.dart';
import 'package:palliative_care/ui/add_post.dart';
import 'package:palliative_care/ui/categories/alternatvie_medicine.dart';
import 'package:palliative_care/ui/categories/cancer.dart';
import 'package:palliative_care/ui/categories/categories.dart';
import 'package:palliative_care/ui/Chat/chat.dart';
import 'package:palliative_care/ui/categories/heart.dart';
import 'package:palliative_care/ui/categories/mentalHealth.dart';
import 'package:palliative_care/ui/categories/pysical_health.dart';
import 'package:palliative_care/ui/categories/sokari.dart';
import 'package:palliative_care/ui/home.dart';
import 'package:palliative_care/ui/listSetting.dart';
import 'package:palliative_care/ui/mainScreen.dart';
import 'package:palliative_care/ui/notification.dart';
import 'package:palliative_care/ui/profile.dart';
import 'package:palliative_care/ui/settings.dart';
import 'package:palliative_care/ui/test.dart';

import 'firebase_options.dart';
import 'ui/Authentication/signUp_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        debugShowCheckedModeBanner: false,

      title: 'Palliative Care',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lora',
        primaryColor: const Color(0xFF66CA98),
        scaffoldBackgroundColor: const Color(0xFFE5E5E5),
        canvasColor: const Color(0xFFE5E5E5),
      ),
      themeMode: ThemeMode.system,
      textDirection: TextDirection.rtl,

      routes: {
        '/who':(context) => Who(),
        '/login':(context) => LoginScreen(),
        '/signup':(context) => SignUp(),
        '/signup2':(context) => SignUp_2(),
        '/home':(context) => const HomeScreen(),
       // '/profile':(context) => DoctorProfilePage(),
        '/chat':(context) => const ChatScreen(),
        '/notifications':(context) => NotificationScreen(),
        '/categories':(context) => const Categories(),
        '/add_post':(context) => const AddPost(),
        '/settings':(context) => const Settings(),
        '/profile':(context) => const ProfilePage(name: 'Moaz',address: 'Gaza',email: 'MOAZ1111@gmail.com',phoneNumber: '05999999',specialty: 'IT'),
        '/list':(context) =>  listPage(),
        '/':(context) => const MainScreen(),
        '/chatScreen':(context) => const ChatScreen(),
        '/heartScreen':(context) => const HeartScreen(),
        '/sokariScreen':(context) => const SokariScreen(),
        '/pycsicalScreen':(context) => const PysicalHealth(),
        '/alternativScreen':(context) => const AlternativeScreen(),
        '/mentalScreen':(context) => const MentalHealth(),
        '/cancerScreen':(context) => const CancerScreen(),
        '/mainScreen':(context) => const MainScreen(),
        '/test':(context) =>  Test(),
      },

      initialRoute: '/mainScreen',
      /*(name: 'Moaz',address: 'Gaza',email: 'MOAZ1111@gmail.com',phoneNumber: '05999999',specialty: 'IT')*/
    );
  }
}
