import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption_app/controller/controller.dart';
import 'package:pet_adoption_app/screens/details_page.dart';
import 'package:pet_adoption_app/screens/history_page.dart';

import 'home_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

List pages = [const HomePage(), const HistoryPage()];
int selectedIndex = 0;

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: selectedIndex,
          onTap: (value) {
            if (value == 1) {
              Get.find<HomeController>().getPetHistory();
            }
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
          ],
        ),
        body: pages[selectedIndex],
      ),
    );
  }
}
