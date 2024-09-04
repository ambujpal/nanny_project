import 'package:flutter/material.dart';
import 'package:nany/utils/app_text_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile Page",
          style: AppTextStyle.ts14LB,
        ),
      ),
    );
  }
}
