import 'package:flutter/material.dart';
import 'package:meetx/resources/auth_methods.dart';
import 'package:meetx/screens/history_meeting_screen.dart';
import 'package:meetx/screens/meeting_screen.dart';
import 'package:meetx/utils/colors.dart';
import 'package:meetx/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    HistoryMeetScreen(),
    const Text("Contacts Here"),
    CustomButton(onPressed: () => AuthMethods().signOut(), text: "LogOut")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "MeetX",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onPageChanged,
        currentIndex: _page,
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: "Meet & Char"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meetings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Settings"),
        ],
      ),
    );
  }
}
