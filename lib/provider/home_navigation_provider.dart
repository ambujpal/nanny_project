import 'package:flutter/material.dart';
import 'package:nany/presentation/bookings_page.dart';
import 'package:nany/presentation/home_page.dart';
import 'package:nany/presentation/package_page.dart';
import 'package:nany/presentation/profile_page.dart';

class HomeNavigationProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<Widget> pageList = [
    const HomePage(),
    const PackagePage(),
    const BookingsPage(),
    const ProfilePage(),
  ];

  void changeBottomNavbarItem(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
