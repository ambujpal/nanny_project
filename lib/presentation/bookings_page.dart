import 'package:flutter/material.dart';
import 'package:nany/utils/app_text_style.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Booking Page",
          style: AppTextStyle.ts14LB,
        ),
      ),
    );
  }
}
