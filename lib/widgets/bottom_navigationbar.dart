import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/views/friend_communication_page/friend_communication_page.dart';
import 'package:traveling_app_flutter/views/transportation_arrangement_page/transportationScreen.dart';
import 'package:traveling_app_flutter/views/travel_arrangement/travel_arrangement_screen.dart';

import '../dynamic_text_field.dart';
import '../views/front_page/front_page.dart';
import '../views/weather_query_page/wearther_query_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key, String userid = ''});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_currentIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          fixedColor: const Color.fromRGBO(3, 115, 243, 1),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Guide',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Charts',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return FrontPage();
      case 1:
        return DynamicListExample();
      case 2:
        return const TransportationArrangementScreen();
      case 3:
        return const FriendCommunicatioPage();
      default:
        return Container();
    }
  }
}
