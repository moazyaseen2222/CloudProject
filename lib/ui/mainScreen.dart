import 'package:flutter/material.dart';
import 'package:palliative_care/ui/home.dart';
import 'Chat/chatAll.dart';
import 'categories.dart';
import 'listSetting.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<String> _title = ['الرئيسية', 'الاقسام', 'المحادثات', 'الاعدادات'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar:  AppBar(
        title: Text(_title[_selectedIndex]),
        centerTitle: true,
      ),

      body: Container(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children:  [
            const HomeScreen(),
            const Categories(),
           // NotificationScreen(),
            UserChatScreen(uid: '51ds6f51ds6f51dsf', name: 'Mohannad',),
            listPage(),
           // const ProfilePage(name: 'Moaz',address: 'Gaza',email: 'MOAZ1111@gmail.com',phoneNumber: '05999999',specialty: 'IT'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image: _selectedIndex == 0 ? AssetImage('images/icons/img_8.png') : AssetImage('images/icons/img.png'),
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Image(
              image: _selectedIndex == 1 ? AssetImage('images/icons/img_6.png') : AssetImage('images/icons/img_1.png'),

              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Image(
              image: _selectedIndex == 2 ? AssetImage('images/icons/img_7.png') : AssetImage('images/icons/img_2.png'),
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: _selectedIndex == 3 ? AssetImage('images/icons/img_10.png') : AssetImage('images/icons/img_9.png'),
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          });
        }
      ),
    );
  }
}
