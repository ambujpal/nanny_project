import 'package:flutter/material.dart';
import 'package:nany/utils/app_text_style.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Package Page",
          style: AppTextStyle.ts14LB,
        ),
      ),
    );
  }
}
