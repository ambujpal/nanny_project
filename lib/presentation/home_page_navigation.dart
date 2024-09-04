import 'package:flutter/material.dart';
import 'package:nany/provider/home_navigation_provider.dart';
import 'package:nany/utils/app_colors.dart';
import 'package:nany/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class HomePageNavigation extends StatelessWidget {
  const HomePageNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNavigationProvider>(
        builder: (context, provider, child) {
      return Scaffold(
        body: SafeArea(child: provider.pageList[provider.selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryColor,
          selectedLabelStyle: AppTextStyle.ts14BW,
          unselectedItemColor: AppColors.black,
          unselectedLabelStyle: AppTextStyle.ts14MB,
          currentIndex: provider.selectedIndex,
          onTap: (value) => provider.changeBottomNavbarItem(value),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield_outlined),
              label: 'Package',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      );
    });
  }
}
